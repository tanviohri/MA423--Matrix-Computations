function B = FrancisQRS(A) 
    n = size(A,1);
    rho = A(n,n);
    [u, gamma, ~] = reflect(A(1:2,1)-rho*eye(2,1));
    Qi = eye(2) - gamma*u*u';
    B = A;
    B(1:2, 1:n) = Qi*B(1:2, 1:n);
    B(1:n, 1:2) = B(1:n, 1:2)*Qi;
    for i=1:n-2
        [u, gamma, ~] = reflect(B(i+1:i+2,i));
        Qi = eye(2) - gamma*u*u';
        B(i+1:i+2, i:n) = Qi*B(i+1:i+2, i:n);
        B(i:n, i+1:i+2) = B(i:n, i+1:i+2)*Qi;
    end  
end