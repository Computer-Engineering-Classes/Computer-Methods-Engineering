function [sol]=Jacobi(A, b, erro, maxit)
    it=1;
    err=1;
    
    D=diag(diag(A));
    L=-tril(A, -1);
    U=-triu(A, 1);
    M=D\(L+U);
    N=D\b;   
    p=max(abs(eig(M)));
    if(p < 1)
        fprintf("O método de Jacobi converge.\n");
        X0=zeros(size(A, 2), 1);
        while(err >= erro && it <= maxit)
            Xn=M*X0+N;
            err=norm(Xn-X0, inf); % erro absoluto
            % erro relativo     err=norm(Xn-X0)/norm(Xn);
            % erro da funcao    err=norm(A*Xn-b);
            fprintf("Iteração: %d\nErro: %.10f\n", it, err);
            fprintf("Solução:\n");
            fprintf("\t%.10f\n", Xn);
            X0=Xn;
            it=it+1;
        end
        sol=Xn;
    else
        fprintf("O método de Jacobi não converge.\n");
    end
end