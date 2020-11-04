clear all;
clc;

figure(1);
CFor2Norm=calculateAndPlot(2);

figure(2);
CFor1Norm=calculateAndPlot(1);

figure(3);
CForInfNorm=calculateAndPlot(inf);

function C=calculateAndPlot(norm)
    C=[];
    N= 2:2:16;
    for n=N
        H=hilb(n); 
        C=[C; cond(H, norm)];
    end
    semilogy(N,C);
    title(strcat('For',{' '},num2str(norm) , '-Norm'));
end