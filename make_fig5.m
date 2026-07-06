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
    histogram('BinEdges', edge, 'BinCounts', count_pat(m, :), ...
        'edgecolor', 'b', 'displaystyle', 'stairs', 'linewidth', 2)
    hold on
    histogram('BinEdges', edge, 'BinCounts', count_spat(m, :), ...
        'edgecolor', 'g', 'displaystyle', 'stairs', 'linewidth', 2)
    histogram('BinEdges', edge, 'BinCounts', count_cur(m, :), ...
        'edgecolor', 'r', 'displaystyle', 'stairs', 'linewidth', 2)
    grid on
    xlim([edge(1) edge(end)])
    xlabel('Correlation coefficient')
    ylabel('Frequency')
    title(titles{m})
    if m == 1
        legend('Original', 'Surrogate', 'Current', 'Location', 'northwest')
    end
end
