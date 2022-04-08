function [sol]=Newton3D(X0, erro, maxit)
    it=1;
    err=1;
    syms x y z;
    % funcao de entrada
    F(x,y,z)=[f1; f2; f3];
    % isolar os termos no 1.º membro de modo a ter fn(x,y,z)=0
    J(x,y,z)=jacobian(F, [x, y, z]);
    while(err >= erro && it < maxit)
        Xn=vpa(X0-J(X0(1),X0(2),X0(3))\F(X0(1),X0(2),X0(3)));
        err=norm(Xn-X0, inf);
        X0=Xn;
        it=it+1;
    end  
    fprintf("\n\tSolucao:");
    fprintf(":\n\tx = %f\n\ty = %f\n\tz = %f\n\n", Xn(1), Xn(2), Xn(3)); 
    sol=Xn;
end

% Como determinar X0 -> ponto inicial
% Usar operações element-wise (.^ em vez de ^, por ex.)
% Para evitar possíveis avisos/erros
% Código a executar:
%ezplot(@(x,y,z) f1(x,y,z));
%axis equal;
%hold on;
%ezplot(@(x,y,z) f2(x,y,z));
%hold off;