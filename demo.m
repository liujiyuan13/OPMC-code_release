clc
clear

prefix = 'D:/Work/OMCMF-code/';

addpath(genpath([prefix, 'eval/']));

data_path = 'D:/Work/datasets/mData/Fmatrix/';
data_name = 'NUS-WIDE-OBJECT_fea';
load([data_path, data_name, '.mat'], 'X', 'Y');
gt = Y; clear Y
k = length(unique(gt));
V = length(X);

alg_name = 'OMCmf';
fprintf('\n# %s:', alg_name);

% normalize data
for v=1:V
    X{v} = zscore(X{v})';
end

iters = 3;

vals = zeros(length(iters), 10); ts = zeros(length(iters), 1); losses = zeros(length(iters), 1);
for i=1:iters
    tic;
    [Y, C, W, beta, obj] = omcmf(X, k);
    ts(i) = toc;
    val = my_eval_y(Y, gt);
    vals(i,:) = val;
    losses(i) = obj(end);
    fprintf('\n- iter: %d, ts: %.4f, loss: %.4f, acc: %.4f, nmi: %.4f, pur: %.4f', i, ts(i), losses(i), val(1), val(2), val(3));
end

[~, ind] = min(losses);
val = vals(ind(1),:);

fprintf('\n# Result:');
fprintf('\n- iter: %d, ts: %.4f, loss: %.4f, acc: %.4f, nmi: %.4f, pur: %.4f', ind(1), ts(ind(1)), losses(ind(1)), val(1), val(2), val(3));


