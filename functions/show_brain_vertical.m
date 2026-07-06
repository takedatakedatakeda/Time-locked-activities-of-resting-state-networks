function h = show_brain_vertical(plot_parm, V, F, inf_C, x, mi, ma, th_show, ix_fig)

if ~exist('ix_fig', 'var')
    ix_fig = 1:4;
end

%set_fig_property(4, 2, 1)
%h = figure(1);clf
if ismember(1, ix_fig)
    big_subplot(4, 1, 1);
    plot_parm.LRflag = 'L';
    my_plot_cortex(plot_parm, V, F, inf_C, x, mi, ma, th_show);
    view([-90 0])
end
if ismember(2, ix_fig)
    big_subplot(4, 1, 2);
    plot_parm.LRflag = 'L';
    my_plot_cortex(plot_parm, V, F, inf_C, x, mi, ma, th_show);
    view([90 0])
end
if ismember(3, ix_fig)
    big_subplot(4, 1, 3);
    plot_parm.LRflag = 'R';
    my_plot_cortex(plot_parm, V, F, inf_C, x, mi, ma, th_show);
    view([90 0])
end
if ismember(4, ix_fig)
    big_subplot(4, 1, 4);
    plot_parm.LRflag = 'R';
    my_plot_cortex(plot_parm, V, F, inf_C, x, mi, ma, th_show);
    view([-90 0])
end