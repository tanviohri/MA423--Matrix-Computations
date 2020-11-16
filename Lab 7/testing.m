clear all;
clc;

for i=5
   A = randn(i-1,i); 
   [WCalculated, RCalculated] = polard3(A);
   [WExpected, RExpected] = polard1(A);
   [u s v] =svd(A)
   u 
   s
   v
   RExpected
   RCalculated
   if(norm(WExpected-WCalculated)>1e-10)
       error('Incorrect Computation of Q');
   end
   if(norm(RExpected-RCalculated)>1e-10)
       error('Incorrect Computation of R');
   end
end

fprintf('Function works correctly\n');