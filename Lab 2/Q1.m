clear all;
clc;

A = [1e-20 1; 1 1];

%part a
[L, U] = genp(A);

fprintf('Value of A-L*U: \n');
disp(A - L*U); 

%part b

b = [1; 0];

y = rowforward (L, b); %solve Ly=b;

xCalculated = colbackward (U, y)

xExpected = A\b

fprintf('Difference between Expected and Calculated values in 2-Norm: \n');
disp(norm(xExpected-xCalculated,2));

%Conclusion about GENP: It is unstable if some value in the matrix is close
%to zero
%Things start to go wrong while computing the LU decomposition, A is not
%equal to LU on verifying

