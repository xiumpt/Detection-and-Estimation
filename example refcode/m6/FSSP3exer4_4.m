% FSSP3exer4_4.m
%
clear all
close all
a(1)=0.9;sig2u=0.19; % set values of parameters
L=1024; % choose number of PSD values to compute
[powsd,freq]=ARpsd(a,sig2u,L); % compute PSD values and corresponding
                               % frequencies
plot(freq,powsd)
xlabel('f')
ylabel('P_w(f)')
grid




