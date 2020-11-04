clear all;
clc;

p=[1, -18, 144, -672, 2016, -4032, 5376, -4608, 2304, -512];

x = linspace(1.93, 2.08, 151);
y = Horner (p,x);
z = (x-2).^9;

figure();
hold on;
plot(x, y, 'r');
plot(x, z, 'b');
legend('Horner Estimate', 'Actual Values'); 
hold off;