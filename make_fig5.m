% Example code to reproduce Fig. 5
clear
addpath('functions')
set_fig_property(1, 4, 1)

% Load data
load data/fig5

% Show distributions of correlation coefficients
titles = {'A+VIS1 & A+DMN', 'B+DMN & B+SMN', 'G+SMN & G-VIS3'};
for m = 1:3
    subplot(1, 3, m)
    histogram('BinEdges', edge, 'BinCounts', count_orig(m, :))
    hold on
    histogram('BinEdges', edge, 'BinCounts', count_srgt(m, :))
    grid on
    xlim([edge(1) edge(end)])
    xlabel('Correlation coefficient')
    ylabel('Frequency')
    title(titles{m})
    if m == 1
        legend('Original', 'Surrogate', 'Location', 'northwest')
    end
end

