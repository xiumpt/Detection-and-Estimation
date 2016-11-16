% Gaussmix_gendata.m
%
%   This program generates a realization of IID Gaussian mixture noise
%   given the mixture parameters and the noise variances.
%
%   Input Parameters:
%     
%     sig21   - variance of first component of Gaussian mixture
%     sig22   - variance of second component of Gaussian mixture
%     epsilon - mixing probability
%     N       - number of data points desired
%
%   Output Parameters:
%  
%     x    - array of dimension N x 1 of data samples
%
function x=Gaussmix_gendata(sig21,sig22,epsilon,N)
   u=rand(N,1);
   for i=1:N
     if u(i)<1-epsilon  % choose first Gaussian mode with probability 1-epsilon
        x(i,1)=sqrt(sig21)*randn(1,1);
     else % choose second Gaussian mode with probability epsilon
        x(i,1)=sqrt(sig22)*randn(1,1);
     end
   end


     

