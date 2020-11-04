function x = geppsolve(A, b)
    [L, U, p] = gepp(A);
    y = rowforward (L, b(p,:));
    x = colbackward (U, y);
end