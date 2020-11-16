% Proof for O(n^2):
% => reflectqr(A) for general matrix A is O(n^3)
% => but in Upper hessenberg Matrix we have, only one non zero element
% below diagonal entry in a column. so we only need to find reflector of
% size 2 in for every column.
% since size(u) == 2 => applreflect will take O(n) for every column.
% => algorithm will take O(n^2)


function [Q,R] = reflectqr_hess(A) 

    %m=n for Hessenberg Matrix so we don't have to store both
    %but we have made minimal changes to reflectqr for easier 
    %understanding
    m = size(A,2);
    n = size(A,1);
    
    if(n==m)
        p = n-1;
    elseif(n>m)
        p=m;
    else
        error('Matrix is neither tall nor square.');
    end
    
    gammaValues = zeros(1,m); % vector that stores gamma values for each reflector
    
    % Cost of Initialization is O(n)
    
    for i=1:p
        [u, gamma, tau] = reflect(A(i:i+1,i));
        A(i:i+1, i)=u;
        A(i,i)=-tau;
        A(i:i+1, i+1:m) = applreflect(u, gamma, A(i:i+1, i+1:m)); 
        gammaValues(1,i)=gamma;
    end  
    
    R=triu(A); 
    
    % Cost of for loop = O(n^3), in general scenario, but here we have only
    % one non zero element below diagonal entry in column.
    % So size(u) = 2. => applereflect will take O(n) time. => For loop will
    % take O(n^2).
    % Cost of computing the output R = O(n^2) (initialization and
    % assignment costs are O(n))
    
    Q = eye(n);
    % Cost of Initialization is O(n^2)
    
    for i=1:n
        for j = min(i,m):-1:1
            gamma = gammaValues(1,j);   
            e = j+1;
            if e > n
                e = n;
            end
            u = A(j:e,j);
            u(1)=1;
            Q(j:e,i)=applreflect(u, gamma, Q(j:e,i)); % size(u) == 2 => Computation time: C
        end
    end
    
    % Cost of for loop = O(n^2) (2 for loops, and constant time computation
    % inside second loop).
    % Cost of computing the output Q = O(n^2)  
    
    % Cost of computing both outputs = O(n^2)
end