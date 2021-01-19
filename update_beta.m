function [ beta ] = update_beta(  X, Y, C, W )

V = length(X);

loss = zeros(V, 1);
for v=1:V
    loss(v) = sum(sum((X{v}-C{v}(Y,:)*W{v}).^2));
end

tmp = 1./loss;
beta = (tmp./sum(tmp)).^2;


end