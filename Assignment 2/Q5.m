clear all;
clc;

format long e;

%part (i)
x = 1; k = 0; 
results=[x k];
while 1 + x > 1 
    x = x/2; k = k+1;
    results=[results; x k];
end
tableOfResults_1=array2table(results,'VariableNames',{'x' 'k' });
disp(tableOfResults_1);

%part (ii)
x = 1; k = 0; 
results=[x k];
while x + x > x 
    x = x/2; k = k+1;
    results=[results; x k];
end
tableOfResults_2=array2table(results,'VariableNames',{'x' 'k' });
disp(tableOfResults_2);