% stepdown.m
%
%  This program implements the step-down procedure to find the
%  coefficients and prediction error powers for all the lower
%  order predictors given the coefficients and prediction
%  error power for the ipth order linear predictor or
%  equivalently given the filter parameters and white noise 
%  variance of an ipth order AR model.  See (6.51) and (6.52).
%  This program has been translated from Fortran into Matlab.
%  See "Modern Spectral Estimation" by S. Kay for further details.
%
%  input Parameters:
%
%    ip   - AR model order (must be 2 or greater)
%    a    - Real or complex array of dimension ipx1 of AR parameters
%           arranged as a(1) to a(ip)
%    sig2 - Variance of excitation noise of AR model of order
%           ip or equivalently the prediction error power of
%           the optimal linear predictor of order ip
%
%  Output Parameters:
%
%    aa   - Real or complex array of dimension ipxip of prediction
%           coefficients where aa(i,j) is the ith coefficient of the
%           jth order predictor
%    rho0  - Zeroth lag of ACF
%    rho   - Real vector of dimension ipx1 of prediction error
%            powers where rho(j) is the prediction error power
%            for the jth order predictor
%
%  Verfication Test Case:
%
%    if ip=3, a(1)=0.625+j*0.375, a(2)=0.5-j*0.375, a(3)=0.5,
%    and sig2=0.328125, then the output should be in short format
%      aa(1,1)=0.5000+j*0.5000, aa(1,2)=0.5000+j*0.2500,
%      aa(2,2)=0.2500-j*0.2500, rho0=1.0000, rho(1)=0.5000,
%      rho(2)=0.4375, rho(3)=0.3281
%
%  initialize step-down by equating AR parameters to ipth
%  order prediction coefficients and prediction error power
   function [aa,rho0,rho]=stepdown(ip,a,sig2)
      for i=1:ip
        aa(i,ip)=a(i);
         end
      rho(ip)=sig2;
%  Begin step-down
      ip2=ip-1;
      for j=1:ip2
      k=ip+1-j;
      den=1.-abs(aa(k,k))^2;
%  Compute lower order prediction error power (6.52)
      rho(k-1)=rho(k)/den; 
%  Compute lower order prediction coefficients (6.51)
      k1=k-1;
      for i=1:k1
         aa(i,k-1)=(aa(i,k)-aa(k,k)*conj(aa(k-i,k)))/den;
      end
   end
% Complete step-down by computing zeroth lag of ACF
      rho0=rho(1)/(1.-abs(aa(1,1))^2);
      

