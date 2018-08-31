function [LRImg] = GenerateLRImg( HRImg, scale, sigma )
%由高斯模糊生成LR图像
[h, w, d] = size(HRImg);
h_lr = h/scale;
w_lr = w/scale;
    
if mod(scale, 2) == 1
    kernelsize = ceil(sigma * 3)*2+1;
    kernel = GaussianWeight(kernelsize, sigma);
    blurImg = filter2d(HRImg, kernel);
    LRImg = NearestResize(blurImg, 1/scale);
elseif mod(scale,2) == 0
    sampleShift = scale/2;
    kernelsize = ceil(sigma*3)*2+2;
    kernel = GaussianWeight(kernelsize, sigma);
    blurImg = filter2d(HRImg, kernel);
    LRImg = zeros(h_lr, w_lr, d);
    for d_ = 1:d
        for h_ = 1:h_lr
            h_hr = (h_-1)*scale + sampleShift;
            for w_ = 1:w_lr
                w_hr = (w_-1)*scale + sampleShift;
                LRImg(h_,w_,d_) = blurImg(h_hr,w_hr,d_);
            end
        end
    end
    LRImg = uint8(LRImg);
end

end

