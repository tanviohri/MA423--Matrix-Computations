clear all;
clc;
format long e;
results = [];
for n = 20:20:200
    A = rand(n); 
    A(1,1) = 50*eps*A(1,1);
    [L, U] = genp (A);
    results=[results; [n "genpMethod" norm(L) norm(U) norm(L*U-A)]];
    [L, U, P] = lu (A);
    results=[results; [n "luMethod" norm(L) norm(U) norm(L*U-P*A)]];
end

tableOfResults=array2table(results,'VariableNames',{'n' 'MethodUsed' 'norm(L)' 'norm(U)' 'norm(LU-A)/norm(LU-PA)'});
disp(tableOfResults);