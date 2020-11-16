clear all;
clc;

u1 =[];
u2 =[];
v1= [];
v2= [];
I = eye(20);

for j=1:15
    A = randn(20);
    [U1, ~, V1] = svd(A);
    [U2, ~, V2] = svdFromPolar(A);
    u1 = [u1 norm(U1'*U1-I)];
    u2 = [u2 norm(U2'*U2-I)];
    v1 = [v1 norm(V1'*V1-I)];
    v2 = [v2 norm(V2'*V2-I)];
end

figure(1);
hold on;
plot(1:15, u1, 'r');
plot(1:15, u2, 'g');
legend('MATLAB svd Method', 'SVD from Polar Decomposition Method');
title('Departure from Orthonormality for U');
hold off;

figure(2);
hold on;
plot(1:15, v1, 'r');
plot(1:15, v2, 'g');
legend('MATLAB svd Method', 'SVD from Polar Decomposition Method');
title('Departure from Orthonormality for V');
hold off;

%MATLAB svd method gives smaller departure from orthonormality values.
%Hence, that is the more reliable method.