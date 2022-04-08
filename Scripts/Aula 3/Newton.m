function sol=Newton(x0, err) %x0 é a aproximação inicial e err é o erro
max_iter=100; %n.º máximo de iterações
erro=1;
i=0;
fprintf("i    x_n            erro\n");
fprintf("%d    %.8f    %.8f\n", i, x0, erro);
i=i+1;
    function y=f(x)
        y=exp(x-1)-x^2;
    end
    function y=df(x)
        y=exp(x-1)-2*x;
    end
while(erro >= err && i < max_iter)
    x_n=x0-f(x0)/df(x0);
    erro=abs(f(x_n));
    fprintf("%d    %.8f    %.8f\n", i, x_n, erro);
    x0=x_n;
    i=i+1;
end
sol=x_n;
end