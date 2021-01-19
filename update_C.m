function [ C ] = update_C( X, Y, W, k)

V = length(X);
n = size(X{1},1);

C = cell(V, 1);
for v=1:V
    YTYvec = zeros(k,1);
    for i=1:n
        YTYvec(Y(i)) = YTYvec(Y(i)) + 1;
    end
    YTYplusIinvvec = 1./(YTYvec+eps);
    YTXv = zeros(k, size(X{v},2));
    for j=1:k
        YTXv(j,:) = sum(X{v}(find(Y==j),:), 1);
    end
    tmp = YTXv.*repmat(YTYplusIinvvec, 1, size(X{v},2));
    C{v} = tmp*W{v}' ;
end

end

