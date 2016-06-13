clc, clear, close all;
compile('fun_mex.cpp');
I = fun([640, 480]);
imshow(I);
