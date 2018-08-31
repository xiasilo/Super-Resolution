function [ output_img ] = filter2d( input_img, filter )
%使用滤波器filter对input_img进行相关操作
%   边界复制延拓
[h, w, d] = size(input_img);
[filterSize, ~] = size(filter);
if d == 3
    output_img(:,:,1) = filter2d(input_img(:,:,1), filter);
    output_img(:,:,2) = filter2d(input_img(:,:,2), filter);
    output_img(:,:,3) = filter2d(input_img(:,:,3), filter);
elseif d == 1
    half = filterSize/2;
    mid = round(half);
    half = fix(half);
    paddingImg = zeros(h + 2*half, w + 2*half);
    paddingImg(half+1:h+half, half+1:w+half) = input_img;
    output_img = zeros(h+2*half-filterSize+1, w+1*half-filterSize);
    %进行边界复制延拓
    for i = 1:half
        paddingImg(half,half+1:half+w) = input_img(1,:);
        paddingImg(half, 1:half) = input_img(1,1);
        paddingImg(half, w+half+1:w+2*half) = input_img(1, w);
        
        paddingImg(half+h+1,half+1:half+w) = input_img(h,:);
        paddingImg(half+h+1, 1:half) = input_img(h,1);
        paddingImg(half+h+1, w+half+1:w+2*half) = input_img(h, w);
        
        paddingImg(half+1:half+h,half) = input_img(:,1);
        paddingImg(half+1:half+h,half+w+1) = input_img(:,w);
    end
    %进行高斯滤波
    for i=1:h+2*half-filterSize+1
        for j = 1:w+2*half-filterSize+1
            temp = paddingImg(i:i+filterSize-1,j:j+filterSize-1).*filter;
            output_img(i, j) = sum(sum(temp));
        end
    end
    h_temp = h+2*half-filterSize+1;
    w_temp = w+2*half-filterSize+1;
    output_img = round(output_img(h_temp-h+1:h_temp,w_temp-w+1:w_temp));
end

end

