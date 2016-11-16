% FSSP3exer4_4.m
%
clear all
close all
a(1)=0.9;sig2u=0.19; % set values of parameters
L=1024; % ¨ú¼ËÂI choose number of PSD values to compute
 % compute PSD values and corresponding
                               % frequencies
[powsd,freq]=ARpsd(a,sig2u,L);

b(1)=-0.9;
[powsd_2,freq_2]=ARpsd(b,sig2u,L);

subplot(1,2,1);
plot(freq,powsd);title('a[1]=0.9 sig2u=0.19');
xlabel('f');ylabel('P_w(f)');grid

subplot(1,2,2);
plot(freq_2,powsd_2);title('b[1]=-0.9 sig2u=0.19');
xlabel('f');ylabel('P_w(f)');grid




