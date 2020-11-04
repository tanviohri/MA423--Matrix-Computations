function R = reflectqr(A)
    m = size(A,2);
    n = size(A,1);
    
    if(n==m)
        p = n-1;
    elseif(n>m)
        p=m;
    else
        error('Matrix is neither tall nor square.');
    end
    
    gammaValues = zeros(1,m); %vector that stores gamma values for each reflector
    for i=1:p
        [u, gamma, tau] = reflect(A(i:n,i));
        A(i:n, i)=u;
        A(i,i)=-tau;
        A(i:n, i+1:m) = applreflect(u, gamma, A(i:n, i+1:m));
        gammaValues(1,i)=gamma;
    end
    R=A;
end