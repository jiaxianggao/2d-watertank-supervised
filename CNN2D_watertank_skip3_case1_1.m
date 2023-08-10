% CNN2D model for Case1.1 with skip3 injection, random 20% validation set

% run D:\matlabwork\eidors-v3.10-ng\eidors-v3.10-ng\eidors\startup.m

clear

% Load data
load("case1_1_skip3_fn.mat")
P=0.8;
N=length(features(1,:));
idx=randperm(N);
XTrain = features(:,idx(1:round(P*N)));
XValidation = features(:,idx(round(P*N)+1:end));
YTrain = labels(:,idx(1:round(P*N)));
YValidation = labels(:,idx(round(P*N)+1:end)); 

% To 2D image
XTrain = reshape(XTrain,16,16,1,8000);
XValidation = reshape(XValidation,16,16,1,2000);
YTrain = YTrain';
YValidation = YValidation'; 


% Network structure

layers = [...
    imageInputLayer([16,16,1],'Normalization','none')
    convolution2dLayer(2,32)
    maxPooling2dLayer(1)
    convolution2dLayer(2,32)
    maxPooling2dLayer(1)
    flattenLayer
    fullyConnectedLayer(3000,'WeightsInitializer','he')
    reluLayer
    dropoutLayer(0.5)
    fullyConnectedLayer(3000,'WeightsInitializer','he')
    reluLayer
    dropoutLayer(0.5)
    fullyConnectedLayer(2959,'WeightsInitializer','he')
    reluLayer
    regressionLayer];

% training

lr=0.001;
maxEpochs = 20;
miniBatchSize = 25;

options = trainingOptions('adam', ...
    'InitialLearnRate',lr, ...
    'MaxEpochs',maxEpochs, ...
    'MiniBatchSize',miniBatchSize, ...
    'ValidationFrequency',10, ...
    'ExecutionEnvironment','gpu' , ...
    'Plots','training-progress','L2Regularization',0.001,...
    'ValidationData',{XValidation,YValidation});
net=trainNetwork(XTrain, YTrain, layers, options);

% Save network
save('cnn2d_net_case1_1_skip3_fn.mat','net')

% Analyse network
% analyzeNetwork(layers)

% Load network
load("cnn2d_net_case1_1_skip3_fn.mat")

% Prediction
% load("case1_1_skip3_.mat")
Uel=reshape(Uel,16,16,1);
sig_pre=predict(net,Uel);
imginv = mk_image(fmdl, sig_pre);
show_fem(imginv,[1,1]);



