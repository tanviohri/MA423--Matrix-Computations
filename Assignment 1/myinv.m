function B = myinv(A)
    n = length(A);
    B = zeros (n,n);
    [L, U, P] = gepp (A); % 2/3 n^3 + O(n^2) flops
    %PA = LU => LUinv(A) = P 
    %finding inverse of A column-wise, column x is found as:
    %Ly=corresponding column of P and Ux=y
    for i=1:n 
        y = rowforward(L, P(:,i)); % n^2 flops
        B(:, i) = colbackward(U, y); % n^2 flops
    end
    %loop takes 2 n^3 flops
    %total 8/3 n^3 + O(n^2) flops
end