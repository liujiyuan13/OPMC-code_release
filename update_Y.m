function [ Y ] = update_Y( X, C, W, beta)

V = length(X);
n = size(X{1}, 1);
k = size(C{1}, 1);

CW = cell(V, 1);
for v=1:V
    CW{v} = C{v}*W{v};
end

loss = zeros(n, k);
for v=1:V
    loss = loss + beta(v) * EuDist2(X{v}, CW{v}, 0);
end
[~, Y] = min(loss, [], 2);

end

