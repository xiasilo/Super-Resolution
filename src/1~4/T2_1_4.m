baboon = imread('Set14\baboon.bmp');
%判断输入是灰度图还是RGB图像，并进行相应的处理
s = size(baboon);
if numel(s) > 2
    %确定为RGB彩色图像
    R = baboon(:,:,1);
    [M, N] = size(R);
else
    %确定为灰度图
    [M, N] = size(baboon);
end
baboon_LR = uint8(bicubic(baboon, round(M/3), round(N/3)));
imwrite(baboon_LR, 'LR\baboon_LR.bmp');
baboon_BI = uint8(bicubic(baboon_LR, M, N));
imwrite(baboon_BI, 'BI\baboon_BI.bmp');
psnr_baboon = PSNR(baboon, baboon_BI);
ssim_baboon = SSIM(baboon, baboon_BI);

barbara = imread('Set14\barbara.bmp');
%判断输入是灰度图还是RGB图像，并进行相应的处理
s = size(barbara);
if numel(s) > 2
    %确定为RGB彩色图像
    R = barbara(:,:,1);
    [M, N] = size(R);
else
    %确定为灰度图
    [M, N] = size(barbara);
end
barbara_LR = uint8(bicubic(barbara, round(M/3), round(N/3)));
imwrite(barbara_LR, 'LR\barbara_LR.bmp');
barbara_BI = uint8(bicubic(barbara_LR, M, N));
imwrite(barbara_BI, 'BI\barbara_BI.bmp');
psnr_barbara = PSNR(barbara, barbara_BI);
ssim_barbara = SSIM(barbara, barbara_BI);

bridge = imread('Set14\bridge.bmp');
%判断输入是灰度图还是RGB图像，并进行相应的处理
s = size(bridge);
if numel(s) > 2
    %确定为RGB彩色图像
    R = bridge(:,:,1);
    [M, N] = size(R);
else
    %确定为灰度图
    [M, N] = size(bridge);
end
bridge_LR = uint8(bicubic(bridge, round(M/3), round(N/3)));
imwrite(bridge_LR, 'LR\bridge_LR.bmp');
bridge_BI = uint8(bicubic(bridge_LR, M, N));
imwrite(bridge_BI, 'BI\bridge_BI.bmp');
psnr_bridge = PSNR(bridge, bridge_BI);
ssim_bridge = SSIM(bridge, bridge_BI);

coastguard = imread('Set14\coastguard.bmp');
%判断输入是灰度图还是RGB图像，并进行相应的处理
s = size(coastguard);
if numel(s) > 2
    %确定为RGB彩色图像
    R = coastguard(:,:,1);
    [M, N] = size(R);
else
    %确定为灰度图
    [M, N] = size(coastguard);
end
coastguard_LR = uint8(bicubic(coastguard, round(M/3), round(N/3)));
imwrite(coastguard_LR, 'LR\coastguard_LR.bmp');
coastguard_BI = uint8(bicubic(coastguard_LR, M, N));
imwrite(coastguard_BI, 'BI\coastguard_BI.bmp');
psnr_coastguard = PSNR(coastguard, coastguard_BI);
ssim_coastguard = SSIM(coastguard, coastguard_BI);

comic = imread('Set14\comic.bmp');
%判断输入是灰度图还是RGB图像，并进行相应的处理
s = size(comic);
if numel(s) > 2
    %确定为RGB彩色图像
    R = comic(:,:,1);
    [M, N] = size(R);
else
    %确定为灰度图
    [M, N] = size(comic);
end
comic_LR = uint8(bicubic(comic, round(M/3), round(N/3)));
imwrite(comic_LR, 'LR\comic_LR.bmp');
comic_BI = uint8(bicubic(comic_LR, M, N));
imwrite(comic_BI, 'BI\comic_BI.bmp');
psnr_comic = PSNR(comic, comic_BI);
ssim_comic = SSIM(comic, comic_BI);

face = imread('Set14\face.bmp');
%判断输入是灰度图还是RGB图像，并进行相应的处理
s = size(face);
if numel(s) > 2
    %确定为RGB彩色图像
    R = face(:,:,1);
    [M, N] = size(R);
else
    %确定为灰度图
    [M, N] = size(face);
end
face_LR = uint8(bicubic(face, round(M/3), round(N/3)));
imwrite(face_LR, 'LR\face_LR.bmp');
face_BI = uint8(bicubic(face_LR, M, N));
imwrite(face_BI, 'BI\face_BI.bmp');
psnr_face = PSNR(face, face_BI);
ssim_face = SSIM(face, face_BI);

flowers = imread('Set14\flowers.bmp');
%判断输入是灰度图还是RGB图像，并进行相应的处理
s = size(flowers);
if numel(s) > 2
    %确定为RGB彩色图像
    R = flowers(:,:,1);
    [M, N] = size(R);
else
    %确定为灰度图
    [M, N] = size(flowers);
