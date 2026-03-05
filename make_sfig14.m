% Example code to reproduce SFig. 
clear
addpath('functions')
set_fig_property(4, 2, 1)

% Load data
load data/sfig14
load data/brain

% Show sample spatiotemporal pattern in alpha band (A)
mi = min(min(apat(ix_cortex, :)));
ma = max(apat(:));
th_show = 0.1;
N = size(apat, 2);
for t = 5:5:N
    figure('Name', [num2str(t/sr*1000) ' ms'], 'NumberTitle', 'off');
    x = apat(:, t);
    show_brain_vertical(plot_parm, V, F, inf_C, x, mi, ma, th_show);
end

% Show selected vertices (B)
set_fig_property(4, 3, 0)
figure
subplot(4, 2, 1)
x = zeros;
plot_parm.LRflag = 'L';
my_plot_cortex(plot_parm, V, F, inf_C, [], 0.1, 1, 0.1);
view([90 0])
hold on
plot3(V(v_vis, 1), V(v_vis, 2), V(v_vis, 3), 'ro', 'markersize', 5, 'markerfacecolor', 'r')
title('V1')
subplot(4, 2, 2)
plot_parm.LRflag = 'L';
my_plot_cortex(plot_parm, V, F, inf_C, [], 0.1, 1, 0.1);
view([90 0])
hold on
plot3(V(v_dmn, 1), V(v_dmn, 2), V(v_dmn, 3), 'ro', 'markersize', 5, 'markerfacecolor', 'r')
title('PCC')

% Show sample pattern and correlation with fMRI-RSN (C)
ma = max([apat_vis; apat_dmn])*1.1;
subplot(4, 2, 3)
yyaxis left
plot(time, apat_vis, 'b')
hold on
[~, b] = max(apat_vis);
plot(time(b), apat_vis(b), 'k*')
ylim([0 ma])
yyaxis right
plot(time, r_btw_pat_and_vis, 'r')
[~, b] = max(r_btw_pat_and_vis);
plot(time(b), r_btw_pat_and_vis(b), 'k*')
grid on
ylabel('Correlation with fMRI-VIS1')
ax = gca;
ax.YAxis(1).Color = 'b';
ax.YAxis(2).Color = 'r';

subplot(4, 2, 4)
yyaxis left
plot(time, apat_dmn, 'b')
hold on
[~, b] = max(apat_dmn);
plot(time(b), apat_dmn(b), 'k*')
ylim([0 ma])
yyaxis right
plot(time, r_btw_pat_and_dmn, 'r')
[~, b] = max(r_btw_pat_and_dmn);
plot(time(b), r_btw_pat_and_dmn(b), 'k*')
grid on
ylabel('Correlation with fMRI-VIS1')
ax = gca;
ax.YAxis(1).Color = 'b';
ax.YAxis(2).Color = 'r';

% Show phases after onsets of sample pattern (D)
subplot(4, 2, 5)
Non = size(phase_vis, 1);
imagesc(time, 1:Non, phase_vis)
set(gca, 'xtick', [0 0.05 1], 'xticklabel', [0 0.05 0.1])
colorbar
subplot(4, 2, 6)
imagesc(time, 1:Non, phase_dmn)
set(gca, 'xtick', [0 0.05 1], 'xticklabel', [0 0.05 0.1])
colorbar
colormap('jet')

% Show histogram of phase differences (E)
d = phase_vis-phase_dmn;
d = d(:);
subplot(4, 2, 8)
polarhistogram(d, 12*3)
