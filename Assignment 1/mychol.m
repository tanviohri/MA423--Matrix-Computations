function G =  mychol(A)
	n= size(A,1);
	G = zeros(n,n);
	if(A(1,1)<=0)
		error('Matrix is not positive definite');
	end
	G(1,1) = sqrt(A(1,1));
	if(n>1)
		G(1,2:n) = A(1,2:n)/(G(1,1));
		G(2:n,2:n) = mychol(A(2:n,2:n) - (G(1,2:n)')*(G(1,2:n)));
	end

end
