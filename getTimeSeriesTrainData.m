function [TrainData,TrainTarget]=getTimeSeriesTrainData(trainset, p)

TrainMatrix=[];
for i=1:p
    TrainMatrix=[TrainMatrix,trainset(i:end-p+i)];
end
% TrainData=TrainMatrix(1:end-1,:)';
% TrainTarget=trainset(p+1:end)';
TrainData= [1 2 3 4 5];
TrainTarget= [6 7 8 9 10];