% ARgendata_complex.m
%
%   This program generates data samples of a complex AR random process 
%   given the complex filter coefficients and excitation noise variance.
%   The starting transient is eliminated 
%   because the initial conditions of the filter are specified to 
%   place the filter output in statistical steady state.  
%   
%   This program has been converted from Fortran to Matlab.  See "Modern
%   Spectral Estimation" by S. Kay for further details.
%
%   Input Parameters:
%
%     a    - Complex array of dimension px1 of AR filter parameters
%            arranged as a(1) to a(p) 
%     sig2u - Variance of excitation noise
%     N    - Number of complex data points desired
%
%   Output Parameters:
%  
%     x    - Complex array of dimension Nx1 of complex data samples
%
%   External Function Subprograms Required:  stepdown_complex.m
%
%   Notes: 
% 
%     The user must ensure that the AR filter parameters chosen
%     result in a stable all-pole filter.
%
function x=ARgendata_complex(a,sig2u,N)
p=length(a);
   v=(1/sqrt(2))*randn(N,1)+j*(1/sqrt(2))*randn(N,1);
   if p==1  % for p=1 need only set the first sample to steady state value
   rho0=sig2u/(1-abs(a(1))^2);
   x(1,1)=sqrt(rho0)*v(1);
   else
   [aa,rho0,rho]=stepdown_complex(a,sig2u);   % for p>1 must set the first
  % p samples as initial conditions for the IIR filter in steady state
  % these are obtained using the stepdown procedure
   x(1,1)=sqrt(rho0)*v(1); % set up initial conditions of filter
      for k=2:p
         x(k,1)=sqrt(rho(k-1))*v(k);
      for ll=1:k-1
         x(k,1)=x(k,1)-aa(ll,k-1)*x(k-ll,1);
      end
      end
   end
    for k=p+1:N  % using the steady state initial conditions generate
                 % the remaining samples required
      x(k,1)=sqrt(sig2u)*v(k);
      for ll=1:p
         x(k,1)=x(k,1)-a(ll)*x(k-ll,1);
      end
   end
 
  

     

