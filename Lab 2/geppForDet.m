function [L, U, p, sigma] = geppForDet(A)
    n = length(A);
    p = 1:1:n;
    sigma = 1;
    for k=1:n-1
        [~, m] = max(abs(A(k:n,k)));
        m = m + k -1;
        if(m ~= k)
           A = A([1:1:k-1 m k+1:1:m-1 k m+1:n], :);
           p = p(:, [1:1:k-1 m k+1:1:m-1 k m+1:n]);
           sigma = -sigma;
        end
        if A(k,k)~=0
            A(k+1:n, k)=A(k+1:n,k)/A(k,k);
        else
            error('zero pivot encountered');
        end
        A(k+1:n,k+1:n) = A(k+1:n,k+1:n) - A(k+1:n,k)*A(k,k+1:n);
    end
    L = tril(A,-1) + eye(n);
    U = triu(A,0);
end