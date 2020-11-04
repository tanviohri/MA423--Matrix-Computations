
function [L, U ,P] = gepp(A)
    n = size(A, 1);
    P = eye(n);
 
    for k=1:n-1
        [maxval ,maxind] = max(abs(A(k:n,k)));
        if(maxind ~= 1)
            A([k,maxind+k-1],:) = A([maxind+k-1,k],:);
            P([k,maxind+k-1],:) = P([maxind+k-1,k],:);
        end
        
        A(k+1:n,k) = A(k+1:n,k)/A(k,k);
        A(k+1:n,k+1:n) = A(k+1:n,k+1:n) - A(k+1:n,k)*A(k,k+1:n);
    end

    U = triu(A);
    L = tril(A,-1)+eye(n);
end