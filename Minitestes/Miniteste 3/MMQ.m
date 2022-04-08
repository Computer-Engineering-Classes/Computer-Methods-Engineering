function MMQ(x,y)
    format long;
    n=length(x);

%   ajustar os dados
    X=x;
    Y=1./y.^2;
%   ajustar as funcoes coeficientes de A e B
    M = [X.^2; ones(1,n)];
    sol=(M*M')\M*Y';
%   ajustar a e b segundo A e B
    a = sol(1);
    b = sol(2);

    fprintf("a = %.10f\nb = %.10f", a, b);
    plot(x,y,'rx');
    hold on;
    xx=min(x):0.01:max(x);

%   ajustar funcao de ajuste
    yy=a+b.*xx;    
%   alterar funcao de ajuste
    error=Erro(x,y,a,b);
    
    fprintf('\nErro = %.10f\n', error);
    plot(xx,yy,'b');
    hold off;
    legend('Dados', 'Ajuste');
end