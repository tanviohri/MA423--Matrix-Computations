function [u, gamma, tau] = reflect(x)
    tau = norm(x);
    if(x(1)<0) 
        tau=-1*tau;
    end
    y = zeros (length(x),1);
    y(1) = -tau;
    u = (x-y)/(x(1)+tau);
    gamma = (x(1)+tau)/tau;
end

%Q=I-gamma*u*u'