%The script first loads training data from the train.csv file from Kaggle, stores the
%training images in X and image labels in Y, and saves the variables in
%train.mat. It then loads test data from test.csv and save it in test.mat

%Author: YU Shining

%Create Training Set Data
X = load("train.csv");
Y = X(:,1);
X = X(:,2:end);
save("train.mat","X","Y");

%Create Test Set Data
Xtest = load("test.csv");
save("test.mat","Xtest");