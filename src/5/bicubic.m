function output_img = bicubic( input_img, height, width )
%使用双三次插值进行图像缩放

%判断输入是灰度图还是RGB图像，并进行相应的处理
s = size(input_img);
if numel(s) > 2
    %确定为RGB彩色图像，分别对三个通道进行双三次插值
    R = input_img(:,:,1);
    G = input_img(:,:,2);
    B = input_img(:,:,3);
    R_ = bicubic_gray(R, height, width);
    G_ = bicubic_gray(G, height, width);
    B_ = bicubic_gray(B, height, width);
    output_img(:,:,1) = R_;
    output_img(:,:,2) = G_;
    output_img(:,:,3) = B_;
else
    %确定为灰度图，直接进行双三次插值
    output_img = bicubic_gray(input_img, height, width);
end
end

