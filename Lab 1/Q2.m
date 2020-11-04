format long;
clear all;
clc;
answer = [];

for m = 1:1000
    [s, scf, scb] = sumreciprocal(m, 5);
    answer = [answer; m, s, scf, scb];
end
table = array2table(answer,'VariableNames',{'m' 's' 'scf' 'scb'});
disp(table);

%Pasted this table in excel
%Found differences |s-scf| and |s-scb| for each m
%Averaged over these m values to get
%average(|s-scf|)=0.000699378
%average(|s-scb|)=0.000384725
% We see that scb is closer to s on average
% (c) is closer to (a)
