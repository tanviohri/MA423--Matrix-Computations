clear all;
clc;

format long e;

verify([1 1 1; -1 9 2; 0 -1 2], 'a');
verify([1 1 1; -1 9 2; -4 -1 2], 'b');
verify([1 1 1; -1 3 2; -4 -1 2], 'c');

function verify(A, part)
    fprintf("\n\n Part (%s)\n", part);
    x= [1 1 1]';
    k = 20;
    [V, D] = eig(A);
    [D, p] = sort(diag(abs(D)), 'descend');
    fprintf("The value of lambda_1: %e\n", D(1));
    fprintf("The value of lambda_2: %e\n", D(2));
    V = V(:, p);
    v = V(:, 1);
    fprintf("The vector v is: \n");
    disp(v);
    [iter, lambda] = Powermethod(A, x, k);
    iter=normc(iter);
    fprintf("The value of lambda returned by Powermethod is %e\n", lambda);
    fprintf("The value of v returned by Powermethod is:\n");
    disp(iter(:,k));
    fprintf("The value of |lambda_2|/|lambda_1| is %e\n", D(2)/D(1));
    fprintf("The value of |iter(:,j+1)-v|/|iter(:,j)-v| are:\n");
    for j=1:k-1
        fprintf("%e\n", norm(iter(:,j+1)-v)/norm(iter(:,j)-v));
    end
end