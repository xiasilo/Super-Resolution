function [ classID, center, V ] = Kmeans( feature, k )
%k-means聚类，输入特征向量和要聚的类数（k）
%返回每个特征向量属于的类别和每个类的中心特征向量
[m, n] = size(feature);
ma = zeros(m, 1);
mi = zeros(m, 1);
center = zeros(m, k);
%随机生成初始中心特征
for i = 1:m
    ma(i) = max(feature(i,:));
    mi(i) = min(feature(i,:));
    for j = 1:k
        center(i, j) = mi(i) + (ma(i)-mi(i))*rand();
    end
end

t = 0;
while true
    classID = ones(n, 1);
    %记录每个聚类里面有多少个特征向量
    count = zeros(k, 1);
    %每个聚类的特征矩阵
    V = cell(k, 1);
    for i = 1:k
        V{i} = zeros(m, round(min(5*n/k, n)));
    end
    
    t = t+1;
    fprintf('t = %d\t', t);
    pre_center = center;
    for i = 1:n
        minDistance = MSE(feature(:,i), pre_center(:,1));
        %求出每个特征向量所属的聚类号
        for j = 2:k
            d = MSE(feature(:,i), pre_center(:,j));
            if d < minDistance
                minDistance = d;
                classID(i) = j;
            end
        end
    end
    
    %求新的中心特征向量和各个聚类的特征矩阵V
    %遍历各个特征向量，将其归类至同一类，并求出新的中心向量
    for i = 1:n
        ID = classID(i);
        count(ID) = count(ID) + 1;
        V{ID}(:,count(ID)) = feature(:,i);
    end
    %将多余的值去掉
    for i = 1:k
        V{i} = V{i}(:,1:count(i));
    end
    %计算新中心向量
    for i = 1:k
        center(:,i) = mean((V{i}'));
        if isnan(center(1,i))
            randv = zeros(m, 1);
            for j = 1:m
                randv(j) = mi(j) + (ma(j)-mi(j))*rand();
            end
            center(:,i) = randv;
        end
    end
    
    %如果已经收敛，则break
    mse = MSE(pre_center, center);
    fprintf('MSE = %f\n', mse);
    if  mse < 0.1
        break;
    end
end

end

