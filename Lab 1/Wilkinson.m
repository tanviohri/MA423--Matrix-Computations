function W = Wilkinson(n)
    W = -tril(ones(n), -1); % -1 if i > j, zero otherwise
    W = W + eye(n);  % -1 if i > j, 1 if i = j, zero otherwise
    W(:,n) = ones(n,1); % -1 if i > j, 1 if i = j, 1 if j = n, zero otherwise
end