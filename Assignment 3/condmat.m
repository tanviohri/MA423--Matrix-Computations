function A = condmat(m,n,kappa)
    X = randn(m,n);
    [U,S,V] = svd(X);
    p = min(m,n);
    for i=1:p
       S(i,i) = kappa^((i-1)/(p-1)); 
    end
    A = U*S*V';
end