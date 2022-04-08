function GS(A,b,maxit)
% A -> matriz dos coeficientes do sistema
% b -> vector dos termos independentes
% tol -> o limite inferior para a norma infinito da diferenca
% entre duas aproximacoes consecutivas
erro=10; % inicializacao do erro
it=1;
D=diag(diag(A)); % Matriz D
L=-tril(A,-1); % Matriz L
U=-triu(A,1); % Matriz U
M=inv(D-L)*U; % matriz de iteracao
N=inv(D-L)*b; % vetor N
x0=[1;0]; % aproximacao inicial tudo a zeros
x0(1)=1; % aproximacao inicial do ex. 2(b)
while it <= maxit % criterio de paragem, controlo do erro
xn=M*x0+N; % formula de recorrencia (sem ; no final)
erro=norm(xn-x0,inf);
xn% atualizacao do erro
x0=xn; % atualizacao do ponto inicial
it=it+1;
end % fim do ciclo
end % fim da funcao
