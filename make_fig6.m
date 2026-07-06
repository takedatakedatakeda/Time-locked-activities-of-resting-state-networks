% Example code to reproduce Fig. 6
clear
addpath('functions')
set_fig_property(4, 2, 1)

% Load data
load data/fig6
load data/brain

% Show transition from VIS1 to DMN (A)
apat = trans_vis2dmn;
mi = min(min(apat(ix_cortex, :)));
ma = max(apat(:));
th_show = 0.1;
for t = 1:13
    figure('Name', [num2str(t/sr*1000) ' ms'], 'NumberTitle', 'off');
    x = apat(:, t);
    show_brain_vertical(plot_parm, V, F, inf_C, x, mi, ma, th_show);
end

% Show transition from DMN to VIS1 (B)
close all
apat = trans_dmn2vis;
mi = min(min(apat(ix_cortex, :)));
ma = max(apat(:));
th_show = 0.1;
for t = 1:13
    figure('Name', [num2str(t/sr*1000) ' ms'], 'NumberTitle', 'off');
    x = apat(:, t);
    show_brain_vertical(plot_parm, V, F, inf_C, x, mi, ma, th_show);
end

% Show transition from DMN to SMN (C)
close all
apat = trans_dmn2smn;
mi = min(min(apat(ix_cortex, :)));
ma = max(apat(:));
th_show = 0.1;
for t = 1:7
    figure('Name', [num2str(t/sr*1000) ' ms'], 'NumberTitle', 'off');
    x = apat(:, t);
    show_brain_vertical(plot_parm, V, F, inf_C, x, mi, ma, th_show);
end

% Show transition from SMN to DMN (D)
close all
apat = trans_smn2dmn;
mi = min(min(apat(ix_cortex, :)));
ma = max(apat(:));
th_show = 0.1;
for t = 1:7
    figure('Name', [num2str(t/sr*1000) ' ms'], 'NumberTitle', 'off');
    x = apat(:, t);
    show_brain_vertical(plot_parm, V, F, inf_C, x, mi, ma, th_show);
end
