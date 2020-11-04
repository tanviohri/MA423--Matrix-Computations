%changed from Lab Sheet 1 to add optimizations from Lecture 7
function [L, U] = genp(A)
    n = length(A);
    for k=1:n-1
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