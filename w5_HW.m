% =======================================
% Nonlinear and Partially Linear Signals
% This program estimates the frequency of a sinusoid embedded in WGN using the maximum likelihood estimator.

% Assume that the data is noiseless so that x[n] = cos(2pi(0.12)n + pi/4) + w[n] for n = 0,1,...N-1, 
% where N = 20 and w[n]~N(0,1^2). 
% Substitute x[n] into (1) and then maximize J(f0) over 0 < f0 < 1/2 by 
% computing the values of J(f0) explicitly for each value of f0.
% =======================================

% (1) Choose the values of f0 as f0 = 0.1, 0.2, 0.3, 0.4.
% (2) Choose the values as f0 = 0.01, 0.02,..., 0.49.
close all; clear all;

N=20;
n=[0:N-1]'; % time samples
x=cos(2*pi*0.12*n+pi/4)+normrnd(0,1,N,1); % compute signal samples
f0=[0.1:0.1:0.4]'; % frequencies
for k=1:length(f0) % compute J function for N=20    %length(f0)=49
    H=[cos(2*pi*f0(k)*n) sin(2*pi*f0(k)*n)];
    J(k,1)=x'*H*inv(H'*H)*H'*x;  
end

[mm1 I1]=max(J); % find maximum of J function and index I where it occurred
f01est = f0(I1) % print out the estimate of frequency

f0=[0.01:0.01:0.49]'; 
for k=1:length(f0)
    H=[cos(2*pi*f0(k)*n) sin(2*pi*f0(k)*n)];
    J(k,1)=x'*H*inv(H'*H)*H'*x;
end
[mm2 I2]=max(J);
f02est = f0(I2)

%% 
close all; clear all;
N=20;
n=[0:N-1]'; % time samples
x=cos(2*pi*0.12*n+pi/4)+normrnd(0,0.1,N,1); % change the var of WGN
f0=[0.1:0.1:0.4]'; 
for k=1:length(f0) % compute J function for N=20    %length(f0)=49
    H=[cos(2*pi*f0(k)*n) sin(2*pi*f0(k)*n)];
    J(k,1)=x'*H*inv(H'*H)*H'*x;  
end
[mm1 I3]=max(J); % find maximum of J function and index I where it occurred
f03est=f0(I3) % print out the estimate of frequency

f0=[0.01:0.01:0.49]'; 
for k=1:length(f0)
    H=[cos(2*pi*f0(k)*n) sin(2*pi*f0(k)*n)];
    J(k,1)=x'*H*inv(H'*H)*H'*x;
end
[mm2 I4]=max(J);
f04est=f0(I4)
