clear all;
clc;

for i=4:1:200
   A = randn(i); 
   [LCalculated, UCalculated, PCalculated] = gepp(A);
   [LExpected, UExpected, PExpected] = lu(A);
   if(~eq(LExpected,LCalculated))
       error('Incorrect Computation of L');
   end
   if(~eq(UExpected,UCalculated))
       error('Incorrect Computation of U');
   end
   if(~eq(PExpected,PCalculated))
       error('Incorrect Computation of p');
   end
end

fprintf('Function works correctly\n');