% stepdown_complex.m
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
%  Input Parameters:
%
%    a    - Complex array of dimension px1, where P>1, of AR filter 
%           parameters arranged as a(1) to a(p)
%    sig2u - Variance of excitation noise of AR model of order

%  Output Parameters:
%
%    aa   - Complex array of dimension pxp of prediction
%           coefficients where aa(i,j) is the ith coefficient of the
%           jth order predictor
%    rho0  - Zeroth lag of ACS
%    rho   - Real vector of dimension px1 of prediction error
%            powers where rho(j) is the prediction error power
%            for the jth order predictor
%
%  Verfication Test Case:
%
%    if p=3, a(1)=0.625+j*0.375, a(2)=0.5-j*0.375, a(3)=0.5,
%    and sig2=0.328125, then the output should be in short format
%      aa(1,1)=0.5000+j*0.5000, aa(1,2)=0.5000+j*0.2500,
%      aa(2,2)=0.2500-j*0.2500, rho0=1.0000, rho(1)=0.5000,
%      rho(2)=0.4375, rho(3)=0.3281
%
%  initialize step-down by equating AR parameters to pth
%  order prediction coefficients and prediction error power
function [aa,rho0,rho]=stepdown_complex(a,sig2u)
p=length(a);
      for i=1:p
        aa(i,p)=a(i);
         end
      rho(p)=sig2u;
%  Begin step-down
      p2=p-1;
      for j=1:p2
      k=p+1-j;
      den=1.-abs(aa(k,k))^2;
%  Compute lower order prediction error power (6.52)
      rho(k-1)=rho(k)/den; 
%  Compute lower order prediction coefficients (6.51)
      k1=k-1;
      for i=1:k1
         aa(i,k-1)=(aa(i,k)-aa(k,k)*conj(aa(k-i,k)))/den;
      end
   end
% Complete step-down by computing zeroth lag of ACS
      rho0=rho(1)/(1.-abs(aa(1,1))^2);
      

