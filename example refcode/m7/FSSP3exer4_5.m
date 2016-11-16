% FSSP3exer4_5.m
%
clear all;close all;
a(1)=-0.9;
freq=[-0.5:0.001:0.5]'; % set up frequencies to compute magnitude
e=exp(-j*2*pi*freq);
Hmag=abs(1./(1+a(1)*e)); % compute magnitude
plot(freq,Hmag)
xlabel('f');ylabel('|H(f)|');grid




