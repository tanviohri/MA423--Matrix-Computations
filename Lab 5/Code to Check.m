clear all;
clc;

x = randn(5,1);
A = randn(5,5);
[u gamma tau]=reflect(x);
u

Q=(eye(5)-gamma*u*u');

Q*A

applreflect(u, gamma, A)

[q1 r1]=qr(A);
r1
r2=reflectqr(A)