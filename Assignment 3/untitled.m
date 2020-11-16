clear all;
clc;

for i=5
   A = hess(randn(i,i)); 
   A(:,3) = zeros(i,1);
   [QCalculated, RCalculated] = reflectqr_hess(A);
   [QExpected, RExpected] = qr(A);
   QExpected
   QCalculated
   if(norm(QExpected-QCalculated)>1e-10)
       error('Incorrect Computation of Q');
   end
   if(norm(RExpected-RCalculated)>1e-10)
       error('Incorrect Computation of R');
   end
   if(norm(QCalculated*RCalculated-A)>1e-10)
       error('Incorrect Computation product');
   end   
   if(norm(QCalculated*QCalculated'-eye(i))>1e-10)
       error('Incorrect Computation orthogonal');
   end
end

fprintf('Function works correctly\n');