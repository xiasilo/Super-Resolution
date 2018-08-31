function output = SSIM( input_img1, input_img2 )
%计算两图像的结构相似性指数SSIM（Structural Similarity Index）
%   input_img1 - 输入图像1
%   input_img2 - 输入图像2
%   output - 输出SSIM

%判断输入是灰度图还是RGB图像，并进行相应的处理
s = size(input_img1);
if numel(s) > 2
    %确定为RGB彩色图像，将其转换到YCbCr色彩空间，提取Y通道
    input_img1 = rgb2ycbcr(input_img1);
    input_img1 = input_img1(:,:,1);
end
s = size(input_img2);
if numel(s) > 2
    %确定为RGB彩色图像，将其转换到YCbCr色彩空间，提取Y通道
    input_img2 = rgb2ycbcr(input_img2);
    input_img2 = input_img2(:,:,1);
end

input_img1 = double(input_img1);
input_img2 = double(input_img2);
L = 255;
k1 = 0.01;
k2 = 0.03;
c1 = (k1*L)^2;
c2 = (k2*L)^2;
window = GaussianWeight(11, 1.5);
img1 = filter2d(input_img1, window);
img2 = filter2d(input_img2, window);
meanx2 = img1.*img1;
meany2 = img2.*img2;
meanxy = img1.*img2;
varx = filter2d(input_img1.*input_img1, window) - meanx2;
vary = filter2d(input_img2.*input_img2, window) - meany2;
covxy = filter2d(input_img1.*input_img2, window) - meanxy;

temp1 = (2 * meanxy + c1).*(2 * covxy + c2);
temp2 = (meanx2 + meany2 + c1).*(varx + vary + c2);
ssim_map = temp1 ./ temp2;
output = mean2(ssim_map);

end

