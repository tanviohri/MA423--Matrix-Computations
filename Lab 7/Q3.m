clear all;
clc;

n1 =[];
n2 =[];
I = eye(20);

for j=1:15
    A = randn(20);
    [U, ~, V] = svd(A);
    A = (10^(-j+6))*U*V';
    [W, R] = polard1(A);
    [X, T] = polard2(A);
    n1 = [n1 norm(W'*W-I)];
    n2 = [n2 norm(X'*X-I)];
end

figure();
hold on;
plot(1:15, n1, 'r');
plot(1:15, n2, 'g');
legend('ploard1 Method', 'polard2 Method');
hold off;

%polard1 shows some peaks where its performance is worse than polard2.
%However, in most of the cases, the norm of error for polard1 lies much
%below polard2. Hence, polard1 is more reliable/better.