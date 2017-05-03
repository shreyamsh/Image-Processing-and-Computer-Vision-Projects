% MATLAB code to implement image filtering to separate low and high
% frequency components and also combine them to create a scale dependent
% image.
clc;
close all;
clear all;
% Read the original image.
img = double(imread('test.jpg'));

Orig_T = dct2(img);
%// Split between high- and low-frequency in the spectrum (*)
cutoff = round(0.5 * 256);
High_T = fliplr(tril(fliplr(Orig_T), cutoff));
Low_T = Orig_T - High_T;

%// Transform back
High = idct2(High_T);
Low = idct2(Low_T);

%// Plot results
figure, colormap gray
subplot(3,2,1), imagesc(Orig), title('Original'), axis square  colorbar 
subplot(3,2,2), imagesc(log(abs(Orig_T))), title('log(DTC(Original))'),  axis square  colorbar

subplot(3,2,3), imagesc(log(abs(Low_T))), title('log(DTC(LF))'), axis square  colorbar
subplot(3,2,4), imagesc(log(abs(High_T))), title('log(DTC(HF))'), axis square  colorbar

subplot(3,2,5), imagesc(Low), title('LF'), axis square colorbar
subplot(3,2,6), imagesc(High), title('HF'), axis square colorbar

