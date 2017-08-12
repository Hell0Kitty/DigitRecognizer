function [accuracy,predict] = prediction(input_layer_size, hidden_layer_size,...
                      output_layer_size, Xval, Yval, ThetaVec)
%prediction takes parameters of our neural network, i.e. sizes, weights, the validation 
%set Xval and its labels, and returns the predicted label based on the
%prediction accuracy of the network.

%Author: Ishiguro Yoshihiro, YU Shining

m = size(Xval , 1);
%Unroll wights of each layer.
Theta1 = reshape(ThetaVec(1 : (input_layer_size + 1) * hidden_layer_size),...
                               hidden_layer_size, input_layer_size + 1);
Theta2 = reshape(ThetaVec((input_layer_size + 1) * hidden_layer_size + 1 : end),...
                               output_layer_size, hidden_layer_size + 1);

%Forward propogation:
a1 = [ones(m, 1) Xval];
Yval(Yval == 0) = 10;
z1 = a1 * Theta1';
a2 = sigmoid(z1);
a2 = [ones(m, 1) a2];
z2 = a2 * Theta2';
Ypred = sigmoid(z2);
%Prediction and Accuracy
[val,predict] = max(Ypred, [], 2);
accuracy = sum(predict == Yval) / m;
predict(predict == 10) = 0;

