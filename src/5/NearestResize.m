function LRImg = NearestResize( HRImg, scale )
%使用邻近插值将HR图像缩小为LR图像
[h, w, d] = size(HRImg);
h_lr = h*scale;
w_lr = w*scale;
LRImg = zeros(h_lr, w_lr, d);
for i = 1:h_lr
    for j = 1:w_lr
        x = round((i-1)/scale) + 1;
        y = round((j-1)/scale) + 1;
        for d_ = 1:d
        LRImg(i,j,d_) = HRImg(x,y,d_);
        end
    end
end
LRImg = uint8(LRImg);

end

