% cwgn.m
%
% This program generates complex white Gaussian noise.
%
%  Input parameters:
%    N  - number of complex data points desired
%    sig2 - variance of the complex WGN
%
%  Output parameters:
%    x  - complex array of dimension Nx1 containing CWGN sampls
%
function x=cwgn(N,sig2)
x=sqrt(sig2/2)*randn(N,1)+j*sqrt(sig2/2)*randn(N,1);
