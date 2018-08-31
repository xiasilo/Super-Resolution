% load trans;
% load featureCenter;
% featureCenter = featureCenter';
lr_patch_exclude_corner = [2:6 8:42 44:48];
LRpict = imread('LR\comic_LR.bmp');
DestH = 520;
DestW = 361;
LR_YUV = rgb2ycbcr(LRpict);
Y = LR_YUV(:,:,1);
U = LR_YUV(:,:,2);
V = LR_YUV(:,:,3);
U_ = bicubic(U, DestH, DestW);
V_ = bicubic(V, DestH, DestW);

%º∆À„Y
[h, w] = size(Y);
Y_padding = zeros(h+8, w+8);
Y_padding(5:h+4, 5:w+4) = Y;
for i = 1:4
    Y_padding(i,5:w+4) = Y(1,:);
    Y_padding(h+i+4,5:w+4) = Y(h,:);
    Y_padding(5:h+4,i) = Y(:,1);
    Y_padding(5:h+4,w+4+i) = Y(:,w);
end
Y_padding(1:4,1:4) = Y(1,1);
Y_padding(1:4,w+5:w+8) = Y(1,w);
Y_padding(h+5:h+8,1:4) = Y(h,1);
Y_padding(h+5:h+8,w+5:w+8) = Y(h,w);

HR_Y_padding = zeros(4*h+16, 4*w+16);
for i = 1:h+2
    for j = 1:w+2
        feature = Y_padding(i:i+6,j:j+6);
        feature = feature(:);
        feature = feature(lr_patch_exclude_corner);
        fmean = mean(feature);
        feature = feature - fmean;
        class = 1;
        minDistance = MSE(feature, featureCenter(:,1));
        for k = 2:512
            if MSE(feature, featureCenter(:,k)) < minDistance
                class = k;
            end
        end
        feature_cal = [feature; 1];
        feature_144 = trans(:,:,class)*feature_cal;
        feature_144 = feature_144 + fmean;
        index = 1;
        for a = 4*(i-1)+1:4*(i-1)+12
            for b = 4*(j-1)+1:4*(j-1)+12
                HR_Y_padding(a,b) = HR_Y_padding(a,b)+feature_144(index);
                index = index+1;
            end
        end
    end
end
HR_Y_padding = (HR_Y_padding(9:8+4*h,9:8+4*w))/9;
Y_ = bicubic(HR_Y_padding, DestH, DestW);
HR_YUV = zeros(DestH,DestW,3);
HR_YUV(:,:,1) = Y_;
HR_YUV(:,:,2) = U_;
HR_YUV(:,:,3) = V_;
HRpict = ycbcr2rgb(uint8(HR_YUV));

