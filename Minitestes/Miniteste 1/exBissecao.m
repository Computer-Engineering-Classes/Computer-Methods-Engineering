function sol=exBissecao(a, b, Nit)
    it=1;
    function y=f(x)
        y=log(abs(x+1))-1/(x+1); %mudar aqui
    end
fprintf("a\tc\tb\n");
    while(it <= Nit)
        c=(a+b)/2;
        fprintf("%f %.5f %f\n", a, c, b);
        if(f(a)*f(c)<0)
            b=c;
        else
            a=c;
        end
        it=it+1;
    end
    sol=c;
end