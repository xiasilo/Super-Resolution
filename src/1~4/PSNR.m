function output = PSNR( input_img1, input_img2 )
%峰值信噪比PSNR（Peak Signal-to-Noise Ratio），计算图像1和图像2的PSNR
%   input_img1 - 输入图像1
%   input_img2 - 输入图像2
%   output - 输出PSNR

%判断输入是灰度图还是RGB图像，并进行相应的处理
s = size(input_img1);
if numel(s) > 2
    %确定为RGB彩色图像，将其转换到YCbCr色彩空间，提取Y通道
    input_img1 = rgb2ycbcr(input_img1);
    input_img1 = double(input_img1(:,:,1));
end
s = size(input_img2);
if numel(s) > 2
    %确定为RGB彩色图像，将其转换到YCbCr色彩空间，提取Y通道
    input_img2 = rgb2ycbcr(input_img2);
    input_img2 = double(input_img2(:,:,1));
end

output = 20*log10(255 / sqrt(MSE(input_img1, input_img2)));

end

