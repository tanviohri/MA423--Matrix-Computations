function x = cramer(A,b)
    
    n = size(A,1);

    x = zeros(n,1);

    detA = det(A);

    if(detA==0)
    	error('System of equation does not have any solution\n');
    end

    for i=1:n

    	col = A(:,i);
    	
    	A(:,i) = b;
    	
    	x(i) = det(A)/detA;
    	
    	A(:,i) = col;
    
    end

end