function TDD = divdiff(X, Y)
%   The following formula is solved:
%       Pn(x) = f(x0) + f[x0,x1](x-x0) + f[x0,x1,x2](x-x0)(x-x1) + ...
%           + f[x0,x1,..,xn](x-x0)(x-x1)..(x-x[n-1])
%       where f[x0,x1] = (f(x1-f(x0))/(x1-x0)
%             f[x0,x1,..,xn] = (f[x1,..,xn]-f[x0,..,x_[n-1]])/(xn-x0)
    [ p, m ] = size(X); % m points, polynomial order <= m-1
    if p ~= 1 || p ~=size(Y, 1) || m ~= size(Y, 2)
        error('divdiff: input vectors must have the same dimension'); 
    end
    TDD = zeros(m, m);
    TDD(:, 1) = Y';
    for j=2:m
        for i=1:(m-j+1)
            TDD(i,j)=(TDD(i+1,j-1)-TDD(i,j-1))/(X(i+j-1)-X(i));
        end
    end
end