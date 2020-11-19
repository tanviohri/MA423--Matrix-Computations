function [iter, lambda] = Powermethod(A, x, k)
    n = size(A,1);
    iter = zeros(n, k+1);
    s = max(abs(x));
    iter(:,1) = x/s;
    for j=1:k
        temp = A*iter(:,j);
        s = max(abs(temp));
        iter(:, j+1) = temp/s;
    end
    iter = iter(:, 2:end);
    lambda = s;
end