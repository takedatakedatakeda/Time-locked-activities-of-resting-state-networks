function show_brain(plot_parm, V, F, inf_C, x, title_list, clim, th)

Ncolumn = 7;
Nact = size(x, 2);
Nrow = Nact;
plot_parm.cmap = 2;% Jet

if ~exist('title_list')
    title_list = [];
end
if size(clim, 1) == 1
    clim = repmat(clim, Nact, 1);
end
if ~exist('th', 'var')
    th = 0.1;
end

cl = colormap('jet');
Ncl = size(cl,1);
rcl = zeros(Ncl,1,3);
for c = 1:Ncl
    rcl(c,1,1) = cl(Ncl-c+1,1);
    rcl(c,1,2) = cl(Ncl-c+1,2);
    rcl(c,1,3) = cl(Ncl-c+1,3);
end

for a = 1:Nact
    x1 = x(:,a);
    mi = clim(a, 1);
    ma = clim(a, 2);
    
    if ~isempty(title_list)
        big_subplot(Nrow, Ncolumn, 1+Ncolumn*(a-1));
        text(0, 0.5, title_list{a}, 'fontsize', 15, 'interpreter', 'none')
        axis off
    end
    big_subplot(Nrow, Ncolumn, 2+Ncolumn*(a-1));
    plot_parm.LRflag = 'L';
    my_plot_cortex(plot_parm, V, F, inf_C, x1, mi, ma, th);
    view([-90 0])
    big_subplot(Nrow, Ncolumn, 3+Ncolumn*(a-1));
    plot_parm.LRflag = 'R';
    my_plot_cortex(plot_parm, V, F, inf_C, x1, mi, ma, th);
    view([90 0])
    big_subplot(Nrow, Ncolumn, 4+Ncolumn*(a-1));
    plot_parm.LRflag = 'LR';
    my_plot_cortex(plot_parm, V, F, inf_C, x1, mi, ma, th);
    view([0 90])
    big_subplot(Nrow, Ncolumn, 5+Ncolumn*(a-1));
    plot_parm.LRflag = 'R';
    my_plot_cortex(plot_parm, V, F, inf_C, x1, mi, ma, th);
    view([-90 0])
    big_subplot(Nrow, Ncolumn, 6+Ncolumn*(a-1));
    plot_parm.LRflag = 'L';
    my_plot_cortex(plot_parm, V, F, inf_C, x1, mi, ma, th);
    view([90 0])
    
    big_subplot(Nrow, Ncolumn, 7+Ncolumn*(a-1));
    image(rcl)
    axis([0 10 -10 Ncl+10])
    axis off
    text(2,1,sprintf('%2.3f', ma),'Fontsize',12)
    text(2,Ncl,sprintf('%2.2f', mi),'Fontsize',12)
    colormap('jet')
end




