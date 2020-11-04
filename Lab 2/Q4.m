clear all;
clc;

for i=1:1:20
   A = randn(i); 
   detExpected= det(A);
   detCalculated= mydet(A);
   if(abs(detExpected-detCalculated)>1e-5)
       error('Incorrect Computation');
   end
end

fprintf('Function works correctly\n');