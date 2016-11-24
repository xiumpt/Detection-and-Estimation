% Pw(f,n) for n = 0, 50, 100,...,500: Time-varying power spectral density for the AR(1) dynamical noise process. 
% The AR(1) filter has a time-varying and constant excitation noise variance.
clear all; close all;

L=11; % frequency samples 
sig2u=1; N=11;
for n=0:N-1
    a(1,n+1)=-0.9+0.2*(n/N);    
end
A=a';   %Array of dimension px1 of AR parameters
[powsd,freq]=ARpsd(A,sig2u,L);  %freq=-0.5:0.5 

plot(freq,powsd);xlabel('f');ylabel('P_W');
figure;

n=0:50:500;
[x,y]=meshgrid(freq,n);
Pw=powsd*n;
mesh(x,y,Pw');
xlabel('f');ylabel('n');zlabel('P_w(f,n)');

