% FSSP3exer4_12.m
%
%  This program plots the AR(1) PSD for various values of the filter
%  parameter.  The PSDs are the same as in Figure 4.14 at the times 
%  n=0, n=250, and n=500.
%
clear all
close all
L=1024;
sig2u=1;
a(1)=-0.9; %set AR(1) filter parameter for each case
[powsd1,freq]=ARpsd(a,sig2u,L); % obtain PSD samples for each case
a(1)=-0.8;
[powsd2,freq]=ARpsd(a,sig2u,L);
a(1)=-0.7;
[powsd3,freq]=ARpsd(a,sig2u,L);
plot(freq,powsd1,freq,powsd2,freq,powsd3) % plot all three PSDs
grid
xlabel('f')
ylabel('PSD')
legend('a[1]=-0.9','a[1]=-0.8','a[1]=-0.7')




