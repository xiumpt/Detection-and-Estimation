%  Burg.m
%
%  This program estimates the AR parameters using the Burg method
%  (an approximate MLE). Note that AR filter parameters will produce
%  a stable all-pole filter.
%
%  Input parameters:
%   x   - N x 1 array of real data
%   p   - AR model order desired
%
%  Output parameters:
%   ahat     - p x 1 array containing AR filter parameters arranged as
%               [ahat[1] ahat[2]... ahat[p]]^T
%   sig2uhat - estimate of excitation white noise variance
%
   function [ahat,sig2uhat]=Burg(x,p)
   N=length(x);
   efk1=zeros(N,1);ebk1=efk1;rho=zeros(p,1);
   aa=zeros(p,p);a=zeros(p,1);
   rho0=x'*x/N;
   for l=2:N
   efk1(l)=x(l);
   ebk1(l-1)=x(l-1);
   end
   for k=1:p
   sumn=0;sumd=0;
     for l=k+1:N
     sumn=sumn+efk1(l)*ebk1(l-1);
     sumd=sumd+abs(efk1(l))^2+abs(ebk1(l-1))^2;
     end
   aa(k,k)=-2*sumn/sumd;  
   if k==1
     rho(k)=(1-abs(aa(k,k))^2)*rho0;
   else
     rho(k)=(1-abs(aa(k,k))^2)*rho(k-1);
   end
   if p==1
     sig2u=rho(1);a(1)=aa(1,1);
     return
   else
   end
   if k>1
     for j=1:k-1
     aa(j,k)=aa(j,k-1)+aa(k,k)*aa(k-j,k-1);
     end
   else
   end
   for l=k+2:N
   efk(l)=efk1(l)+aa(k,k)*ebk1(l-1);
   ebk(l-1)=ebk1(l-2)+aa(k,k)*efk1(l-1);
   end
   for l=k+2:N
   efk1(l)=efk(l);ebk1(l-1)=ebk(l-1);
   end
   end
   sig2uhat=rho(p);
   ahat(1:p)=aa(:,p);
   
   

   
