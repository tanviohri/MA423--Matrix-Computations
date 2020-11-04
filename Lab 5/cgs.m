function [Q, R] = cgs(V)
    m=size(V,2);
    R = zeros(m,m);
    for j=1:m
        R(1:j-1,j)=V(:,1:j-1)'*V(:,j);
        qHat=V(:,j)-V(:,1:j-1)*R(1:j-1,j);
        R(j,j)=norm(qHat);
        V(:,j)=qHat/R(j,j);
    end
    Q=V;
end