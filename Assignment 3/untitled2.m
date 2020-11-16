clear all;
clc;

for j=2:100
    for i=2:100
        A=condmat(i,j,1000);
        if(abs(cond(A)-1000)>1e-5)
            fprintf("i=%d j=%d cond=%f\n",i,j, cond(A,2));
        elseif(size(A,1)~=i)
            fprintf("i=%d j=%d size1=%d\n",i,j, size(A,1));
        elseif(size(A,2)~=j)
            fprintf("i=%d j=%d size2=%d\n",i,j, size(A,2));
        end
    end
end
fprintf('All good!\n');