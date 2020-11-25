function B = FrancisQRS(A) 
    n = size(A,1);
    %condition to check A is upper hessenberg
    for i=1:n
        for j=i+2:n
            if A(j, i) ~= 0
                fprintf("Matrix is not in Hessenberg form.");
                B = [];
                return
            end
        end
    end
    if(n==1)
        B=A;
        return;
    end
    rho = A(n,n);
    [u, gamma, ~] = reflect(A(1:2,1)-rho*eye(2,1));
    B = A;
    B(1:2, 1:n) = applreflect(u,gamma,B(1:2, 1:n));
    B(1:n, 1:2) = (applreflect(u,gamma,(B(1:n, 1:2))'))';
    for i=1:n-2    
        [u, gamma, t] = reflect(B(i+1:i+2,i));
        B(i+1,i)=-t;
        B(i+2,i)=0;
        B(i+1:i+2, i+1:n) = applreflect(u,gamma,B(i+1:i+2, i+1:n));
        B(i:n, i+1:i+2) = (applreflect(u,gamma,(B(i:n, i+1:i+2))'))';
    end  
end