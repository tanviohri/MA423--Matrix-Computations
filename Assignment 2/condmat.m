function A = condmat(n , kappa)
    
    X = randn(n,n);
    
    [U,~] = qr(X);
    
    D = zeros(n,n);
    
    for i=1:n
    
        D(i,i) = kappa^((i-1)/(n-1));
    
    end
    
    A = U*D*U';
    
end