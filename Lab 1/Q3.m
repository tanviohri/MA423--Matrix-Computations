clear all;
clc;

times1 = [];
times2 = [];

for n = 200:50:1150
    A= randn(n);
    b=randn(n, 1);
    tic;
    x = A\b;
    temp = toc;
    times1 = [times1; temp];
    tic;
    x = inv(A)*b;
    temp = toc;
    times2 = [times2; temp];
end
hold on;
semilogx(200:50:1150, times1);
semilogx(200:50:1150, times2);
legend('Time taken for A\b', 'Time taken for inv(A)*b');
xlabel('Size of Matrix');
ylabel('Time taken to compute x');
hold off;
