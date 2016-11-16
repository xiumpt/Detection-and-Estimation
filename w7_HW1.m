%=====================================
% AR(1) PSD - lowpass or highpass
% Choose for the AR parameters a[1] = 0.9 and sig2 = 0.19. 
% (1) Using ARpsd.m obtain values of the AR(1) PSD and the corresponding frequencies and plot the results.
% (2) Compare the PSD against the one a[1] = -0.9 and sig2 = 0.19as shown in the left figure below. 
% What can you say about the effect of the sign of a[1] upon the PSD?
%=====================================
clear all; close all;

a(1)=0.9; sig2u=0.19; % set values of parameters
L=1024; % frequency samples 

[powsd,freq]=ARpsd(a,sig2u,L);

b(1)=-0.9;
[powsd_2,freq_2]=ARpsd(b,sig2u,L);

subplot(1,2,1);
plot(freq,powsd);title('a[1]=0.9 sig2u=0.19');
xlabel('f');ylabel('P_w(f)');grid

subplot(1,2,2);
plot(freq_2,powsd_2);title('b[1]=-0.9 sig2u=0.19');
xlabel('f');ylabel('P_w(f)');grid




