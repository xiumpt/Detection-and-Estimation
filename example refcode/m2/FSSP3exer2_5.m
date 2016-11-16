%  FSSP3exer2_5.m
%
%  This program produces Figure 2.4.  It uses the subprograms Q.m, which 
%  computes the Gaussian Q function and Qinv.m, which is the inverse 
%  function.  Also, the subprogram plotlineroutine.m is used for plotting. 
%  All these programs are included on the CD in the folder "Utility_programs".
%
   clear all
   close all
   sig2=15; % noise variance
   A=sqrt(15); % signal amplitude used for Figure 2.4 - modify this value
               % to attain the exact specs 
   N=20; % number of data samples
   fd=0.2; % signal frequency for no clot
   s0=A*cos(2*pi*fd*[0:N-1]'); % signal under H0
   s1=A*ones(N,1); % signal under H1
   d2=(s1-s0)'*(s1-s0)/sig2; % calculation of deflection coefficient, see (2.7)
   Pfa=[0:0.00001:0.001]';
   Pd=Q(Qinv(Pfa)-sqrt(d2)); % calculation of prob. of detection, see (2.6)
   plotlineroutine(Pfa,Pd,'no','o',4,4,'on','on','P_{FA}','P_D','')
  

   
  

