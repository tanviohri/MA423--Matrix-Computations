function [U, S, V]= svdFromPolar (A)
    [W, R] = polard2(A);
    [V, S] = eig(R);
    [S, p] = sort(diag(S), 'descend');
    S = diag(S);
    V = V(:, p);
    U = W*V;
end
