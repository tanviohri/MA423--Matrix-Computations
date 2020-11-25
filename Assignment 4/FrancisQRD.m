function B = FrancisQRD(A) 
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
    if(n==1 || n==2)
        B = A; 
        %According to the shifts that we have chosen, we will get
        %the first reflector (the one we apply on (A-rho*I)(A-tau*I)e1) to
        %be I in these cases. The matrices are already upper hessenberg
        %hence no further reflectors have to be applied.
        return;
    else
        a=A(n-1,n-1);
        b=A(n-1,n);
        c=A(n,n-1);
        d=A(n,n);
        rho =((a+d)+sqrt((a-d)^2 + 4*b*c))/2;
        tau =((a+d)-sqrt((a-d)^2 + 4*b*c))/2;
        %rho and tau are the eigen values of A(n-1:n,n-1:n) in the
        %generalised Rayleigh Quotient shifting strategy.
        %The eigenvalues of a 2x2 matrix can be found easily using the
        %quadratic formula for the 2-degree characteristic polynomial.
        %We can also get these by using the eig function.
        %[~,D] = eig(A(n-1:n,n-1:n));
        %rho = D(1,1);
        %tau = D(2,2);
    end
    %Y=(A-rho*eye(n))*(A-tau*eye(n))e1, Y has only 3 non-zero entries, we generate 3x1 X=Y(1:3,:)
    X =zeros(3,1); 
    X(1)=(A(1,1)-rho)*(A(1,1)-tau)+ A(1,2)*A(2,1);
    X(2)=A(2,1)*(A(1,1)+A(2,2)-rho-tau);
    X(3)=A(3,2)*A(2,1);
    [u, gamma, ~] = reflect(X);
    B = A;
    B(1:3, 1:n) = applreflect(u,gamma,B(1:3, 1:n));
    B(1:n, 1:3) = (applreflect(u,gamma,(B(1:n, 1:3))'))';
    for i=1:n-2        
        if(i+3>n)
            m=n;
        else
            m=i+3;
        end
        [u, gamma, t] = reflect(B(i+1:m,i));
        B(i+1,i)=-t;
        B(i+2:m,i)=zeros(m-i-1,1);
        B(i+1:m, i+1:n) = applreflect(u,gamma,B(i+1:m, i+1:n));
        B(i:n, i+1:m) = (applreflect(u,gamma,(B(i:n, i+1:m))'))';
    end  
end