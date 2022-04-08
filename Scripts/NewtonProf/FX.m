function [Y] = FX(X)
% funcao onde e definida a funcao matematica
% Y - vetor com os valores das funcoes
% X - ponto onde serao calculados os valores das funcoes
    Y(1) = X(1)^2 + X(2)^2 - 4;
    Y(2) = X(1)^2 -4*X(1) + (X(2)^2)/6 + 3;
    Y=transpose(Y); % efetuar a transposta pois queremos o vetor coluna
end