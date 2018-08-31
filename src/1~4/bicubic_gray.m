function output_img = bicubic_gray( input_img, height, width )
%对灰度图进行双三次插值计算
%   input_img - 输入图像
%   height - 目标图像的高
%   width - 目标图像的宽
input_img = double(input_img);
output_img = zeros(height, width);
[M, N] = size(input_img);
padding_img = zeros(M+4, N+4);
for i = 3 : M+2
    for j = 3 : N+2
        padding_img(i, j) = input_img(i-2, j-2);
    end
end
for i = 3 : M+2
    padding_img(i, 1) = input_img(i-2, 1);
    padding_img(i, 2) = input_img(i-2, 1);
    padding_img(i, N+3) = input_img(i-2, N);
    padding_img(i, N+4) = input_img(i-2, N);
end
for i = 3 : N+2
    padding_img(1, i) = input_img(1, i-2);
    padding_img(2, i) = input_img(1, i-2);
    padding_img(M+3, i) = input_img(M, i-2);
    padding_img(M+4, i) = input_img(M, i-2);
end
padding_img(1, 1) = input_img(1, 1);
padding_img(1, 2) = input_img(1, 1);
padding_img(2, 1) = input_img(1, 1);
padding_img(2, 2) = input_img(1, 1);
padding_img(M+3, 1) = input_img(M, 1);
padding_img(M+4, 1) = input_img(M, 1);
padding_img(M+3, 2) = input_img(M, 1);
padding_img(M+4, 2) = input_img(M, 1);
padding_img(1, N+3) = input_img(1, N);
padding_img(1, N+4) = input_img(1, N);
padding_img(2, N+3) = input_img(1, N);
padding_img(2, N+4) = input_img(1, N);
padding_img(M+3, N+3) = input_img(M, N);
padding_img(M+4, N+3) = input_img(M, N);
padding_img(M+3, N+4) = input_img(M, N);
padding_img(M+4, N+4) = input_img(M, N);

for i = 1:height
    for j = 1:width
        cal_x = i * (M / height)+2;
        cal_y = j * (N / width)+2;
        x = fix(cal_x);
        y = fix(cal_y);
        total = 0;
        for u = x-1 : x+2
            for v = y-1 : y+2
               total = total + padding_img(u, v)*W(cal_x-u)*W(cal_y - v);
            end
        end
        total = round(total);
        if total > 255
            total = 255;
        end
        if total < 0
            total = 0;
        end
        output_img(i, j) = total;
    end
end

end

