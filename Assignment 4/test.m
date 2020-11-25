clear all;
clc;
format short e;
tol = 1e-10;
A = randn(2)+i*randn(2);
n = size(A, 1);
fprintf("Part (b)\n");
fprintf("Expected eigenvalues are:\n");
disp(eig(A));

A = hess(A);
B=main(A, 1, tol);
% disp(findEigenvalueOf2x2Matrix(B(1:n-1,1:n-1)));
% disp(findEigenvalueOf2x2Matrix(B(2:n,2:n)));
B=main(A, 2, tol);
% disp(findEigenvalueOf2x2Matrix(B(1:n-1,1:n-1)));
% disp(findEigenvalueOf2x2Matrix(B(2:n,2:n)));
disp(findEigenvalueOf2x2Matrix(B));

function B=main(A, m, tol)
    fprintf("for m = %i\n", m);
    [B, k] = CallFrancisQR(A, m, tol);
    fprintf("No. of iteration: %i, B: \n", k);
    disp(B);
    fprintf("Eigenvalues of the 2x2 block diagonal matrix:\n");
end

function X=findEigenvalueOf2x2Matrix(A)
        a=A(1,1);
        b=A(1,2);
        c=A(2,1);
        d=A(2,2);
        X=zeros(2,1);
        X(1) =((a+d)+sqrt((a-d)^2 + 4*b*c))/2;
        X(2) =((a+d)-sqrt((a-d)^2 + 4*b*c))/2;
end
