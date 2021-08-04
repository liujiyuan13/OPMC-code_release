function [ alg_name ] = mydemo_fun( data_path, data_name, save_path, iters )

%% pre-process, all algs do so
load([data_path, data_name, '.mat'], 'X', 'Y');
gt = Y; clear Y
k = length(unique(gt));
V = length(X);

%% specific to each alg
alg_name = 'OMCMF';

% normalize data
for v=1:V
    X{v} = zscore(X{v})';
end

parfor it=1:length(iters)
    iter = iters(it);
    tic;
    [Y, C, W, beta, obj] = omcmf(X, k);
    ts = toc;
    val = my_eval_y(Y, gt);
    loss = obj(end);
%     fprintf('\niter: %d, ts: %.4f, loss: %.4f, acc: %.4f, nmi: %.4f, pur: %.4f', iter, ts, loss, val(1), val(2), val(3));
    fprintf('\niter: %d, ts: %.4f', iter, ts);
    my_save(save_path, data_name, iter, Y, C, W, beta, val, obj, ts, loss);
end

end

