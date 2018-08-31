% featureCenter = featureCenter';
% load LRfeature;
% load HRfeature;
% load classID;
% n = length(classID);
% LRMatrix = cell(512,1);
% HRMatrix = cell(512,1);
% for i = 1:n
%     LRMatrix{classID(i)} = [LRMatrix{classID(i)}, LRfeature(:,i)];
%     HRMatrix{classID(i)} = [HRMatrix{classID(i)}, HRfeature(:,i)];
% end
% save LRMatrix LRMatrix;
% save HRMatrix HRMatrix;

trans = zeros(144, 46, 512);
for i = 1:512
    fprintf('i = %d\n', i);
    [~, len] = size(LRMatrix{i});
    V = [LRMatrix{i};ones(1,len)];
    W = HRMatrix{i};
    trans(:,:,i) = W/V;
end
save trans trans;
