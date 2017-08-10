clc;
clear all;
close all;
x1=-4:0.1:4;
x2=-4:0.1:4;
for i=1:length(x1)
    for j=1:length(x2)
        y(i,j)=sin(pi*x1(i)/4).*sin(pi*x2(j)/4);
    end
end
surfc(x1,x2,y);

flann_length=10;
w=rand(1,flann_length);
b=rand;
for iter=1:20
for i=1:length(x1)
    for j=1:length(x2)
        g=[x1(i) x2(j) sin(pi*x1(i)) sin(pi*x2(j)) cos(pi*x1(i)) cos(pi*x2(j)) sin(2*pi*x1(i)) sin(2*pi*x2(j)) cos(2*pi*x1(i)) cos(2*pi*x2(j))];
        out(i,j)=w*g'+b;
        err(i,j)=y(i,j)-out(i,j);
        w=w+2*0.01*err(i,j)*g;
        b=b+2*0.01*err(i,j);
    end
end
end
figure
surfc(x1,x2,out);