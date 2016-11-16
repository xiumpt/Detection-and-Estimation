% ================================
% Periodic Signal
% This program estimates the values of a periodic 
% deterministic signal embedded in WGN using the linear model setup.
% ================================

close all;clear all;

N=50; % data record length
K=5; % periods of signal
M=N/K; % length of one period of signal
nn=[0:M-1]'; % signal samples for one period

s=[];
for i=1:K % periodic signal
    s=[s;nn];
end
x=s+randn(N,1); % add WGN 
n=[0:length(s)-1]';  % time samples

subplot(1,2,1);stem(n,x);
xlabel('n');ylabel('x[n]');grid;title('Data Sample');
axis([0,50,-2,10]);  

H=[];
for i=1:K 
    H=[H;eye(10)] ; 
end

%  least squares estimator: H^T*H*Theta = H^T*x
%  => Theta = (H^T*H)^-1*H^T*x = ([A B]')
% s = H * Theta
th=inv((H'*H))*H'*x;   % theta
shat=H*th;  

subplot(1,2,2);stem(n,shat);
xlabel('n');ylabel('s[n]');grid;title('Estimate line signal');
axis([0,50,-2,10]);    


 





