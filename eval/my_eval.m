function [res, ts]= my_eval(U,Y,numclass)

tic;
stream = RandStream.getGlobalStream;
reset(stream);
U_normalized = U ./ repmat(sqrt(sum(U.^2, 2)), 1,numclass);
indx = lite_kmeans(U_normalized,numclass, 'MaxIter',100, 'Replicates',50, 'EmptyAction','drop');
ts = toc;

indx = indx(:);
[newIndx] = best_map(Y,indx);
res(1) = mean(Y==newIndx);
res(2) = mutual_info(Y,newIndx);
res(3) = pur_fun(Y,newIndx);
res(4) = RandIndex(Y, newIndx);