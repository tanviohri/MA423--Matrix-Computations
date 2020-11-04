clear all;
clc;

format long e;

n=10;
H=hilb(n); 
x = randn(n,1);
b = H*x;
x1= H\b;
r = H*x1-b;
fprintf('||r||/||b||: %d \n||x-x1||/||x||: %d \n', [norm(r)/norm(b) norm(x-x1)/norm(x)]);