% ARgendata.m
%
%   This program generates a realization of an AR random process
%   given the filter parameters and excitation noise variance.
%   The starting transient is eliminated because the initial conditions 
%   of the filter are specified to place the filter output in statistical 
%   steady state. See S. Kay, "Efficient generation of colored noise",
%   Proceedings IEEE, Vol. 69, pp. 480-481, April 1981 for further details.
%
%   Input Parameters:
%     
%     a     - array of dimension px1 of AR filter parameters
%               arranged as a(1) to a(p) 
%     sig2u - variance of excitation noise
%     N     - number of data points desired
%
%   Output Parameters:
%  
%     x    - array of dimension Nx1 of data samples
%
%   External Function Subprograms Required:
%
%     stepdown.m
%  
%   Notes: 
% 
%     The user must ensure that the AR filter parameters chosen
%     results in a stable all-pole filter.
%
function x=ARgendata(a,sig2u,N)
p=length(a); % get AR model order
v=randn(N,1); % set initial conditions for AR filtering if p=1
if p==1
         rho0=sig2u/(1-a(1)^2);
         x(1,1)=sqrt(rho0)*v(1);
      end
      %   set initial conditions for AR filtering if p>1
if p>1
         [aa,rho0,rho]=stepdown(p,a,sig2u);    
         x(1,1)=sqrt(rho0)*v(1);
end
      for k=2:p
         x(k,1)=sqrt(rho(k-1))*v(k);
      for ll=1:k-1
         x(k,1)=x(k,1)-aa(ll,k-1)*x(k-ll,1);
      end
      end
%   generate remainder of AR data
    for k=p+1:N
      x(k,1)=sqrt(sig2u)*v(k);
      for ll=1:p
         x(k,1)=x(k,1)-a(ll)*x(k-ll,1);
      end
   end



     

