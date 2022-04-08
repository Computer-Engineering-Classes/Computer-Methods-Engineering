function [retval] = fact(input)
    if ( fix(input) == input && input >= 0)
        if (input == 0)
            retval = 1;
        else
            retval = 1;
            for i = 1 : input
                retval = retval*i;
            end
        end
    end
end