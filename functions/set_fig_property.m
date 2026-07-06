function set_fig_property(height_inch, width_inch, close_fig)
% Set figure property
%
% - Input
%  height_inch : Height of figure [inch]
%  width_inch : Width of figure [inch]
%
% Copyright (C) 2011, ATR All Rights Reserved.
% License : New BSD License(see VBMEG_LICENSE.txt)

dpi = 300;
set(0, 'defaultFigureWindowStyle', 'normal')
set(0, 'defaultFigureUnit', 'Pixel')
scsz = get(0, 'ScreenSize');
set(0, 'defaultFigurePosition', [1+80 scsz(4)-height_inch*dpi-150 width_inch*dpi height_inch*dpi]);
set(0, 'defaultFigureColor', [1 1 1]);
set(0, 'defaultTextFontSize', 20);
set(0, 'defaultAxesFontSize', 15);
set(0, 'defaultAxesLineWidth', 1.5);
set(0, 'defaultLineLineWidth', 2);

if ~exist('close_fig', 'var')
    close_fig = 1;
end
if close_fig
    close all
end