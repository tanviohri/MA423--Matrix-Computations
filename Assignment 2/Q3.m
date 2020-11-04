clear all;
clc;

format long e;

kappa = 1e5; %1e7
n=100; %85
fprintf("For n=%d and kappa=%e:\n\n", n, kappa);
A=condmat(n, kappa); 
    %Technique to generate a positive definite matrix from Lab Sheet 2 was:
    %r = a + (b-a).*rand(n,1); D = diag(r), 0 < a < b
    %B = randn(n); [Q,R] = qr(B)
    %A = Q'*A*Q
    %D in condmat also satisfies the condition of having positive diagonal 
    %entries because kappa>0
    %B is analogous to X
    %Q is analagous to U
    %Hence A generated from condmat is positive definite
x=randn(n,1);
b=A*x;
tic;
x1=A\b;
time=toc;
fprintf("Cholesky's Method\n");
norm(x1-x, inf)/norm(x, inf)
norm(A*x1-b, inf)/norm(b, inf)
time
tic;
x1=cramer(A,b);
time=toc;
fprintf("Cramer's Method\n");
norm(x1-x, inf)/norm(x, inf)
norm(A*x1-b, inf)/norm(b, inf)
time




