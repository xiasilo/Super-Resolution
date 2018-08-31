function [ output_img ] = filter2d( input_img, filter )
%使用滤波器filter对input_img进行相关操作
%   只显示不包含0的部分
input_img = double(input_img);
[M, N] = size(input_img);
[m, n] = size(filter);
output_img = zeros(M-m+1, N-n+1);
for i = 1:M-m+1
    for j = 1:N-n+1
        temp = input_img(i:i+m-1, j:j+n-1);
        output_img(i, j) = sum(sum(temp.*filter));
    end
end


end

