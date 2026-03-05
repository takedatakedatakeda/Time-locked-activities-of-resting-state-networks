% Example code to reproduce SFig. 9
clear
addpath('functions')
set_fig_property(2, 5, 1)

% Load data
load data/sfig9

% Show normalized cross-correlograms
ma = max(abs(nccg(:)));
Nref = size(nccg, 3);
for ref = 1:Nref
    subplot(2, 4, ref)
    imagesc(time*1000, 1:Nref, nccg(:, :, ref))
    caxis([-ma ma])
    colorbar
    xlabel('Time [ms]')
    set(gca, 'ytick', 1:Nref, 'yticklabel', freq_rsn_name)
    title(['Ref = ' freq_rsn_name{ref}])
    colormap('jet')
end


