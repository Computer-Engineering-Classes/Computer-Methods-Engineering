function sol=exNewton(x0, Nit)
    it=1;
    function y=f(x)
        y=-x-cos(x);%mudar aqui
    end
    function dy=df(x)
        dy=-1+sin(x);%mudar aqui
    end
    do=true;
    while(do)
        xn=x0-f(x0)/df(x0);
        %erro=abs(xn-x0); %erro = |xn-x0|
        x0=xn;
        fprintf("it(%d) %.8f\n", it, x0);
        it=it+1;
        do=(it <= Nit);
    end
    sol=xn;
end