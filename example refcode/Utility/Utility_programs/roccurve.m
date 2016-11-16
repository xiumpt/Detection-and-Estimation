%  roccurve.m
%
%  This program determines the ROCs for a given set of detector
%  outputs under H0 and H1.
%  
%  Input parameters:
%
%    T0 - input array of dimension nreal x 1 under H0
%    T1 - input array of dimension nreal x 1 under H1
%    ngam - number of thresholds desired
%
%  Output parameters:
%
%    Pfa - output array of dimension ngam x 1
%    Pd  - output array of dimension ngam x1
%
   function [Pfa,Pd,gam]=roccurve(T0,T1,ngam)
   gammin=min(min(T0),min(T1));
   gammax=max(max(T0),max(T1));
   delg=(gammax-gammin)/ngam;
   gam=[gammin:delg:gammax]';
   for i=1:ngam
     clear v0;clear v1;
     v0=find(T0>gam(i));
     v1=find(T1>gam(i));
     Pfa(i,1)=length(v0)/length(T0);
     Pd(i,1)=length(v1)/length(T1);
   end
   
     
   
      

