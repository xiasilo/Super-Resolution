%依次读入图像数据，存入pict中，计算每个图像共有多少个LR patch，和总patch数
trainFolder = fullfile(pwd, 'Train');
patchsize = 7;
scale = 4;
sigma = 1.6;

load pictNames;
pictNum = length(pictNames);
pict = cell(pictNum);
LRpatchNum = zeros(pictNum, 1);
LRpatchAddNum = zeros(pictNum, 1);
totalPatchNum = 0;
for i = 1:pictNum
    pict{i} = imread(fullfile(trainFolder, pictNames{i}));
    %将图片取整为scale的倍数
    [h, w, d] = size(pict{i});
    h_ = h - mod(h, scale);  
    w_ = w - mod(w, scale);
    pict{i} = pict{i}(1:h_,1:w_,1:d);
    h_LR = h_ / scale;
    w_LR = w_ / scale;
    LRpatchNum(i) = (h_LR-patchsize+1)*(w_LR-patchsize+1);
    totalPatchNum = totalPatchNum + LRpatchNum(i);
    if i == 1
        LRpatchAddNum(i) = LRpatchNum(i);
    else
        LRpatchAddNum(i) = LRpatchAddNum(i-1) + LRpatchNum(i);
    end
end
save pict pict;
save LRpatchNum LRpatchNum;
save totalPatchNum totalPatchNum;
save LRpatchAddNum LRpatchAddNum;
