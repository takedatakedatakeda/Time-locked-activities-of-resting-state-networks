% Example code to reproduce SFig. 4
clear
addpath('functions')
set_fig_property(3, 5, 1)

% Load data
load data/sfig4

% Show frequency of high similarity between spatiotemporal patterns and fMRI-RSNs (A)
Nband0 = length(Band_name0);
Nrsn = length(rsn_name);
prsn_name = cell(1, Nrsn);
for n = 1:Nrsn
    prsn_name{n} = ['+' rsn_name{n}];
    nrsn_name{n} = ['-' rsn_name{n}];
end

ma = max([fhpr_pat(:); fhnr_pat(:); fhpr_cur(:); fhnr_cur(:)]);
subplot(2, 2, 1)
imagesc(fhpr_pat)
caxis([0 ma])
colorbar
set(gca, 'xtick', 1:Nband0, 'xticklabel', Band_name0)
set(gca, 'ytick', 1:Nrsn, 'yticklabel', prsn_name)
title('Spatiotemporal pattern')
subplot(2, 2, 3)
imagesc(fhnr_pat)
caxis([0 ma])
colorbar
set(gca, 'xtick', 1:Nband0, 'xticklabel', Band_name0)
set(gca, 'ytick', 1:Nrsn, 'yticklabel', nrsn_name)

% Show frequency of high similarity between source currents and fMRI-RSNs (B)
subplot(2, 2, 2)
imagesc(fhpr_cur)
caxis([0 ma])
colorbar
set(gca, 'xtick', 1:Nband0, 'xticklabel', Band_name0)
set(gca, 'ytick', 1:Nrsn, 'yticklabel', prsn_name)
title('Source current')
subplot(2, 2, 4)
imagesc(fhnr_cur)
caxis([0 ma])
colorbar
set(gca, 'xtick', 1:Nband0, 'xticklabel', Band_name0)
set(gca, 'ytick', 1:Nrsn, 'yticklabel', nrsn_name)
colormap('jet')



