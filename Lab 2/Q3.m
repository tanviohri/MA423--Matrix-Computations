clear all;
clc;

for i=4:1:100
   A = randn(i); 
   b = randn (i,1);
   xCalculated = geppsolve(A, b);
   xExpected = A\b;
   if(norm(xExpected-xCalculated,2)> 1e-5)
       error('Incorrect Computation of x');
   end
end

fprintf('Function works correctly\n');