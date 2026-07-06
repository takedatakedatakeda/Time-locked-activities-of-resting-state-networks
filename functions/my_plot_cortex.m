function h = my_plot_cortex(plot_parm, V, F, inf_C, J, Jmin, Jmax, threshold)
% Plot cortical surface model.
% (VBMEG public function)
%
% [syntax]
% vb_plot_cortex(plot_parm,V,F)
% vb_plot_cortex(plot_parm,V,F,inf_C)
% vb_plot_cortex(plot_parm,V,F,inf_C,J)
% vb_plot_cortex(plot_parm,V,F,inf_C,J,Jmin)
% vb_plot_cortex(plot_parm,V,F,inf_C,J,Jmin,Jmax)
% vb_plot_cortex(plot_parm,V,F,inf_C,J,Jmin,Jmax,ix_area)
%
% [input]
% plot_parm: <<struct>> Plotting parameters.
% --- fields of plot_parm
%  LRflag: <<string>> Specifying hemisphere for plotting.
%   'LR' for both hemishepre
%   'L' for left hemisphere
%   'R' for both hemisphere
%  wmode : <<bool>> If true, absolute value of 'J' is plotted. Otherwise,
%          raw value of 'J' is plotted.
%  paint : <<bool>> If true,
%  cmap  : <<int>> Colormap (1: hot, otherwise: jet).
%  isact : <optional> <<bool>> If true, activity map is superimposed on
%         cortical surface.
%  color : <optional> <<vector>>
%  index : <optional> <<vector>>
%  area  : <optional> <<struct>>
%  --- fields of plot_parm.area
%   area_file: <<string>>
%   key      : <<cell string>>
%   clr      : <<cell string/3d vector>>
%   str      : <optional> <<cell string>>
%   Rlabel   : <optional> <<double>> Distance between string and area.
%  ---
% ---
% V        : <<matrix>> Vertices of cortical surface model.
% F        : <<matrix>> Faces of cortical surface model.
% inf_C    : <<vector>> Color of sulcus/gyrus. It should be empty when
%                       plotting folded surface model.
%
% [output]
% h: Handle of light.
%
% [example]
% % Load inflated standard brain model
% [V,F,xx,inf_C] = vb_load_cortex(brainfile,'Inflate');
%
% % Load current and current information
% [Jinfo, J] = vb_load_current(currentfile);
%
% % get loaded data index between 80[msec] to 120[msec]
% ix = intersect(find(Jinfo.Tmsec>80), find(Jinfo.Tmsec<120));
%
% % Average current between 80msec to 120msec
% Jplot = mean(J(:, ix), 2);
%
% % set viewpoint
% view([10, -2]);
%
% % plot current on cortical inflate model
% plot_parm = vb_set_plot_parm;
% vb_plot_cortex(plot_parm,V,F,inf_C,Jplot);
%
% axis equal;
% axis off;
%
% [history]
% 2009-01-26 taku-y
% 2010-12-27 taku-y
%  [minor] Not superimpose activity (not invoke patch fnc) if all values
%  do not exceed threshold.
% 2012-02-09 taku-y
%  [enhancement] If isfield(area,'clr'), plor_parm.area{i}.clr is
%  replaced with a.clr, where a=vb_get_area(area_file,area_key{i}).
% 2012-03-14 taku-y
%  [minor] Check color value in a.clr, where
%  a=vb_get_area(area_file,area_key).
%
% Copyright (C) 2011, ATR All Rights Reserved.
% License : New BSD License(see VBMEG_LICENSE.txt)


% color of cortical surface
if isfield(plot_parm,'color') & ~isempty(plot_parm.color)
    fclr = plot_parm.color;
else
    fclr = [0.8 0.8 0.8];
end

if ~isfield(plot_parm,'isact'),
    plot_parm.isact = true;
end

% Left/Right hemisphere
switch plot_parm.LRflag
    case 'L'
        F0 = F.F3L;
    case 'R'
        F0 = F.F3R;
    case 'LR'
        F0 = F.F3;
end

if isempty(inf_C)
    inflate = false;
else
    inflate = true;
end
Vshrink = vb_shrink_cortex_for_plot(V, F0, inflate);

% --- Select visible patches
if ~isfield(plot_parm,'index'), index = [];
else index = plot_parm.index; end
if length(index) == 0, FF = F0;
else FF = vb_patch_select2(index,F0,size(V,1)); end

% --- Plot cortical surface
h = gcf;
set(h, 'renderer', 'zbuffer');
if isempty(inf_C)
    % Display patches
    patch('Faces',FF,'Vertices',Vshrink,'FaceColor',fclr, ...
        'FaceLighting','phong','EdgeColor','none', ...
        'Tag', 'vb_plot_cortex_brain');
    
    % Light
    h = camlight('headlight');
else
    c = repmat(fclr,[length(inf_C) 1]) ...
        -0.4*[fclr(1)*inf_C fclr(2)*inf_C fclr(3)*inf_C];
    patch('Faces',FF,'Vertices',Vshrink,'FaceColor','interp',...
        'EdgeColor','none','FaceVertexCData',c, ...
        'Tag', 'vb_plot_cortex_brain');
    h = [];
end

material dull;
hold on;

max_xyz = max(abs(V), [], 1);
axis([-max_xyz(1) max_xyz(1) -max_xyz(2) max_xyz(2) -max_xyz(3) max_xyz(3)])
axis equal off

% --- Superimpose activity
if plot_parm.isact & ~isempty(J),
    plot_value(plot_parm, V, F0, J, Jmin, Jmax, threshold);
end

% To avoid MATLAB alpha bug(R2014b to R2015b)
if vb_matlab_version('>=', '8.4') && vb_matlab_version('<=', '8.6')
    % reset alpha value of brain to 0.99
    t = timer('Name', 'vb_plot_cortex', 'StartDelay', 1, ...
        'TimerFcn', 'alpha(findobj(gca, ''Tag'', ''vb_plot_cortex_brain''), 0.99);', ...
        'ExecutionMode', 'singleshot');
    start(t);
end

return;

% --- Inner function: plot cortical activity
function plot_value(plot_parm, V, F0, J, Jmin, Jmax, threshold);

if length(J) == 0
    return;
end

% Left/Right hemisphere
tmp2 = zeros(length(J),1);
tmp2(unique(F0(:))) = 1;

tmp = J.*tmp2;
ix = find(abs(tmp) >= Jmax*threshold);

% Superimpose activity on cortical surface
FF = vb_patch_select2(ix, F0, size(V, 1));
patch('Faces',FF,'Vertices',V,'FaceColor','interp',...
    'FaceVertexCData',J,'EdgeColor','none',...
    'FaceLighting','none','FaceAlpha', 1);
material dull;

caxis([Jmin Jmax]);

if plot_parm.cmap==1
    colormap(hot);
else
    colormap(jet);
end

return;

