% Laplacian_gendata.m
%
%   This program generates a realization of IID Laplacian noise
%   given the noise variance.
%
%   Input Parameters:
%     
%     sig2 - variance of noise
%     N     - number of data points desired
%
%   Output Parameters:
%  
%     x    - array of dimension Nx1 of data samples
%
%
function x=Laplacian_gendata(sig2,N)
   u=rand(N,1);
   for i=1:N
     if u(i)>0.5
        x(i,1)=sqrt(sig2)*(1/sqrt(2))*log(1/(2*(1-u(i))));
     else
        x(i,1)=sqrt(sig2)*(1/sqrt(2))*log(2*u(i));
     end
   end


     

