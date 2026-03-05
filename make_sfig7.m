% Example code to reproduce SFig. 7
clear
addpath('functions')
set_fig_property(2, 5, 1)

% Load data
load data/sfig7

% Show cross-correlograms before normalization
ma = max(ccg(:));
Nref = size(ccg, 3);
for ref = 1:Nref
    subplot(2, 4, ref)
    imagesc(time*1000, 1:Nref, ccg(:, :, ref))
    caxis([0 ma])
    colorbar
    xlabel('Time [ms]')
    set(gca, 'ytick', 1:Nref, 'yticklabel', freq_rsn_name)
    title(['Ref = ' freq_rsn_name{ref}])
    colormap('jet')
end


