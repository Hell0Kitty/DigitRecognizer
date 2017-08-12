function [best_lambda,idx] = tuneLambda(lambdaVector,alpha, input_layer_size, ...
                                   hidden_layer_size, ...
                                   output_layer_size, X, Y, Xval, Yval, ThetaVec)
%TUNELAMBDA takes a range of lambda from the input lambdaVector and returns
%the lambda that gives minimum loss on validation set.

%Author: Ishiguro Yoshihiro, YU Shining

accuracys = zeros(size(lambdaVector));
   for i = 1:length(lambdaVector)
       %Make a deep copy of ThetaVector to make sure every iteration use
       %the same ThetaVector
        ThetaVec2 = ThetaVec;
        figure();
        ThetaVec2 = trainNeuralNetwork(alpha, input_layer_size, ...
                                   hidden_layer_size, ...
                                   output_layer_size, X, Y, ThetaVec2, lambdaVector(i));
       %Compute the accuracy on validation set, which will give better
       %generalization
        accuracys(i) = prediction(input_layer_size, hidden_layer_size,...
                      output_layer_size, Xval, Yval, ThetaVec2);
   end
   plot(lambdaVector, accuracys, 'o', 'MarkerSize', 3);
   title("Validation Accuracy vs Lambda");
   xlabel("Lambda");
   ylabel("Accuray");
   [best_accuracy, idx] = max(accuracys);
   best_lambda = lambdaVector(idx);
end

