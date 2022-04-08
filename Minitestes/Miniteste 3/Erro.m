function error=Erro(x, y, a, b)
    n=length(x);
    aux=0;
    for i=1:n          
%       ajustar funcao de ajuste
        aux=aux+(y(i) - 1/sqrt(a*(x(i))^2+b))^2;
    end
    error=sqrt(aux);
end