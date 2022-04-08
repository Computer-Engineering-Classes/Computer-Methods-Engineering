function I=TrapN(a, b, n)
    format long;
    
    syms x;
    f(x) = atan(x/2)+(3*pi/8)*(x+1); % definir função
    
    d2f(x) = diff(f, 2);
    F2 = matlabFunction(-abs(d2f));
    xM = fminbnd(F2, a, b);
    M = abs(d2f(xM));
    
    h = (b - a)/n;
    X=a:h:b;
    
    S = 0;
    for i = 2:n
       S = S + f(X(i));
    end
    
    I = h/2 * (f(a) + 2 * S + f(b));
    I = vpa(I);
    %EA = vpa(abs(integral(matlabFunction(f), a, b)-I))
    
    erro = -h^2/12 * (b-a) * M;
    fprintf("\nErro = %f\n", erro);
end