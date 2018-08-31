zebra = imread('Set14\zebra.bmp');
%判断输入是灰度图还是RGB图像，并进行相应的处理
s = size(zebra);
if numel(s) > 2
    %确定为RGB彩色图像
    R = zebra(:,:,1);
    [M, N] = size(R);
else
    %确定为灰度图
    [M, N] = size(zebra);
end
zebra_LR = uint8(bicubic(zebra, round(M/3), round(N/3)));
imwrite(zebra_LR, 'LR\zebra_LR.bmp');
zebra_BI = uint8(bicubic(zebra_LR, M, N));
imwrite(zebra_BI, 'BI\zebra_BI.bmp');
psnr_zebra = PSNR(zebra, zebra_BI);
ssim_zebra = SSIM(zebra, zebra_BI);