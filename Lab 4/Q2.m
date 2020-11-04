clear all;
clc;

p=[1, -18, 144, -672, 2016, -4032, 5376, -4608, 2304, -512];
tol = 1e-13;
x0=1.95; 
x1=2.05;
step =0.001;
results = [];
while(x0<2-step && x1>2+step)
    results = [results; x0, x1, bisect(p, x0, x1, tol)];
    results = [results; x0+step, x1, bisect(p, x0+step, x1, tol)];
    results = [results; x0, x1-step, bisect(p, x0, x1-step, tol)];
    x0 = x0 + step;
    x1 = x1 - step;
end
tableOfResults=array2table(results,'VariableNames',{'x0' 'x1' 'Value of Root'});
disp(tableOfResults);