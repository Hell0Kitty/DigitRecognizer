function [cost,gradient] = computeCost(input_layer_size, hidden_layer_size,...
                      output_layer_size, X, y, ThetaVec, lambda)
%computeCost function takes a Neural Network's parametes ThetaVec and its
%regularization strength lambda and compute its Softmax Loss on a single training
%example (X, y) and the gradients of Loss on the paamters ThetaVec.

%We use sigmoid activation function here since our Network contains only a
%single hidden layer. The sigmoid activation can be replaced with ReLU etc
%if you want to make deeper network.

%Author:YU Shining

m = size(X , 1);
%Unroll ThetaVec back to two matrices, each store weights for one layer.
Theta1 = reshape(ThetaVec(1 : (input_layer_size + 1) * hidden_layer_size),...
                               hidden_layer_size, input_layer_size + 1);
Theta2 = reshape(ThetaVec((input_layer_size + 1) * hidden_layer_size + 1 : end),...
                               output_layer_size, hidden_layer_size + 1);

%Forward Propogation: compute Softmax Loss (cross entropy loss or logistic regression loss)
%of the Neural Network
Y = zeros(m, output_layer_size);
y(y == 0) = output_layer_size;
for i=1:length(y)
    j = y(i);
    Y(i,j) = 1;
end
pesu_Theta1 = Theta1;
pesu_Theta1(:,1) = 0;
pesu_Theta2 = Theta2;
pesu_Theta2(:,1) = 0;
pesu_Theta = [pesu_Theta1(:); pesu_Theta2(:)];

a1 = [ones(m,1) X];
a2 = sigmoid(a1 * Theta1');
a2 = [ones(m,1) a2];
h = sigmoid(a2 * Theta2');
cost = -(sum(log(h(:))' * (Y(:))) + sum (log(1 - h(:))' * (1 - Y(:)))) / m ...
    + 0.5 * lambda * (pesu_Theta' * pesu_Theta) / m ;


%Backward Propogation: compute gradients of loss function on weights of the
%Network
delta3 = h - Y;
DELTA2 = zeros(size(Theta2)); 
DELTA2 = delta3' * a2;

delta2 = delta3 * Theta2 .* a2 .* (1 - a2);
delta2 = delta2(:,2:end);
DELTA1 = zeros(size(Theta1)); 
DELTA1 = delta2' * a1;

Theta1_grad = (DELTA1 + lambda * pesu_Theta1) / m;
Theta2_grad = (DELTA2 + lambda * pesu_Theta2) / m;
gradient = [Theta1_grad(:) ; Theta2_grad(:)];
