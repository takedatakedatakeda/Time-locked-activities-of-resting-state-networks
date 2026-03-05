% Example code to reproduce Fig. 1
clear
addpath('functions')
set_fig_property(2, 6, 1)

% Load data
load data/fig1

% Show selected hyperparameters (A)
subplot(1, 3, 1)
imagesc(Npattern_list, N_list_ms, shp_hist)
colorbar
title('Frequency of hyperparameters')
xlabel('Numver of spatiotemporal patterns')
ylabel('Length of spatiotemporal patterns')
colormap('jet')

% Show probability of inter-onset intervals (B)
subplot(1, 3, 2)
bar(ll, pp)
grid on
xlim([0 1.5])
xlabel('Inter-onset interval [s]')
ylabel('Probability')
title('Probability of IOIs')

% Show log-log plot (C)
subplot(1, 3, 3)
lll = log(ll);
lpp = log(pp);
ix = find(lll>-0.5 & lll<2 & pp>0);
pf = polyfit(lll(ix), lpp(ix), 1);
x = -0.5:0.1:2;
y = pf(1)*x+pf(2);
loglog(ll, pp, 'o', 'markersize', 2, 'markerfacecolor', 'b', 'markeredgecolor', 'b')
hold on
loglog(exp(x), exp(y))
grid on
set(gca, 'xtick', [10^-1 10^0 10^1])
disp(['Alpha = ' num2str(pf(1))])
xlabel('Inter-onset interval [s]')
ylabel('Probability')
title('Log-log plot')


