Important! The project was mainly developed under MATLAB 2017a. There is incompatibility with the school's old 
version due to the probelm of "" and ''.

This project is a digit recognizer using Neural Network with one hidden layer.
The data used is from Kaggle competition (https://www.kaggle.com/c/digit-recognizer).

The project contains following files/ directories.

DataPreperation: contains script to transfer the raw Kggle csv image data to MATLAB data.

train.mat:    		training set data, with correct labels
test.mat:     		test set data, without correct labels
result.mat:   		predicted labels of validation set, used for PolyPlotGUI.m

main.m:       		main script
computeCost.m:          compute loss (cross entropy loss) and its gradients w.r.t Neural Net parameters
display_input.m:	display image from pixel values
numericGD.m:  		check gradient calculation
PolyPlotGUI.m:          GUI for displaying preditions
PolyPlotGUI.fig:        Layout for PolyPlotGUI
prediction.m:           predicet labels using trained Neural Network
sigmoid.m:              sigmoid activation/ non-linearity
trainNeuralNetwork.m:   training Neural Network using Batch Gradient Descend
tuneAlpha.m:            tune hyperparameter learning rate
tuneLambda.m:           tune hyperparameter L2 regularization strength

tuneAlphaResult.fig:    plot for learning rate tuning, with larger learning rates
tuneAlphaResult2.fig:   plot for learning rate fine tuning

tuneLambdaResult.fig:   log scale plot for regularization strength tuning
tuneLambdaResult2.fig:  normal scale plot for regularization strength tuning

test_result.txt:        predicetd labels for Kaggle test set
test_result.csv:        formatted file for Kaggle submission

Created by YU Shining on 14th July, 2017