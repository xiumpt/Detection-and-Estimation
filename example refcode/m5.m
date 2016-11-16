% FSSP3exer3_8.m
%
%  This program estimates the frequency of a sinusoid embedded in WGN 
%  using the maximum likelihood estimator. See (3.22).
close all
clear all
N=20;
n=[0:N-1]'; % set up time samples
x=cos(2*pi*0.12*n+pi/4); % compute signal samples
f0=[0.1:0.1:0.4]'; % frequencies for grid search for maximum
for k=1:length(f0) % compute J function for N=20
    H=[cos(2*pi*f0(k)*n) sin(2*pi*f0(k)*n)];
    J(k,1)=x'*H*inv(H'*H)*H'*x;  % see (3.22)
end
[mm1 I]=max(J); % find maximum of J function and index I where it occurred
f0est=f0(I) % print out the estimate of frequency

f0=[0.01:0.01:0.49]'; % repeat entire procedure for more finely spaced
                      % frequencies
for k=1:length(f0)
    H=[cos(2*pi*f0(k)*n) sin(2*pi*f0(k)*n)];
    J(k,1)=x'*H*inv(H'*H)*H'*x;
end
[mm2 I]=max(J);
f0est=f0(I)





    


 





