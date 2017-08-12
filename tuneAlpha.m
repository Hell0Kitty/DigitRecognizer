function tuneAlpha(alphaVector,lambda, input_layer_size, ...
                                   hidden_layer_size, ...
                                   output_layer_size, X, Y, Xval, Yval, ThetaVec)
%TUNEALPHA takes a range of learning rate alpha from the input alphaVector
%and plot the learning curve for each setting of alpha. User need to
%manually pick the best alpha based on the learning curve after this
%function.

%Author: YU Shining, Boku Ayaka
   m = length(alphaVector);
   for i = 1:m
       %Make a deep copy of ThetaVector to make sure every iteration use
       %the same ThetaVector
        ThetaVec2 = ThetaVec;
        ThetaVec2 = trainNeuralNetwork(alphaVector(i), input_layer_size, ...
                                   hidden_layer_size, ...
                                   output_layer_size, X, Y, ThetaVec2, lambda);
       hold on;
   end
   labels = cell(1, m);
   for i = 1:m
       labels{1, i} = ['a = ' , num2str(alphaVector(i))];
   end
   legend(labels);
   title("Learning Curve for Alphas");
end

