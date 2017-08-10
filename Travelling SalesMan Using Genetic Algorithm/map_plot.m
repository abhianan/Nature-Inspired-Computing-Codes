clc;
clear all;
close all;
load ('map.mat');
scatter(a(:,1), a(:,2), 'filled');
axis([0 100 0 100])
labels = num2str((1:size(a,1))','%d');
text(a(:,1), a(:,2), labels, 'horizontal','left', 'vertical','bottom')