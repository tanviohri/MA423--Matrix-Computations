function [Q, R] = mgs(V)
    m=size(V,2);
    R = zeros(m,m);
    for j=1:m
        qTilde = V(:,j);
        for i=1:j-1
            R(i,j)=V(:,j)'*V(:,i);
            qTilde = qTilde - R(i,j)*V(:,i);
        end
        R(j,j)=norm(qTilde);
        V(:,j)=qTilde/R(j,j);
    end
    Q=V;
end