function d = mydet(A)
    [~, U, ~, sigma] = geppForDet(A); %O(n^3) flops
    d = prod(diag(U)) * sigma; %O(n^2) flops
end
%Entire Method takes O(n^3) flops