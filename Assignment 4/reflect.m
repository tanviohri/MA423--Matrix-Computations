function [u, gamma, tau] = reflect(x)
    tau = norm(x);
    if(tau==0)
        y = zeros (length(x),1);
        u = y;
        gamma = 0;
        return;
    end
    tau = tau*sign(x(1));
    y = zeros (length(x),1);
    y(1) = -tau;
    u = (x-y)/(x(1)+tau);
    gamma = (x(1)+tau)/tau;
end

%Q=I-gamma*u*u'