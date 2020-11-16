clear all;
clc;

n1 =[];
n2 =[];
n3 =[];

for n=5:12
    A = hilb(n);
    R1 = mysqrt1(A);
    R2 = mysqrt2(A);
    R3 = sqrtm(A);
    n1 = [n1 norm(A-R1*R1)/norm(A)];
    n2 = [n2 norm(A-R2*R2)/norm(A)];
    n3 = [n3 norm(A-R3*R3)/norm(A)];
end

figure();
hold on;
plot(5:12, n1, 'r');
plot(5:12, n2, 'g');
plot(5:12, n3, 'b');
legend('mysqrt1 Method', 'mysqrt2 Method', 'sqrtm Method');
hold off;

%mysqrt2 shows the worst performance in all cases.
%sqrtm tends to show better performance that mysqrt1 around 6 and 8 but is
%poorer otherwise
%Hence, it can not be said with certainty which method is better.