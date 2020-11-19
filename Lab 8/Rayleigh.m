function [iter, lambda] = Rayleigh(A, x, k)
    n = size(A,1);
    [Q, H] = hess(A);
    iter = zeros(n, k+1);
    s = max(abs(x));
    x = x/s;
    iter(:,1) = Q*x;
    rho = x'*H*x/x'*x;
    for j=1:k
        [L, U, P] = lu(H-rho*eye(n));
        b = P*iter(:,j);
        y = L\b;
        temp = U\y;
        s = max(abs(temp));
        temp = temp/s;
        iter(:, j+1) = Q*temp;
        rho = temp'*H*temp/temp'*temp;
    end
    iter = iter(:, 2:end);
    lambda = rho + 1/s;
end