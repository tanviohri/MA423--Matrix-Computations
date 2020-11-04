clear all;
clc;

format long e;

t=(-5:0.5:6)';
n=18;
m=length(t);

A=zeros(m,n);
for i=1:n
    A(:,i)=t.^(i-1);
end

b = sin(pi*t/5) + t/5;

results =[];

p1 = A\b;
results = [results; cond(A) norm(A*p1-b)];

G = mycholb(A'*A);
y = rowforward(G', A'*b);
p2 = colbackward (G,y);
results = [results; cond(A'*A) norm(A*p2-b)];
A_arg = [eye(m) A; A' zeros(n,n)];
b_arg =[b; zeros(n,1)];
x_arg = A_arg\b_arg;
p3=x_arg(m+1:end);
results = [results; cond(A_arg) norm(-x_arg(1:m))];

tableOfResults=array2table(results,'VariableNames',{ 'Condition Number' 'Norm of r'});
tableOfResults.Properties.RowNames = {'part a' 'part b' 'part c'};
disp(tableOfResults);

