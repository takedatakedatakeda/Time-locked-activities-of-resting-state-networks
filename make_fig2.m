% Example code to reproduce Fig. 2
clear
addpath('functions')
set_fig_property(4, 2, 1)

% Load data
load data/fig2
load data/brain

% Show sample spatiotemporal pattern (A)
mi = min(min(apat(ix_cortex, :)));
ma = max(apat(:));
th_show = 0.1;
N = size(apat, 2);
for t = 5:5:N
    figure('Name', [num2str(t/sr*1000) ' ms'], 'NumberTitle', 'off');
    show_brain_vertical(plot_parm, V, F, inf_C, apat(:, t), mi, ma, th_show);
end

% Show correlation coefficients between sample pattern and fMRI-RSNs (B)
set_fig_property(1.5, 4, 0)
figure
Nband0 = length(Band_name0);
Nrsn = size(r_pat_rsn, 1);
ma = max(abs(r_pat_rsn(:)));
for band = 1:Nband0
    subplot(2, 3, band)
    imagesc(x*1000, 1:Nrsn, r_pat_rsn(:, :, band))
    caxis([-ma ma])
    xlabel('Time [ms]')
    colorbar
    set(gca, 'ytick', 1:Nrsn, 'yticklabel', y)
    title(Band_name0{band})
end
colormap('jet')


