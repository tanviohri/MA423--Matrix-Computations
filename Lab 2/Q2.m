clear all;
clc;

for i=4:1:100
   A = randn(i); 
   [LCalculated, UCalculated, p] = gepp(A);
   PCalculated = eye(i);
   PCalculated = PCalculated (p, :);
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