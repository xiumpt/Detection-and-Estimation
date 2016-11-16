% FSSP3exer3_7.m
%
%  This program estimates the values of a periodic 
%  deterministic signal embedded in WGN using the linear model setup.
% 
close all
clear all
randn('state',0) % set random number generator to initial state
N=50;K=5; % set data record length and number of periods of signal
          %  Change these values for increased accuracy
M=N/K; % length of one period of signal
nn=[0:M-1]'; % set up signal samples for one period
s=[];
for i=1:K % generate periodic signal
    s=[s;nn];
end
x=s+randn(N,1); % add WGN of variance one
n=[0:length(s)-1]';  % set up time samples  
H=[];
for i=1:K % generate H matrix
    H= ????; % ====== generate H matrix here, hint: eye(M)  ========
end


% ========== compute estimate given by by least square estimator here =========
shat= ???? % compute estimate given by (3.18) of entire
                       % signal of length N x 1

shat(1:10) % print out estimate of one period of signal


% ========== plot the data x and estimated siganl s here =========
????`
    


 





