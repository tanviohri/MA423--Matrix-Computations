clear all;
clc;

format long e;

fprintf('For n=8:\n')
[xValsFor8, normValsFor8]=helper(8);

fprintf('For n=10:\n')
[xValsFor10, normValsFor10]=helper(10);

fprintf('For n=12:\n')
[xValsFor12, normValsFor12]=helper(12);

function [xVals, normVals]=helper(n)
    H=hilb(n); 
    HI = invhilb(n);
    x= rand(n,1);
    b =H*x;
    x1 = H\ b; 
    x2 = HI*b;
    x3 = geppsolve(H, b);
    xVals = array2table([x x1 x2 x3],'VariableNames',{'x' 'x1' 'x2' 'x3'});
    disp(xVals);
    normVals=array2table([cond(H) norm(x-x1)/norm(x) norm(x-x2)/norm(x) norm(x-x3)/norm(x)],'VariableNames',{'cond(H)' 'norm(x,x1)' 'norm(x,x2)' 'norm(x,x3)'});
    disp(normVals);
end