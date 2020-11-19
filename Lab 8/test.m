clear all;
clc;

A = triu(randn(7),-1)
n = size(A,1);
    rho = A(n,n)
    [Q,R] = reflectqr_hess(A-rho*eye(n));
    B1 = R*Q + rho*eye(n)
    B = FrancisQRS(A)
    
    