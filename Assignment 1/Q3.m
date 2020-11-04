clear all;
clc;

for i=4:1:200
   a = i;
   b = i*2 + 10;
   r = a + (b-a).*rand(i,1); 
   D = diag(r);
   B = randn(i);
   [Q,~] = qr(B);
   A = Q'*D*Q;
   GCalculated = mychol(A);
   GExpected = chol(A);
   if(~eq(GExpected,GCalculated))
       error('Incorrect Computation of G');
   end
end

fprintf('Function works correctly\n');