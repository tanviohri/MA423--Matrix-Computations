function x = colbackward(U, b)
    x = b;
    n = length(b);
    for k = n:-1:1
        for j = k+1:n
            x(k) = x(k) - U(k, j)*x(j);
        end
        if U(k,k)~=0
            x(k) = x(k)/U(k,k);
        else
            error('matrix is singular');
        end
    end
end