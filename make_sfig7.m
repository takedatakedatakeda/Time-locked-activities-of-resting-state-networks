% Example code to reproduce SFig. 7
clear
addpath('functions')
set_fig_property(4, 6, 1)

% Load data
load data/sfig7

% Show true spatiotemporal pattern (A)
h = figure(1); clf
subplot(4, 4, 1)
Nch = size(pat, 1);
imagesc(time_pat*1000, 1:Nch, pat)
ma = max(abs(pat(:)));
caxis([-ma ma])
colorbar
xlabel('Time [ms]')
ylabel('Channel')
title('True pattern')

% Show simulated and surrogate data (B)
subplot(4, 4, 2:3)
imagesc(time_data, 1:Nch, data)
ma = max(abs(data(:)));
caxis([-ma ma])
colorbar
ylabel('Channel')
title('Original data')

subplot(4, 4, (2:3)+4)
imagesc(time_data, 1:Nch, sdata)
caxis([-ma ma])
colorbar
xlabel('Time [s]')
ylabel('Channel')
title('Surrogate data')

% Show estimated patterns (C)
subplot(4, 4, 4)
imagesc(time_pat*1000, 1:Nch, e_pat)
ma = max(abs([e_pat(:); e_spat(:)]));
caxis([-ma ma])
colorbar
ylabel('Channel')
title({'Estimated pattern', '(original)'})

subplot(4, 4, 8)
imagesc(time_pat*1000, 1:Nch, e_spat)
caxis([-ma ma])
colorbar
xlabel('Time [ms]')
ylabel('Channel')
title({'Estimated pattern', '(surrogate)'})

% Show normalized cross-correlograms (D)
ma = max(abs([nccg(:);snccg(:)]));
subplot(4, 4, 9)
imagesc(time_ccg*1000, 1:Nch-1, nccg)
caxis([-ma ma])
colorbar
set(gca, 'ytick', 1:Nch-1)
ylabel('Channel')
title({'Normalized CCG', '(original)'})

subplot(4, 4, 13)
imagesc(time_ccg*1000, 1:Nch-1, snccg)
caxis([-ma ma])
colorbar
set(gca, 'ytick', 1:Nch-1)
xlabel('Time [ms]')
ylabel('Channel')
title({'Normalized CCG', '(surrogate)'})

colormap('jet')





