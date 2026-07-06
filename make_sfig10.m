% Example code to reproduce SFig. 10
clear
addpath('functions')
set_fig_property(2, 5, 1)

% Load data
load data/sfig10

% Show power spectra of correlation time series 
% between spatiotemporal patterns and fMRI-RSNs
Nfr = length(freq_rsn_name);
for fr = 1:Nfr
    subplot(2, 4, fr)
    plot(ff, mps_rr_spat(:, fr), 'r')
    hold on
    plot(ff, mps_rr_spat(:, fr)+sps_rr_spat(:, fr), 'r:')
    plot(ff, mps_rr_spat(:, fr)-sps_rr_spat(:, fr), 'r:')
    plot(ff, mps_rr_pat(:, fr), 'b')
    plot(ff, mps_rr_pat(:, fr)+sps_rr_pat(:, fr), 'b:')
    plot(ff, mps_rr_pat(:, fr)-sps_rr_pat(:, fr), 'b:')
    xlim([0 100])
    grid on
    xlabel('Frequency [Hz]')
    if mod(fr, 4) == 1
        ylabel('Power')
    end
    title(freq_rsn_name{fr})
end
subplot(2, 4, 8)
plot(randn(10, 1), 'b')
hold on
plot(randn(10, 1), 'r')
legend('Original', 'Surrogate')
