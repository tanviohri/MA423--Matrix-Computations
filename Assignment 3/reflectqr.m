function [Q,R] = reflectqr(A) 
%reflectqr works for all n>=m, but flop counts are mentioned for n=m as asked
%in the question

    m = size(A,2);
    n = size(A,1);
    
    if(n==m)
        p = n-1;
    elseif(n>m)
        p=m;
    else
        error('Matrix is neither tall nor square.');
    end
    
    gammaValues = zeros(1,m); %vector that stores gamma values for each reflector
    
    %Cost of Initialization is O(n)
    
    for i=1:p
        [u, gamma, tau] = reflect(A(i:n,i));
        A(i:n, i)=u;
        A(i,i)=-tau;
        A(i:n, i+1:m) = applreflect(u, gamma, A(i:n, i+1:m)); 
        gammaValues(1,i)=gamma;
    end  
    
    R=triu(A); 
    
    %Cost of for loop = 4*n^3/3 + O(n^2) (from slides)
    %Cost of computing the output R = 4*n^3/3 + O(n^2) (initialization and
    %assignment costs are O(n^2))
    
    %changes made to reflectqr to compute Q:
    Q = eye(n);
    %Cost of Initialization is O(n^2)
    
    for i=1:n
        for j = min(i,m):-1:1
            gamma = gammaValues(1,j);        
            u = A(j:n,j);
            u(1)=1;
            Q(j:n,i)=applreflect(u, gamma, Q(j:n,i));
        end
    end
    
    %Cost of for loop = 4*n^3/3 + O(n^2) (from slides)
    %Cost of computing the output Q = 4*n^3/3 + O(n^2) (initialization and
    %assignment costs are O(n^2))   
    
    %Cost of computing both outputs = 8*n^3/3 + O(n^2)
end