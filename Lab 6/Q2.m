clear all;
clc;

load clown.mat; 
[U, S, V] = svd(X); 
%colormap('gray');
results =[];

for k=10:10:(200-1)
    %image(U(:, 1:k)*S(1:k, 1:k)*V(:,1:k)');
    results = [results; k 520*k/6400 S(k+1,k+1)/S(1,1)];
end

tableOfResults=array2table(results,'VariableNames',{ 'k' 'Compression' 'Error'});
disp(tableOfResults);

