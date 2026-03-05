% Example code to reproduce SFig. 12
clear
addpath('functions')
set_fig_property(3, 7, 1)

% Load data
load data/sfig12

% Show normalized cross-correlograms for each age group
[Ntgt, Nt, Nref, Nage] = size(nccg);
ma = max(abs(nccg(:)));
for age = 1:Nage
    for ref = 1:Nref
        subplot(Nref, Nage, Nage*(ref-1)+age)
        imagesc(time*1000, 1:Ntgt, nccg(:, :, ref, age))
        caxis([-ma ma])
        colorbar
        xlabel('Time [ms]')
        set(gca, 'ytick', 1:Ntgt, 'yticklabel', freq_rsn_name)
        title(['Ref = ' ref_name{ref} ', ' num2str(age_list(age)) 's'])
        colormap('jet')
    end
end
