function I=SimpsonErr(a, b, error)
    syms x;
    f(x) = 3*sin(x/2); %definir função

    d4f(x) = diff(f, 4);
    F4 = matlabFunction(-abs(d4f));
    xM = fminbnd(F4, a, b);
    M = abs(d4f(xM));
    
    n = ceil((M*(b-a)^5/(180*error))^(1/4));
    if (mod(n, 2) ~= 0)
        n = double(n + 1);
    end
    fprintf("\nn = %d\n", n);
    
    h = (b - a)/n;
    X=a:h:b;
    
    S1 = 0;
    for i = 1:n/2
       S1 = S1 + f(X(2*i));
    end
    S2 = 0;
    for i = 2:n/2
       S2 = S2 + f(X(2*i - 1));
    end
    
    I = h/3 * (f(a) + 4*S1 + 2*S2 + f(b));
    I = vpa(I);
end