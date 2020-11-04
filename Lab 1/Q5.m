clear all;
clc;

n=5;
A = randn(n) + eye(n); %making diagonal entries non zero by adding identity matrix

[L, U] = genp(A);

L
U
L*U
A