function numericGD(lambda)
%NUMERICGD takes an input lambda (regularization strength). It compares
%the numeric Gradient of a small Neural Network, and compare that to the
%analytic Gradient of the same Network calculated by our ComputeCost
%function, in order to make sure that our computed analytic gradient is
%correct.

%The small Network used to check the correctness of our gradient
%calculation. The Network is parameterized by the regularization strength
%lambda.

%Author: Ishiguro Yoshihiro, YU Shining

fprintf("\n\nChecking Correctness of Gradient Calculation......\n");
input_layer_size = 3;
hidden_layer_size = 4;
output_layer_size = 3;
X = rand(5, 3);
Y = rand(5, 3);
Y = Y * 10;
Y = mod(floor(Y),3);
    
%Initialize Neural Network parameter. The initial weight is sampled from a
%Gaussian with a mean of zero and a standard deviation of epsilon_init. 
epsilon_init = 0.12;
Theta1 = rand(input_layer_size + 1, hidden_layer_size) * 2 * epsilon_init - epsilon_init;
Theta2 = rand(hidden_layer_size + 1, output_layer_size) * 2 * epsilon_init - epsilon_init;
ThetaVec = [Theta1(:); Theta2(:)];

%Compute the analytic gradient using our computeCost function.
[cost, gradient1] = computeCost(input_layer_size, hidden_layer_size, output_layer_size, X, Y, ThetaVec, lambda);

%Compute the numeric gradient. Note that although we use the function
%computeCost here, we only use its function value to calculate the numeric
%gradient rather than using its calculated analytic gradient.
gradient2 = zeros(size(ThetaVec));
epsilon = 0.001;
for i = 1:length(ThetaVec)
    pTheta = ThetaVec;
    mTheta = ThetaVec;
    pTheta(i) = pTheta(i) + epsilon;
    mTheta(i) = mTheta(i) - epsilon;
    gradient2(i) = (computeCost(input_layer_size, hidden_layer_size, output_layer_size, X, Y, pTheta, lambda) ...
      - computeCost(input_layer_size, hidden_layer_size, output_layer_size, X, Y, mTheta, lambda)) / (2 * epsilon);         
end

%Compute the difference between our analytic gradient and the numeric
%gradient. If our analytic gradient computation is correct, the difference
%should be very very small.
difference = gradient2 - gradient1;
difference = difference(:)' * difference(:);
difference = sum(difference) / length(difference);
disp("The suqared difference between numeric calculation and backward propogation: ");
disp(difference);
disp("If the difference is small, consider backward propogation algo is correct");
