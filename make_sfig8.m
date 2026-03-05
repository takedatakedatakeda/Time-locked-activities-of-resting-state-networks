% Example code to reproduce SFig. 8
clear
addpath('functions')
set_fig_property(2, 2, 1)

% Load data
load data/sfig8

% Show correlation coefficients across fMRI-RSNs
Nrsn = length(rsn_name);
imagesc(r)
colorbar
caxis([-1 1])
axis square
colormap('jet')
set(gca, 'xtick', 1:Nrsn, 'xticklabel', rsn_name)
set(gca, 'ytick', 1:Nrsn, 'yticklabel', rsn_name)
hold on
for n1 = 1:Nrsn
    for n2 = 1:Nrsn
        s = num2str(round(r(n1, n2)*100)/100);
        text(n1-0.2, n2, s, 'fontsize', 8)
    end
end