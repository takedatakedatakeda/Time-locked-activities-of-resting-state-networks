% Example code to reproduce Fig. 8
clear
addpath('functions')
set_fig_property(2, 5, 1)

% Load data
load data/fig8

% Show frequency of high similarity with fMRI-RSN
Nref = length(freq_rsn_name);
ma = max(abs(freq_high_r(:)));
for seg = 1:2
    subplot(2, 4, 4*(seg-1)+1)
    imagesc(age_list, 1:Nref, freq_high_r(:, :, seg))
    colorbar
    caxis([-ma ma])
    set(gca, 'ytick', 1:Nref, 'yticklabel', freq_rsn_name)
    xlabel('Age')
    if seg == 1
        title('Frequency of high similarity  with fMRI-RSN')
    end
end

% Show largest values of normalized cross-correlogram across time
tgt_list = freq_rsn_name(6:7);
for seg = 1:2
    for ix = 1:2
        subplot(2, 4, 4*(seg-1)+ix+2)
        tmp = nccg(:, :, ix, seg);
        ma = max(abs(tmp(:)));
        imagesc(age_list, 1:Nref, tmp)
        colorbar
        caxis([-ma ma])
        xlabel('Age')
        set(gca, 'ytick', 1:Nref, 'yticklabel', freq_rsn_name)
        title(['Target: ' tgt_list{ix}])
    end
end
colormap('jet')
