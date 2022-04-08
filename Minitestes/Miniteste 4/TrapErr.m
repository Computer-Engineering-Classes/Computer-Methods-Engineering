function I=TrapErr(a, b, error)
    syms x;
    f(x) = log(x+1); % definir função
    
    d2f(x) = diff(f, 2);
    F2 = matlabFunction(-abs(d2f));
    xM = fminbnd(F2, a, b);
    M = abs(d2f(xM));
    
    n = ceil(sqrt(M * (b-a)^3/(12 * error)));
    fprintf("\nn = %d\n", n);
    
    h = (b - a)/n;
    X=a:h:b;
    
    S = 0;
    for i = 2:n
       S = S + f(X(i));
    end
    
    I = h/2 * (f(a) + 2 * S + f(b));
    %EA = vpa(abs(integral(matlabFunction(f), a, b)-I))
    I = vpa(I);
end