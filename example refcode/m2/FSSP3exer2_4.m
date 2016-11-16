% FSSP3exer2_4.m
%
%  This program calculates the deflection coefficient for two sinusoids
%  at different frequencies, with one at fd=0 and the other at various
%  values of fd.
%
close all; clear all
A=sqrt(15);phi=0;sig2=15;N=20; % set parameter values
n=[0:N-1]'; % set time samples
s1=A*cos(phi); % signal when clot is present
fd=[0:1024]'/2048; % signal frequencies from 0 to 0.5

for i=1:length(fd)
    s0=A*cos(2*pi*fd(i)*n+phi);    % signal when no clot is present
    d2(i,1)=(s1-s0)'*(s1-s0)/sig2; % calculation of deflection coefficient,
                                   % see (2.7)
end

plot(fd,d2)
xlabel('f_d'), ylabel('d^2')
grid
