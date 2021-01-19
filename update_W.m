function [ W ] = update_W( X, Y, C )

V = length(X);
[k, c] = size(C{1});

W = cell(V, 1);
for v=1:V
    YTXv = zeros(k, size(X{v},2));
    for j=1:k
        YTXv(j,:) = sum(X{v}(find(Y==j),:), 1)+eps;
    end
    [U,~,V] = svds(C{v}'*YTXv, c);
    W{v} = U*V';
end

end

