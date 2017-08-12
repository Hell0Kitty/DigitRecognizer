function value = sigmoid(X)
%SIGMOID returns the sigmoid activation. The sigmoid activation can be
%replaced with ReLU activation etc, if we want to make the Network deeper.

%Author: Ishiguro Yoshihiro, YU Shining

value = 1 ./ (1 + exp(-X)); 