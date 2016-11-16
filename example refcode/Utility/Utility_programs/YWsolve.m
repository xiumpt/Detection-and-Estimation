%  YWsolve.m
%
%  This program solves the Yule-Walker equations (see (4.10)).  
%
%  Input parameters:
%
%    r - (p+1)x1 vector of real ACF values arranged as [r[0] r[1]...r[p]]^T
%    p - AR model order
%
%  Output parameters:
%
%    a - px1 real vector of AR filter parameters
%    sig2u - white noise variance
%
    function [a,sig2u]=YWsolve(r,p)
   for i=1:p % set up p x p autocorrelation matrix
   rvec(i,1)=r(i+1);
   for j=1:p
    R(i,j)=r(abs(i-j)+1);  
   end
   end
   a=-inv(R)*rvec; % solve for AR filter parameters
   sig2u=r(1)+rvec'*a; % compute excitation white noise variance

