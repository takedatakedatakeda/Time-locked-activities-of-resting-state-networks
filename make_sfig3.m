% Example code to reproduce SFig. 3
clear
addpath('functions')
set_fig_property(4.5, 5, 1)

% Load data
load data/sfig3
load data/brain

% Show resting-state networks of fMRI
Nrsn = size(rsn, 2);
clim = zeros(Nrsn, 2);
for n = 1:Nrsn
    clim(n, :) = [-max(abs(rsn(:, n))) max(abs(rsn(:, n)))];
end
show_brain(plot_parm, V, F, inf_C, rsn, rsn_name, clim)


