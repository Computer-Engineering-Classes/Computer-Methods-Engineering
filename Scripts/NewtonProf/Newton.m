function [W] = Newton(X,tol)
% Implementacao do metodo de Newton
% W - vetor com o resultado
% X - ponto inicial do processo iterativo
% tol - tolerancia permitida para a solucao
    erro=1;
    format long; % formato numerico com mais digitos
    while erro >= tol % inicia o cliclo
        d = (JACO(X))\(-FX(X)); % calcula o deslocamento
        X=X+d; % calcula o novo ponto
        erro = norm(d,inf); % determina o erro
    end
    W = X; % atualiza o valor de saida
end