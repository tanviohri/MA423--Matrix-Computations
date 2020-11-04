function B = applreflect(u, gamma, A)
    v = gamma*u;
    wT = u'*A;
    C = v*wT;
    B = A - C;
end