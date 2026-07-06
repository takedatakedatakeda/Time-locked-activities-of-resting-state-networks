% Example code to reproduce SFig. 6
clear
addpath('functions')
set_fig_property(3, 4, 1)

% Load data
load data/sfig6

% Show sample simulated spatiotemporal pattern when lag = 24 ms (A)
subplot(3, 3, 1)
[Nch, N] = size(prob1);
imagesc((1:N)/sr*1000, 1:2, prob1)
colorbar
hold on
for t = 1:N
    for ch = 1:Nch
        if spike1(ch, t) == 1
            plot(t/sr*1000, ch, 'ko', 'markersize', 3, 'markerfacecolor', 'k', 'markeredgecolor', 'k')
        end
    end
end
set(gca, 'ytick', 1:2, 'yticklabel', {'Ref', 'Tgt'})
xlabel('Time [ms]')
title('Probability of spikes')
colormap('jet')

% Show cross-correlogram when lag = 24 ms (B)
subplot(3, 3, 2)
plot(time1*1000, sccg1, 'r')
hold on
plot(time1*1000, ccg1, 'b')
ylim([0.1 0.4])
grid on
xlabel('Time [ms]')
title('Cross-correlogram')

% Show cross-correlogram when lag = 24 ms (C)
subplot(3, 3, 3)
plot(time1*1000, nccg1, 'b')
ylim([-30 30])
grid on
xlabel('Time [ms]')
ylabel('Z-value')
title('Normalized cross-correlogram')

% Show sample simulated spatiotemporal pattern when lag = 12 ms (D)
subplot(3, 3, 4)
imagesc((1:N)/sr*1000, 1:2, prob2)
colorbar
hold on
for t = 1:N
    for ch = 1:Nch
        if spike2(ch, t) == 1
            plot(t/sr*1000, ch, 'ko', 'markersize', 3, 'markerfacecolor', 'k', 'markeredgecolor', 'k')
        end
    end
end
set(gca, 'ytick', 1:2, 'yticklabel', {'Ref', 'Tgt'})
xlabel('Time [ms]')

% Show cross-correlogram when lag = 12 ms (E)
subplot(3, 3, 5)
plot(time2*1000, sccg2, 'r')
hold on
plot(time2*1000, ccg2, 'b')
ylim([0.1 0.4])
grid on
xlabel('Time [ms]')

% Show cross-correlogram when lag = 12 ms (F)
subplot(3, 3, 6)
plot(time2*1000, nccg2, 'b')
ylim([-30 30])
grid on
xlabel('Time [ms]')
ylabel('Z-value')

% Show sample simulated spatiotemporal pattern when lag = random (G)
subplot(3, 3, 7)
imagesc((1:N)/sr*1000, 1:2, prob3)
colorbar
hold on
for t = 1:N
    for ch = 1:Nch
        if spike3(ch, t) == 1
            plot(t/sr*1000, ch, 'ko', 'markersize', 3, 'markerfacecolor', 'k', 'markeredgecolor', 'k')
        end
    end
end
set(gca, 'ytick', 1:2, 'yticklabel', {'Ref', 'Tgt'})
xlabel('Time [ms]')

% Show cross-correlogram when lag = random (H)
subplot(3, 3, 8)
plot(time3*1000, sccg3, 'r')
hold on
plot(time3*1000, ccg3, 'b')
ylim([0.1 0.4])
grid on
xlabel('Time [ms]')

% Show cross-correlogram when lag = random (I)
subplot(3, 3, 9)
plot(time3*1000, nccg3, 'b')
ylim([-30 30])
grid on
xlabel('Time [ms]')
ylabel('Z-value')

