function xn=exPontoFixo(x0, err)
    it=1;
    erro=1;
    function y=g(x)
        y=-sqrt(exp(x-1));%mudar aqui
    end
    while(erro >= err)
        xn=g(x0);
        erro=abs(xn-x0);%outro tipo de erro = |(xn-x0)/xn|
        x0=xn;
        fprintf("it(%d) %.7f\n", it, xn);
        it=it+1;
    end
end