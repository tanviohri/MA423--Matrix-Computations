function [B, k] = CallFrancisQR(A, m, tol)
    n = size(A, 1);
    % check for hessen form:
    for i=1:n
        for j=i+2:n
            if A(j, i) ~= 0
                fprintf("Matrix is not in Hessenberg form.");
                B = [];
                k = 0;
                return
            end
        end
    end
    k = 0;   
    
    if(n==1)
        B=A;
        return;
    end
    if(n==2 && m==2)
        B=A;
        return;
    end
    
    found = false;
    while ~found
           if m == 1
               A = FrancisQRS(A);
           elseif m == 2
               A = FrancisQRD(A);
           end
           k = k+1;
           for i=1:n-1
              if abs(A(i+1, i)) < tol
                  found = true;
                  break;
              end
           end
    end
    B = A;
end
