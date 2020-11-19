function [iter, lambda] = Shiftinv(A, x, rho, k)
    n = size(A,1);
    [L, U, P] = lu(A-rho*eye(n));
    iter = zeros(n, k+1);
    s = max(abs(x));
    iter(:,1) = x/s;
    for j=1:k
        b = P*iter(:,j);
        y = L\b;
        temp = U\y;
        s = max(abs(temp));
        iter(:, j+1) = temp/s;
    end
    iter = iter(:, 2:end);
    lambda = rho + 1/s;
end