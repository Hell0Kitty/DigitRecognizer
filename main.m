%%Main script: Trains and Tune a Sigmoid Activtaed Neural Network with one
%%hidden layer
%%IMPORTANT!! This project developed under MATLAB 2017a, there may be
%%incompatibility due to "" and '' in order version of MATLAB!!

%Author: Ishiguro Yoshihiro, YU Shining, Boku Ayaka

%==========================================================================
%Part1: Data Preprocesing

clear; clc; close all;
%load data: 
%X is 42000 pictures (42000 * 784 matrix);
%Y is correct labels for the 42000 pictures
load("train.mat");

%Display first ten pictures from the dataset. 
for i=1:10
    display_input(X(i,:));
    pause(2);
end
close();
fprintf("Program paused, press Enter to continue...\n");
pause();


%The original trainig data is split into a Validation Split (Xval, Yval,
%20% of original data), and a Traning split(X, Y, 80% of original data); 
%The validation split is used to tune hyper parameter of the model so that
%the model can have better performance on the test set.
Xval = X(1:8400,:);
Yval = Y(1:8400,:);

X = X(8401:end,:);
Y = Y(8401:end,:);

m = size(X, 1);

% Mean substraction is possible. However, we found in our case not
% performing this preprocessing gives better validation performance.
% meanX = sum(X, 1) / m;
% X =  X - meanX;
% Xval = Xval - meanX;
%==========================================================================
%Part2: Set Neural Network Model:

%One input layer of size 784, one hidden layer of size 49, and one output layer
%of size 10;
input_layer_size = size(X, 2);
hidden_layer_size = input_layer_size / 16;
output_layer_size = 10;



%Initialize Neural Network parameter. The initial weight is sampled from a
%Gaussian with a mean of zero and a standard deviation of epsilon_init. 
epsilon_init = 0.12;
Theta1 = rand(input_layer_size + 1, hidden_layer_size) * 2 * epsilon_init - epsilon_init;
Theta2 = rand(hidden_layer_size + 1, output_layer_size) * 2 * epsilon_init - epsilon_init;
ThetaVec = [Theta1(:); Theta2(:)];
%==========================================================================
%Part3: Check Gradient:

%Before any learning Process, we first check the correctness of our
%gradient calculation.
test_lambda = 1;
numericGD(test_lambda);
fprintf("\nProgram paused, press Enter to continue...\n");
pause();

%We commend the Part4 and Part5 in presentation due to the slow process
%(explained detailed below). The particular set of alpha and lambda we used
%here are the best values achieved after running Part4 and Part5.
alpha = 0.25;
lambda = 20;

%==========================================================================
%Part4: Choose Learning Rate:
%Plot Learning Curve for a various range of Learning Rate Alpha, and
%manually pick the best learning rate.

%This part is also extremely slow (it trains 7 neural nets), so we command it in presentation. The best
%alpha found in training was alpha = 0.25

% fprintf("\nTunning Learning Rate...\n\n");
% alpha_choice = [10, 5, 1.5, 1, 0.5, 0.25, 0.125];
% tuneAlpha(alpha_choice,lambda, input_layer_size, ...
%                                    hidden_layer_size, ...
%                                    output_layer_size, X, Y, Xval, Yval, ThetaVec);
% alpha = input('\nProgram Paused: Select the proper Learning Rate!\nPress Enter to continue...\n');
% fprintf("Chosen Learning Rate is %f\n", alpha);
% pause();
% close all;
%==========================================================================
%Part5: Choose Regularization Strength: 
%Automatically select the regularization strength from a range lambda_choice that gives best accuracy on
%validation set, to avoid overfitting.

%This part is also extremely slow (it trains 12 neural nets), so we command it in presentation. The best
%lambda found in training was lambda = 20

% fprintf("\nTunning Regularization Lambda...\n\n");
% lambda_choice = [0, 0.001, 0.005, 0.01, 0.05, 0.1, 0.5, 1, 5, 10, 20, 30];
% lambda = tuneLambda(lambda_choice, alpha, input_layer_size, ...
%                                    hidden_layer_size, ...
%                                    output_layer_size, X, Y, Xval, Yval, ThetaVec);
% fprintf("Best Regularization Lambda is %f\n", lambda);
% fprintf("\nProgram paused, press Enter to continue...\n");
% pause();
% close all;
%==========================================================================
%Part6: Train Neural Network:

%Choose the best learning rate alpha and regularization strength we
%obtained in prevous section.

ThetaVec = trainNeuralNetwork(alpha, input_layer_size, ...
                                   hidden_layer_size, ...
                                   output_layer_size, X, Y, ThetaVec, lambda)

fprintf("\nProgram paused, press Enter to continue...\n");
pause();
%==========================================================================
%Part7: Prediction $ Display Result

%Make prediction on test set data and use it to represents the Neural
%Network's generalization accuracy.
[accuracy, Ypred] = prediction(input_layer_size, hidden_layer_size,...
                      output_layer_size, Xval, Yval, ThetaVec);
disp("The accuracy of Neural Network is :");
fprintf("%f", 100 * accuracy); 
fprintf("\nProgram paused, press Enter to continue...\n");
pause();

%Revert the data back if mean substraction is applied
% Xval = Xval + meanX;

%Show predited value Ypred and correct value Yval for 100 validation set images
save("result.mat", "Xval", "Yval", "Ypred");
fprintf("Displaying results, press Ctr + C to exit...\n");
PolyPlotGUI();

%==========================================================================
%Extra: We can use our Neural Network to predict labels for the Kaggle test
%set images(without correct labels). By submitting our prediction, we get a
%score of 0.90129.

% load("test.mat")
% %Ytest is a place holder here
% Ytest = zeros(size(Xtest, 1), 1);
% [~, Ypred_test] = prediction(input_layer_size, hidden_layer_size,...
%                       output_layer_size, Xtest, Ytest, ThetaVec);
% %write result to file for submission
% fileID = fopen('test_result.txt','w');
% fprintf(fileID,'%d \n', Ypred_test);
% fclose(fileID);
