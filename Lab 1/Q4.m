clear all;
clc;

n = 5;
A = randn(n);
b = randn(n, 1);

%part (a)
L = tril(A, 0);
%L(1,1)=0; % --> to check that singular matrix throws error
x1 = rowforward(L, b)
x1Expected = L\b

%part (b)
U = triu(A, 0);
%U(1,1)=0; % --> to check that singular matrix throws error
x2 = colbackward(U, b)
x2Expected = U\b