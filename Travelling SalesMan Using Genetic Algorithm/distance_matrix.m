clc;
clear all;
close all;
load ('map.mat');
xcord=a(:,1);
ycord=a(:,2);
m=zeros(30,30);
for i =1:30
    for j=1:30
        m(i,j)=round(sqrt(((xcord(i)-xcord(j))^2)+((ycord(i)-ycord(j))^2))*100)/100;
    end
end