% FSSP3exer2_3.m
%
%  This program computes the magnitude of the discrete-time Fourier
%  transform for a time truncated sinusoid having various frequencies.
%  It illustrates the distinguishability of a sinusoid at fd=0 from a 
%  sinusoid at another frequency,
%
close all; clc;clear all;

N=20;  % number of data samples
n=[0:N-1]'; % time samples
fd=0.2; % change to 0.01 to see a peak at fd=0
s1=cos(2*pi*(0)*n); % signal freq at zero
s2=cos(2*pi*fd*n);  % signal freq at fd
f=([0:1023]'/1024)-0.5; % frequencies from -0.5 to 0.5
for i=1:1024
 e=exp(j*2*pi*f(i)*n);
    S1mag(i,1)=abs(sum(e'*s1)); % complex magnitude of Fourier transform
    S2mag(i,1)=abs(sum(e'*s2)); % abs = |  |
end


subplot(2,1,1), plot(f,S1mag)
xlabel('f'), ylabel('|S_1(f)|')
title('f_d=0'), grid

subplot(2,1,2), plot(f,S2mag)
xlabel('f'), ylabel('|S_2(f)|')
title(['f_d= ' num2str(fd)]), grid
                       
