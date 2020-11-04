function G = mycholb(A)
    if(A(1,1) <= 0) %G(1,1) = sqrt(A(1,1)) and G should have positive diagonal entries
        error('A is not positive definite');
    end
    n = length(A);
    G = zeros(n, n);
    G(1,1)=sqrt(A(1,1));
    for j=2:n
        h = geppsolve(G(1:j-1, 1:j-1)', A(1:j-1, j));
        G(1:j-1, j)=h;
        temp = A(j,j) - h'*h;
        if(temp <= 0)
            error('A is not positive definite');
        end
        G(j,j)= sqrt (temp);
    end
end