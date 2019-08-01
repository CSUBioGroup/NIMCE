function v = ssqd(X)
% Taken from Matlab pdist.m
% Computes pairwise sum of squared differences between cols of X
% Use squareform(.) to convert to square symmetric distance matrix
    [row,n] = size(X);
    v = zeros(1,n*(n-1)./2);
    k = 1;
    for i = 1:n-1
            ssq = zeros(1, n-i);
            for q = 1:row
                ssq = ssq + (X(q, i) - X(q,(i+1):n)).^2;
            end
            v(k:(k+n-i-1)) = ssq;
            k = k + (n-i);
    end
end