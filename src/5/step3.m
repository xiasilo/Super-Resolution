%样本1e5个，随机生成并依次读取相应的patch
% load pict;
% load LRpatchNum;
% load totalPatchNum;
% pictNum = 320;
% scale = 4;
% sigma = 1.6;
% patchsize = 7;
% 
% sampleNum = 300000;
% seed = RandStream('mcg16807','Seed',0); 
% RandStream.setGlobalStream(seed);
% rand_1e5 = rand(sampleNum,1);
% randPatch_index = ceil(round(rand_1e5 * totalPatchNum));
% randPatch_index = sort(randPatch_index, 'ascend');
% save randPatch_index;

lr_patch_exclude_corner = [2:6 8:42 44:48];
LRfeature = zeros(45, sampleNum);
LRfeature_with_mean = zeros(45, sampleNum);
HRfeature = zeros(144, sampleNum);
HRfeature_with_mean = zeros(144, sampleNum);
count = 1;
for i = 1:pictNum
    HR_img = pict{i};
    LR_img = GenerateLRImg(HR_img, 4, 1.6);
    HR_img = rgb2gray(HR_img);
    LR_img = rgb2gray(LR_img);
    [h_lr, w_lr] = size(LR_img);
    patchPerRow = w_lr - patchsize + 1;
    if i == 200
        
    end
    %若第count个随机的patch在第i幅图内，将其加入到特征向量当中
    while (randPatch_index(count) <= LRpatchAddNum(i))
        
        index = randPatch_index(count);
        fprintf('i:%d, index:%d, AddNum:%d\n', i, index, LRpatchAddNum(i));
        if i > 1
            index = index - LRpatchAddNum(i-1);
        end
        x = fix((index-1)/patchPerRow) + 1;
        y = mod(index, patchPerRow);
        if y == 0
            y = patchPerRow;
        end
        %提取lr的45特征值（减平均值）
        temp = LR_img(x:x+patchsize-1, y:y+patchsize-1);
        temp = temp(lr_patch_exclude_corner);
        LRfeature(:,count) = temp;
        LRfeature(:,count) = temp-mean(temp); 
        %提取对应的144特征值（减平均值）
        temp = HR_img((x-1)*scale+1:(x-1)*scale+28,(y-1)*scale+1:(y-1)*scale+28);
        temp = temp(9:20, 9:20);
        temp = temp(:);
        HRfeature_with_mean(:,count) = temp;
        HRfeature(:,count) = temp-mean(temp);
        count = count + 1;
        if count > sampleNum
            break;
        end
    end

end
save LRfeature LRfeature;
save LRfeature_with_mean LRfeature_with_mean;
save HRfeature HRfeature;
save HRfeature_with_mean HRfeature_with_mean;

