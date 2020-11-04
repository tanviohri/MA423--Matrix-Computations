clear all;
clc;

for i=4:1:200
   A = randn(i); 
   calculated = myinv(A);
   expected = inv(A);
   for x=1:i
       for y=1:i
           if(abs(calculated(x,y)-expected(x,y))>1e-6)
               error('issue');
           end
       end
   end
end

fprintf('Function works correctly\n');