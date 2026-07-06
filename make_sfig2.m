% Example code to reproduce SFig. 2
clear
addpath('functions')
set_fig_property(4, 2, 1)

% Load data
load data/sfig2
load data/brain

% Show power distribution of source current (A)
Nband = length(Band_name0);
pow = pow_cur;
th_show = 0.1;
for band = 1:Nband
    figure('Name', Band_name0{band}, 'NumberTitle', 'off');
    x = pow(:, band);
    mi = min(x(ix_cortex));
    ma = max(x(ix_cortex));
    show_brain_vertical(plot_parm, V, F, inf_C, x, mi, ma, th_show);
end

% Show power distribution of spatiotemporal pattern (B)
close all
pow = pow_pat;
for band = 1:Nband
    figure('Name', Band_name0{band}, 'NumberTitle', 'off');
    x = pow(:, band);
    mi = min(x(ix_cortex));
    ma = max(x(ix_cortex));
    show_brain_vertical(plot_parm, V, F, inf_C, x, mi, ma, th_show);
end

