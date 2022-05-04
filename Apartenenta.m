function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1

    % a * val1 + b = 0 => b = - a * val1
    % a * val2 + b = 1 => a * val2 - a * val1 = 1 => a * (val2 - val1) = 1

    a = 1 / (val2 - val1);
    b = - a * val1;

    if(x < val1)
        y = 0;
    elseif (x >= val1 && x <= val2)
        y = a * x + b;
    else y = 1;

end