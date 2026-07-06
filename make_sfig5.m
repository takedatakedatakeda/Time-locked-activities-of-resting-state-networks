% Example code to reproduce SFig. 5
clear
addpath('functions')
set_fig_property(3, 4, 1)

% Load data
load data/sfig5

% Show distributions of correlation coefficients
Nrsn = length(rsn_name);
Nband0 = length(Band_name0);
for n = 1:Nrsn
    for band = 1:Nband0
        subplot(Nrsn, Nband0, Nband0*(n-1)+band)
        ma = max([pdr_cur(n, :, band) pdr_pat(n, :, band) pdr_spat(n, :, band)]);
        plot(l, pdr_cur(n, :, band), 'r')% Source current
        hold on
        plot(l, pdr_spat(n, :, band), 'g')% Surrogate spatiotemporal pattern
        plot(l, pdr_pat(n, :, band), 'b')% Original spatiotemporal pattern
        grid on
        axis([-0.6 0.6 0 ma])
        set(gca, 'xtick', [-0.5 0 0.5], 'xticklabel', [-0.5 0 0.5])
        if band == 1
            ylabel(rsn_name{n})
        end
        if n == 1
            title(Band_name0{band})
        end
        if n == Nrsn && band == 3
            xlabel('Correlation coefficient')
        end
    end
end
