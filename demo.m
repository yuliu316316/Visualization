clear all;
close all;
clc

P = imread('images/pet.bmp');
C=imread('images/ct.bmp');
figure;imshow(P);
figure;imshow(C);

fusion=1;   %with fusion: 1, without fusion: 0

R=PET_CT_Visualization(P,C,fusion);

figure;imshow(R);
imwrite(R,'results/result1.bmp');
