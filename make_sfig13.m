% Example code to reproduce SFig. 13
clear
addpath('functions')
set_fig_property(2, 3, 1)

% Load data
load data/sfig13

% Show simulated data (A)
subplot(2, 1, 1)
plot((1:size(data, 2))./sr, data)
grid on
xlabel('Time [s]')
title('Sample data')
legend('Channel 1', 'Channel 2')

% Show sample spatiotemporal pattern (B)
subplot(2, 3, 4)
plot((1:size(pat{end}, 2))./sr*1000, pat{end}')
grid on
hold on
Nch = size(data, 1);
for ch = 1:Nch
    ix = find(x{end}(ch, :));
    plot(ix./sr*1000, pat{end}(ch, ix), 'k*')
end
xlim([1 size(pat{end}, 2)]./sr*1000)
xlabel('Time [ms]')
title('Sample pattern')

% Show normalized cross-correlogram (C)
subplot(2, 3, 6)
ma = max(abs(nccg));
plot(time*1000, nccg)
grid on
ylim([-ma ma])
xlabel('Time [ms]')
ylabel('Z-value')
title('Normalized cross-correlogram')

