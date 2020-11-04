function x = rowforward(L, b)
    x = b;
    for k = 1:length(b)
        for j = 1:k-1
            x(k) = x(k) - L(k, j)*x(j);
        end
        if L(k,k)~=0
            x(k) = x(k)/L(k,k);
        else
            error('matrix is singular');
        end
    end
end