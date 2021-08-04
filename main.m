clc
clear

prefix = 'D:/Work/OPMC-code_release/';
data_path = 'D:/Work/datasets/mData/Fmatrix/';

addpath(genpath([prefix, 'eval/']));

% take Handwritten for an example
data_name = 'Mfeat_fea';
fprintf('\ndata_name: %s', data_name);

%% pre-process, all algs do so
load([data_path, data_name, '.mat'], 'X', 'Y');
gt = Y; clear Y
k = length(unique(gt));
V = length(X);

%% specific to each alg
alg_name = 'OPMC';
iters = 100;

% normalize data
for v=1:V
    X{v} = zscore(X{v})';
end

for iter=1:iters
    tic;
    [Y, C, W, beta, obj] = opmc(X, k);
    ts = toc;
    val = my_eval_y(Y, gt);
    loss = obj(end);
    save([prefix, 'res/', data_name, '_OPMC_res_', num2str(iter), '.mat'], 'data_name', 'Y', 'C', 'W', 'beta', 'val', 'obj', 'ts', 'loss');
    fprintf('\niter: %d, time: %.2f', iter, ts);
end

% get res (corresponding to the minimal loss)
vals = cell(iters, 1);
tses = zeros(iters, 1);
losses = zeros(iters, 1);

for iter=1:iters
    load([prefix, 'res/', data_name, '_OPMC_res_', num2str(iter), '.mat'])
    vals{iter} = val';
    tses(iter) = ts;
    losses(iter) = loss;
end

[~, ind] = min(losses);
fprintf('\nsel.. loss: %.4f, acc: %.4f, nmi: %.4f, pur: %.4f, ts: %.2f', losses(ind), vals{ind}(1), vals{ind}(2), vals{ind}(3), tses(ind));
