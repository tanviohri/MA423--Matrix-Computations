function x = bisect(p, x0, x1, tol)
    p0 = Horner(p,x0);
    p1 = Horner(p,x1);
    if(p0==0)
        x=x0;
        return;
    elseif (p1==0)
        x=x1;
        return;
    elseif(Horner(p,x0)*Horner(p,x1)>0)
        x=NaN;
        %fprintf(' x0=%f and x1=%f. p(x0) and p(x1) are of same sign. Aborting.\n', x0, x1);
        return;
    end
    x = (x0 + x1)/2;
    while((x1-x0)>2*tol)
        x = (x0 + x1)/2;
        temp = Horner(p,x);
        if(temp==0) 
            break;
        elseif(Horner(p, x0)*temp<0)
            x1=x;
        else
            x0=x;
        end
    end
end