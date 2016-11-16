%  autocorrelation_est.m
%
%  This program estimates the autocorrelation sequence from data.   It uses
%  the biased (divides the sum by N instead of N-k) autocorrelation estimator.
%  See (6.14) for form of estimator.
%
%  Input parameters:
%
%    x     - array of dimension N x 1 containing data
%    p     - maximum lag desired
%
%  Output parameters:
%
%    acs - array of dimension (p+1) x 1 containing the estimate of the 
%          autocorrelation sequence as r[0],r[1],...,r[p]
%
  function r=autocorrelation_est(x,p)
   N=length(x);
   for k=0:p
       r(k+1,1)= (1/N)*sum(x(1:N-k).*x(1+k:N));   % compute moments, second and higher
   end
   