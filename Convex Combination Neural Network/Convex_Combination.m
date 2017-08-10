clc;
clear all;
close all;
load('Input.mat');
load('Output.mat');
len_io=size(INPUT);
len_io=len_io(2);

x=INPUT(1,:);
y=OUTPUT(1,:);

%input generator for delay
%-----------------------------------------------------------------------------------------------------------------------------
delay=10;

inp=zeros(len_io,delay);
for delay_inp=1:delay
    for delay_inpj=1:delay_inp
        inp(delay_inp,delay_inpj)=x(delay_inpj);
    end
end

for after_delay=delay+1:len_io
    for after_delayj=1:delay
        inp(after_delay,after_delayj)=x(after_delay-delay+after_delayj);
    end
end
%END
%--------------------------------------------------------------------------------------------------------------------------
%TFLANN

flann_length_tflann=51;
w_tflann=rand(1,flann_length_tflann);
b_tflann=rand;

for iter_tflann=1:len_io
    xval_tflann=inp(iter_tflann,:);
    second_inp_tflann=[1 xval_tflann sin(pi*xval_tflann) cos(pi*xval_tflann) sin(2*pi*xval_tflann) cos(2*pi*xval_tflann)];
    out_tflann(iter_tflann)=w_tflann*second_inp_tflann'+b_tflann;
    err_tflann(iter_tflann)=y(iter_tflann)-out_tflann(iter_tflann);
    w_tflann=w_tflann+2*0.005*err_tflann(iter_tflann)*second_inp_tflann;
    b_tflann=b_tflann+2*0.005*err_tflann(iter_tflann);
end
figure
plot(10*log10(err_tflann.^2));

%END
%----------------------------------------------------------------------------------------------------------------------------
%volterra

flann_length_volterra=66;
w_volterra=rand(1,flann_length_volterra);
b_volterra=rand;

for iter_volterra=1:len_io
    xval_volterra=inp(iter_volterra,:);
    permuted_inp=combnk(xval_volterra,2);
    for i=1:45
        permuted(i)=permuted_inp(i,1)*permuted_inp(i,2);
    end
    second_inp_volterra=[1 xval_volterra xval_volterra.*xval_volterra permuted];
    out_volterra(iter_volterra)=w_volterra*second_inp_volterra'+b_volterra;
    err_volterra(iter_volterra)=y(iter_volterra)-out_volterra(iter_volterra);
    w_volterra=w_volterra+2*0.005*err_volterra(iter_volterra)*second_inp_volterra;
    b_volterra=b_volterra+2*0.005*err_volterra(iter_volterra);
end
figure
plot(10*log10(err_volterra.^2));

%END
%------------------------------------------------------------------------------------------------------------------------------
%lambda update

lambda_update=zeros(1,len_io+1);
lambda_update(1)=rand;
for iter_lambda=1:len_io
    out_lambda(iter_lambda)=(lambda_update(iter_lambda)*out_tflann(iter_lambda))+((1-lambda_update(iter_lambda))*out_volterra(iter_lambda));
    err_lambda(iter_lambda)=y(iter_lambda)-out_lambda(iter_lambda);
    lambda_update(iter_lambda+1)=lambda_update(iter_lambda)+2*0.005*err_lambda(iter_lambda)*lambda_update(iter_lambda)*(1-lambda_update(iter_lambda))*(out_tflann(iter_lambda)-out_volterra(iter_lambda));
end
figure
plot(10*log10(err_lambda.^2));
figure
plot(lambda_update);
%END
%-----------------------------------------------------------------------------------------------------------------------------