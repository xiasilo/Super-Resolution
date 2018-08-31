
%获得用于训练的图片名单，存放在pictNames中
trainFolder = fullfile(pwd, 'Train');
dirOutput = dir(fullfile(trainFolder, '*.jpg'));
pictNames = {dirOutput.name};
save pictNames;

