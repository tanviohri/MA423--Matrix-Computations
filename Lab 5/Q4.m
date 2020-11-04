clear all;
clc;

format long e;

n=50;
kappa=1e5;
A = condmat(n, kappa);

results =[];
[Q, ~] = cgs(A);
results = [results; kappa norm(eye(n)-Q'*Q)];
[Q, ~] = mgs(A);
results = [results; kappa norm(eye(n)-Q'*Q)];
[Q, ~] = cgsrep(A);
results = [results; kappa norm(eye(n)-Q'*Q)];
[Q, ~] = qr(A, 0);
results = [results; kappa norm(eye(n)-Q'*Q)];

tableOfResults=array2table(results,'VariableNames',{ 'Kappa' 'Departure from Orthonormality'});
tableOfResults.Properties.RowNames = {'cgs Method' 'mgs Method' 'cgsrep Method' 'MATLAB Command'};
disp(tableOfResults);