end
flowers_LR = uint8(bicubic(flowers, round(M/3), round(N/3)));
imwrite(flowers_LR, 'LR\flowers_LR.bmp');
flowers_BI = uint8(bicubic(flowers_LR, M, N));
imwrite(flowers_BI, 'BI\flowers_BI.bmp');
psnr_flowers = PSNR(flowers, flowers_BI);
ssim_flowers = SSIM(flowers, flowers_BI);

foreman = imread('Set14\foreman.bmp');
%判断输入是灰度图还是RGB图像，并进行相应的处理
s = size(foreman);
if numel(s) > 2
    %确定为RGB彩色图像
    R = foreman(:,:,1);
    [M, N] = size(R);
else
    %确定为灰度图
    [M, N] = size(foreman);
end
foreman_LR = uint8(bicubic(foreman, round(M/3), round(N/3)));
imwrite(foreman_LR, 'LR\foreman_LR.bmp');
foreman_BI = uint8(bicubic(foreman_LR, M, N));
imwrite(foreman_BI, 'BI\foreman_BI.bmp');
psnr_foreman = PSNR(foreman, foreman_BI);
ssim_foreman = SSIM(foreman, foreman_BI);

lenna = imread('Set14\lenna.bmp');
%判断输入是灰度图还是RGB图像，并进行相应的处理
s = size(lenna);
if numel(s) > 2
    %确定为RGB彩色图像
    R = lenna(:,:,1);
    [M, N] = size(R);
else
    %确定为灰度图
    [M, N] = size(lenna);
end
lenna_LR = uint8(bicubic(lenna, round(M/3), round(N/3)));
imwrite(lenna_LR, 'LR\lenna_LR.bmp');
lenna_BI = uint8(bicubic(lenna_LR, M, N));
imwrite(lenna_BI, 'BI\lenna_BI.bmp');
psnr_lenna = PSNR(lenna, lenna_BI);
ssim_lenna = SSIM(lenna, lenna_BI);

man = imread('Set14\man.bmp');
%判断输入是灰度图还是RGB图像，并进行相应的处理
s = size(man);
if numel(s) > 2
    %确定为RGB彩色图像
    R = man(:,:,1);
    [M, N] = size(R);
else
    %确定为灰度图
    [M, N] = size(man);
end
man_LR = uint8(bicubic(man, round(M/3), round(N/3)));
imwrite(man_LR, 'LR\man_LR.bmp');
man_BI = uint8(bicubic(man_LR, M, N));
imwrite(man_BI, 'BI\man_BI.bmp');
psnr_man = PSNR(man, man_BI);
ssim_man = SSIM(man, man_BI);

monarch = imread('Set14\monarch.bmp');
%判断输入是灰度图还是RGB图像，并进行相应的处理
s = size(monarch);
if numel(s) > 2
    %确定为RGB彩色图像
    R = monarch(:,:,1);
    [M, N] = size(R);
else
    %确定为灰度图
    [M, N] = size(monarch);
end
monarch_LR = uint8(bicubic(monarch, round(M/3), round(N/3)));
imwrite(monarch_LR, 'LR\monarch_LR.bmp');
monarch_BI = uint8(bicubic(monarch_LR, M, N));
imwrite(monarch_BI, 'BI\monarch_BI.bmp');
psnr_monarch = PSNR(monarch, monarch_BI);
ssim_monarch = SSIM(monarch, monarch_BI);

pepper = imread('Set14\pepper.bmp');
%判断输入是灰度图还是RGB图像，并进行相应的处理
s = size(pepper);
if numel(s) > 2
    %确定为RGB彩色图像
    R = pepper(:,:,1);
    [M, N] = size(R);
else
    %确定为灰度图
    [M, N] = size(pepper);
end
pepper_LR = uint8(bicubic(pepper, round(M/3), round(N/3)));
imwrite(pepper_LR, 'LR\pepper_LR.bmp');
pepper_BI = uint8(bicubic(pepper_LR, M, N));
imwrite(pepper_BI, 'BI\pepper_BI.bmp');
psnr_pepper = PSNR(pepper, pepper_BI);
ssim_pepper = SSIM(pepper, pepper_BI);

ppt3 = imread('Set14\ppt3.bmp');
%判断输入是灰度图还是RGB图像，并进行相应的处理
s = size(ppt3);
if numel(s) > 2
    %确定为RGB彩色图像
    R = ppt3(:,:,1);
    [M, N] = size(R);
else
    %确定为灰度图
    [M, N] = size(ppt3);
end
ppt3_LR = uint8(bicubic(ppt3, round(M/3), round(N/3)));
imwrite(ppt3_LR, 'LR\ppt3_LR.bmp');
ppt3_BI = uint8(bicubic(ppt3_LR, M, N));
imwrite(ppt3_BI, 'BI\ppt3_BI.bmp');
psnr_ppt3 = PSNR(ppt3, ppt3_BI);
ssim_ppt3 = SSIM(ppt3, ppt3_BI);

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