function [W, R] = polard1(A)
    [m, n] = size(A);
    [U, S, V] = svd(A);
    if(m >= n)
        U = U(:,1:n);
        S = S(1:n,1:n);
        W = U*V';
        R = V*S*V';
    else
        S = S(1:m,1:m);
        V = V(:,1:m);
        R = U*S*U';
        W = U*V';
    end
end
%Polar Decomposition is Unique. This is because polar decomposition of a
%complex number is unique because clearly r = modulus of z and there is
%only one possibilty of corresponding w(=cos(theta) + isin(theta)) 
%If z = x+ iy then r = sqrt(x^2 + y^2) and cos(theta) = x/r and sin(theta)
%= y/r. Hence, polar decomposition of z is unique, thus, polar
%decomposition of matrix is also unique.