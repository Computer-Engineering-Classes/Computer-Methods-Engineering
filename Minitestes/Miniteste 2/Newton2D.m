function [sol]=Newton2D(X0, erro, maxit)
    it=1;
    err=1;
    syms x y;
    % funcao de entrada
    F(x,y)=[x^2+y^2-2; 9*x^2-y^2-9];
    % isolar os termos no 1.º membro de modo a ter fn(x,y)=0
    J(x,y)=jacobian(F, [x, y]);
    while(err >= erro && it <= maxit)
        Xn=vpa(X0-J(X0(1), X0(2))\F(X0(1), X0(2)));
        err=norm(Xn-X0, inf);
        fprintf("Iteração: %d\nErro: %.10f\n", it, err);
        fprintf("Solução:\n");
        fprintf("\t%.8f\n", Xn);
        X0=Xn;
        it=it+1;
    end  
    fprintf("\nNo Iteracoes: %d\n", it-1);
    fprintf("\n\tSolucao:\n\tx = %f\n\ty = %f\n\n", Xn(1), Xn(2)); 
    sol=Xn;
end

% Como determinar X0 -> ponto inicial
% Usar operações element-wise (.^ em vez de ^, por ex.)
% Para evitar possíveis avisos/erros
% Código a executar:
%ezplot(@(x,y) f1(x,y));
%axis equal;
%hold on;
%ezplot(@(x,y) f2(x,y));
%hold off;