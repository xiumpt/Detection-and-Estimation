% WGNgendata.m
%
%  This program generates white Gaussian noise.
%
%  Input parameters:
%
%    N    - number of samples desired
%    sig2 - variance of the noise desired
%
%  Output parameters:
%
%    w   - array of dimension Nx1 containing the noise samples
%
function w=WGNgendata(N,sig2)
w=sqrt(sig2)*randn(N,1);