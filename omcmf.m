function [ Y, C, W, beta, obj] = omcmf( X, k)
%OBJ \min \sum_{v=1}^V ( \|\mathbf{X}_v -
%\mathbf{Y}\mathbf{C}_v\mathbf{W}_v\|_F^2
% s.t. W_vW_v^T = I

V = length(X);
n = size(X{1}, 1);

c = k;
% init
Y = randi([1,k],n,1);
for v=1:V
    C{v} = rand(k,c);
    W{v} = rand(c,size(X{v},2));
end
beta = ones(V,1)./V;

t = 1;
while(1)
    % cal obj
    [obj(t)] = cal_obj(X, Y, C, W, beta);
    % update W
    [W] = update_W(X, Y, C);
    % update C
    [C] = update_C(X, Y, W, k);
    % udpate Y
    [Y] = update_Y(X, C, W, beta);
    % update beta
%     [beta] = update_beta( X, Y, C, W);
%     % print the results
%     val = my_eval_y(Y, gt);
%     fprintf('\nt: %d, loss: %.4f, loss1: %.4f, loss2: %.4f, acc: %.4f, nmi: %.4f, pur: %.4f', t, obj(t), loss1, loss2, val(1), val(2), val(3));
    % if convergent
    if t>2 && abs(obj(t)-obj(t-1))/obj(t) < 1e-5
        break;
    end
    t = t + 1;
end 


end

