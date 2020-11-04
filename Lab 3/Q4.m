clear all;
clc;
 
results = [];
results = [results; helper(32, "gepp")];
results = [results; helper(32, "QR")];
results = [results; helper(64, "gepp")];
results = [results; helper(64, "QR")];

tableOfResults=array2table(results,'VariableNames',{'n' 'MethodUsed' 'cond' 'forwardError' 'rBYb'});
disp(tableOfResults);

function paramVal=helper(n, method)
    W = Wilkinson(n);
    x = randn (n,1);
    b = W*x;
    if(method=="gepp")
        xHat = geppsolve (W,b);
    else
        [Q R] = qr(W);
        xHat = colbackward (R, Q'*b);
    end
    condVal = cond (W, inf);
    forwardError = norm(xHat-x, inf)/norm(x, inf);
    r = W*xHat-b;
    rBYb = norm(r, inf)/norm(b, inf);
    fprintf('For n=%d and method %s:\n', n, method);
    xHat
    x
    paramVal = [n method condVal forwardError rBYb];
end