%==========================
% HW9: MMSE and Bayesian Estimation
% Estimates the outcome of a random signal embedded in WGN using a matrix Wiener smoother. 
% It assumes a Gaussian AR random process which is stationary and so replaces the covariance
% matrix by an autocorrelation matrix.
%
% Consider a random signal that is an outcome of a Gaussian AR random process 
% of order one s[n] = -a[1]s[n-1] + u[n], where a[1]=-0.9 and sig2u=1
% It is embedded in WGN w[n] with variance sig2u = 5
% x[n]=s[n]+w[n]=(-a[1]s[n-1]+u[n])+w[n]
%==========================
close all;clear all

a=-0.9;  % signal parameters
sig2u=1;
WGN_sig2u=5;  % white noise variance
N=100;
n=[0:N-1]';  % time samples
s=ARgendata(a,sig2u,N);  % generate AR signal data

plot(n,s) % plot true signal
xlabel('n');ylabel('s[n]');
grid;hold on;

x=s+sqrt(WGN_sig2u)*randn(N,1); %  add noise signal
plot(n,x); % plot noise corrupted random signal
%hold on;

%%

% Estimated signal
r0=sig2u/(1-a^2);  % compute rs[0]
rs=r0*(-a).^[0:N-1]';  % compute rs[0],rs[1],...,rs[N-1]

N=length(x);
for i=1:N
    for j=1:N
        Rs(i,j)=rs(abs(i-j)+1); % construct N x N signal autocorrelation matrix
    end
end

shat=Rs*inv(Rs+WGN_sig2u*eye(N))*x; % compute MMSE estimate of signal s[n]
plot(n,shat);grid;  % plot estimated signal
legend('True signal','Noise corrupted signal','Estimated signal');
