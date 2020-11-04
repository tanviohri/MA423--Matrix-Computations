function [Q, R] = cgsrep(V)
    m=size(V,2);
    R = zeros(m,m);
    for j=1:m
        %orthogonalization
        R(1:j-1,j)=V(:,1:j-1)'*V(:,j);
        V(:,j)=V(:,j)-V(:,1:j-1)*R(1:j-1,j);
        %reorthogonalization
        temp=V(:,1:j-1)'*V(:,j);
        R(1:j-1,j)=R(1:j-1,j)+temp;
        V(:,j)=V(:,j)-V(:,1:j-1)*temp;
        %steps that don't need to be repeated
        R(j,j)=norm(V(:,j));
        V(:,j)=V(:,j)/R(j,j);
    end
    Q=V;
end