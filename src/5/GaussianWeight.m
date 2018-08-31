function output = GaussianWeight( size, sigma )
%生成高斯权重矩阵
half = size/2;
output = zeros(size, size);
for x = -half+0.5:1:half-0.5
    for y = -half+0.5:1:half-0.5
        temp = exp(-(x^2+y^2)/(2*sigma^2))/(2*pi*sigma^2);
        output(x+half+0.5, y+half+0.5) = temp;
    end
end
output = output/sum(sum(output));

end

