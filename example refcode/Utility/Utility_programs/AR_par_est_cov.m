%  AR_par_est_cov.m  
%
%  This program estimates the AR parameters using the covariance method, 
%  an approximate MLE.  See (11.8) and also [Kay 1988, pp. 185-189] for 
%  further details). Note that AR filter parameters may 
%  not produce a stable all-pole filter so method is not recommended for 
%  synthesizing an AR time series.  Use Burg.m instead.  
%
%  Input parameters:
%   x   - N x 1 array of real data
%   p   - AR model order desired
%
%  Output parameters:
%   ahat     - p x 1 array containing AR filter parameter estimates arranged as
%          [a[1] a[2]... a[p]]^T
%   sig2uhat - estimate of excitation white noise variance
%
    function [ahat,sig2uhat]=AR_par_est_cov(x,p)
    N=length(x);
    for i=1:N-p  % set up H matrix (observation matrix) for least squares
                 % estimate
     if i==1 
         H=flipud(x(1:p))';
     else 
      H=[H;flipud(x(i:i+p-1))'];
     end
   end
   h=x(p+1:N);  % set up data vector for least squares estimate
   ahat=-inv(H'*H)*H'*h;  % compute estimate
   sig2uhat=(1/(N-p))*(h+H*ahat)'*(h+H*ahat); % compute unbiased estimate of 
                                     % excitation white noise variance
  

   


