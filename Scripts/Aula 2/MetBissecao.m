function [x] = MetBissecao(a, b, Nit)
    i = 1;
    f_a=Ex2Bissecao(a);
    while(i <= Nit)
        x=(a+b)/2;
        f_x=Ex2Bissecao(x);
         if(i==1)
             T=[i a x b f_x]; %iteracao | a | solucao | b | f(solucao)
         else
             T=[T; i a x b f_x];
         end
        if(f_a*f_x > 0)
            f_a=f_x;
            a=x;
        else
            b=x;
        i=i+1;
        end
    end
    T;
end