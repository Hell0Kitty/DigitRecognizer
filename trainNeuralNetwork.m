function ThetaVec = trainNeuralNetwork(alpha,input_layer_size, ...
                                   hidden_layer_size, ...
                                   output_layer_size, X, Y, ThetaVec, lambda)
%trainNeuralNetwork takes a specif Neural Network model, a learning rate, a
%regularization strength and the traing data X, Y and train the model.

%Author: Ishiguro Yoshihiro, YU Shining

%Track Loss after every iteration.
loss_array = zeros(200,1);
disp('Training Neural Network ...');
for i=1:200
[cost,gradient] = computeCost(input_layer_size, ...
                                   hidden_layer_size, ...
                                   output_layer_size, X, Y, ThetaVec,lambda);
%Parameter Updating using Batch Gradient Descent
ThetaVec = ThetaVec - alpha * gradient;

loss_array(i) = cost;
if(~mod(i,5))
    fprintf('Ietration %d /200 : Loss is %f\n', i, cost);
end
end
%Plot the learning curve of the Network (loss versus iteration)
% figure();
plot(1:200,loss_array);
title(["Learning Curve: ", "Learning Rate is " + num2str(alpha), "Regularization is " + num2str(lambda)]);
xlabel("Iteration");
ylabel("Loss");
fprintf("\nDisplay Learning Curve, press Enter to continue\n\n");
% pause();