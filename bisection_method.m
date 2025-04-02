function root = bisection_method(func, a, b, tol)
% Generic bisection method for root finding
if func(a) * func(b) >= 0
    error('Invalid interval');
end

while (b - a) / 2 > tol
    c = (a + b) / 2;
    if func(c) == 0
        break;
    elseif func(a) * func(c) < 0
        b = c;
    else
        a = c;
    end
end
root = (a + b) / 2;
end
