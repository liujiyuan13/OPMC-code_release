function [ loss_sum, beta ] = cal_obj( X, Y, C, W, beta )

V = length(X);

loss = zeros(V, 1);
for v=1:V
    loss(v) = sum(sum((X{v}-C{v}(Y,:)*W{v}).^2));
end

loss_sum = beta'*loss;

end

