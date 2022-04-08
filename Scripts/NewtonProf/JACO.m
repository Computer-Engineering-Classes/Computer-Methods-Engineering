function [Z] = JACO(X)
% funcao para calcular o Jacobiano
% Z - matriz com os valores das derivadas parciais
% X - ponto onde serao calculados as derivadas
    Z(1,1) = 2*X(1);
    Z(1,2) = 2*X(2);
    Z(2,1) = 2*X(1) - 4;
    Z(2,2) = X(2)/3;
end