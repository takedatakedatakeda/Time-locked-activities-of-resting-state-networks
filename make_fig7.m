% Example code to reproduce Fig. 7
clear
addpath('functions')
set_fig_property(4, 2, 1)

% Load data
load data/fig7
load data/brain

% Show peak times in transition from VIS1 to DMN (A)
x = peak_time_vis2dmn(:, 1);
mi = min(x(ix_cortex));
ma = max(x(:));
th_show = 0.001;
show_brain_vertical(plot_parm, V, F, inf_C, x, mi, ma, th_show);

% Show peak times in transition from DMN to VIS1 (B)
figure
x = peak_time_dmn2vis(:, 1);
mi = min(x(ix_cortex));
ma = max(x(:));
show_brain_vertical(plot_parm, V, F, inf_C, x, mi, ma, th_show);

% Show peak times in transition from DMN to SMN (C)
figure
x = peak_time_dmn2smn(:, 1);
mi = min(x(ix_cortex));
ma = max(x(:));
show_brain_vertical(plot_parm, V, F, inf_C, x, mi, ma, th_show);

% Show peak times in transition from SMN to DMN (D)
figure
x = peak_time_smn2dmn(:, 1);
mi = min(x(ix_cortex));
ma = max(x(:));
show_brain_vertical(plot_parm, V, F, inf_C, x, mi, ma, th_show);

% Show peak times in transition between VIS1 and DMN along selected vertices (F)
set_fig_property(1.5, 3, 0)
figure
Nan = length(ix_a);
tmp = [peak_time_vis2dmn(ix_a, 1), peak_time_dmn2vis(ix_a, 1)];
ma = max(tmp(:));
subplot(1, 2, 1)
plot([peak_time_vis2dmn(ix_a, 1) peak_time_dmn2vis(ix_a, 1)])
axis([1 Nan 0 ma])
grid on
set(gca, 'ytick', [0 10 20 30], 'yticklabel', [0 10 20 30])
xlabel('Selected vertex')
ylabel('Peak time [ms]')
title('F, A+VIS1 <-> A+DMN')

% Show peak times in transition between DMN and SMN along selected vertices (G)
tmp = [peak_time_dmn2smn(ix_a, 1), peak_time_smn2dmn(ix_a, 1)];
ma = max(tmp(:));
subplot(1, 2, 2)
plot([peak_time_dmn2smn(ix_a, 1) peak_time_smn2dmn(ix_a, 1)])
axis([1 Nan 0 ma])
grid on
set(gca, 'ytick', [0 10 20 30], 'yticklabel', [0 10 20 30])
xlabel('Selected vertex')
ylabel('Peak time [ms]')
title('G, B+DMN <-> B+SMN')

% Show lag vectors of transition between VIS1 and DMN (H)
set_fig_property(4, 2, 0)
figure
d = lag_vector_vd;
ma = max(d(:));
subplot(6, 1, 1)
plot(d(:, 1))
grid on
axis([1 Nan 0 ma])
title('VIS1 -> DMM, first segment')
subplot(6, 1, 2)
plot(d(:, 2))
grid on
axis([1 Nan 0 ma])
ylabel('Absolute value of peak time difference [ms]')
title('VIS1 -> DMM, final segment')
subplot(6, 1, 3)
plot(d(:, 3))
grid on
axis([1 Nan 0 ma])
title('DMN -> VIS1, first segment')
subplot(6, 1, 4)
plot(d(:, 4))
grid on
axis([1 Nan 0 ma])
xlabel('Selected vertex')
title('DMN -> VIS1, final segment')

% Show Euclidean distance across the lag vectors (I)
subplot(4, 1, 4)
dd = zeros(4, 4);
for i = 1:4
    dd(i, :) = sum((repmat(d(:, i), 1, 4)-d).^2, 1).^0.5;
end
imagesc(dd)
colorbar
axis square
colormap('jet')
title('Euclidean distance between across lag vectors')

% Show lag vectors of transition between DMN and SMN (J)
figure
d = lag_vector_ds;
ma = max(d(:));
subplot(6, 1, 1)
plot(d(:, 1))
grid on
axis([1 Nan 0 ma])
title('DMN -> SMN, first segment')
subplot(6, 1, 2)
plot(d(:, 2))
grid on
axis([1 Nan 0 ma])
ylabel('Absolute value of peak time difference [ms]')
title('DMN -> SMN, final segment')
subplot(6, 1, 3)
plot(d(:, 3))
grid on
axis([1 Nan 0 ma])
title('SMN -> DMN, first segment')
subplot(6, 1, 4)
plot(d(:, 4))
grid on
axis([1 Nan 0 ma])
xlabel('Selected vertex')
title('SMN -> DMN, final segment')

% Show Euclidean distance across the lag vectors (K)
subplot(4, 1, 4)
dd = zeros(4, 4);
for i = 1:4
    dd(i, :) = sum((repmat(d(:, i), 1, 4)-d).^2, 1).^0.5;
end
imagesc(dd)
colorbar
axis square
colormap('jet')
title('Euclidean distance between across lag vectors')

