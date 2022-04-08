function I=SimpsonN(a, b, n)
    if (mod(n, 2) ~= 0)
        error("n tem de ser par!");
    end
    syms x;
    f(x) = x^3-6*x^2-4*x+24; %definir função

    d4f(x) = diff(f, 4);
    
    F4 = matlabFunction(-abs(d4f));
    xM = fminbnd(F4, a, b);
    M = abs(d4f(xM));
    
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
    
    I = h/3*(f(a) + 4*S1 + 2*S2 + f(b));
    I = vpa(I);
    
    erro = -h^4/180 * (b - a) * M; 
    fprintf("\nErro = %.10f\n", erro);
end