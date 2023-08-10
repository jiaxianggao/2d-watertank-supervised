% Case1.1, random 20% validation set

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

% To 1D image
XTrain = reshape(XTrain,256,1,8000);
XValidation = reshape(XValidation,256,1,2000);


% build a model

layers = [...
    sequenceInputLayer([256 1])
    convolution1dLayer(3,32,Padding=1)
    reluLayer
    maxPooling1dLayer(3,Padding=1)
    convolution1dLayer(3,32,Padding=1)
    reluLayer
    maxPooling1dLayer(3,Padding=1)
    flattenLayer
    fullyConnectedLayer(4500,'WeightsInitializer','he')
    reluLayer
    dropoutLayer(0.5)
    fullyConnectedLayer(2959,'WeightsInitializer','he')
    reluLayer
    regressionLayer];

% training

lr=0.001;
maxEpochs = 1600;
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
save('cnn1d_net_case1_1_skip3_fn.mat','net')

% Analyse network
% analyzeNetwork(layers)

% Load network
% load("cnn1d_net_case1_1_skip3_fn.mat")

% Prediction
% load("case1_1_skip3_.mat")
sig_pre=predict(net,Uel);
imginv = mk_image(fmdl, sig_pre);
show_fem(imginv,[1,1]);



