% ==========================
% HW8: Maximum Likelihood Estimator
% Estimation of time delay: estimates the delay time of a square pulse embedded in WGN.
% Consider a signal that is a Gaussian pulse whose time delay is n0 = 50
% WGN with variance sig2u = 0.25
% After implementing the running correlator, the function J(n0) to be
% maximized is shown in fig.
% ==========================

clear all; close all;

M=20;   
n=200;  % time sample
sig2u=0.25;  % variance
n0=50;  % time delay
s=ones(M,1);  % square pulse
ss=[zeros(n0,1);s;zeros(n-n0-M,1)];  % embed signal in array of length N
                                    % [50*(0) 20*(1) 130*(0)]'
x=ss+0.5*randn(length(ss),1);  % add noise to signal
n1=1:200;
plot(n1,x);
xlabel('n');ylabel('x[n]');title('noise');

lx=length(x);
ls=length(s);
for n0=0:lx-ls 
    xdat=x(n0+1:n0+ls,1); % pick out data for assumed signal interval
    J(n0+1,1)=xdat'*s;  % J = correlate data with delayed signal
end
[maxJ I]=max(J);  % find maximum and location of maximum of objective function
n0hat=I-1;  % convert to estimate of time delay
%plot(n0,xdat)

n0hat %estimate of delay time
n0=0:180;

figure;
plot(n0,J);hold on;grid;
line([n0hat,n0hat],[min(J),max(J)]);    %([from_x,end_x], [from_y,end_y])
xlabel('n0');ylabel('J(n0)');
