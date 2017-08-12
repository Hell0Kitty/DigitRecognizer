function display_input(v)
%DISPLAY_INPUT takes an example image from the data set and display it.
%Input vector v is an unrolled 784 (28 * 28) pixel matrix,
%which is reshaped back to a matrix display the image.

%Author: Ishiguro Yoshihiro, YU Shining, Boku Ayaka

m = floor(sqrt(length(v)));  % n = 28
n = length(v) / m;           % n = 28

X = reshape(v, m, n);
X = X'

%display the image
colormap(gray);
axis off;
imagesc(X);