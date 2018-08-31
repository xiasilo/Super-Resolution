function output = W( x )
%返回邻近点的权重
x = abs(x);
if 0 <= x && x <= 1
    output = 1.5 * x^3 - 2.5 * x^2 + 1;
elseif 1 < x && x <= 2
    output = -0.5 * x^3 + 2.5 * x^2 - 4 * x +2;
else
    output = 0;
end

end

