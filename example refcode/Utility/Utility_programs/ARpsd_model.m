% ARpsd_model.m
%
% This program determines the AR model PSD to approximate
% a desired power spectral density (PSD).
%
%   Input Parameters:
%     
%     f  - array of dimension Lx1 of frequency values of desired PSD
%          use f(l)=l/(2L), for l=-L,...,L
%     Pw - array of dimension Lx1 of corresponding PSD values
%     p  - AR model order desired
%
%   Output Parameters:
%  
%     PAR - array of dimension Lx1 of AR PSD values, the elements 
%           correspond to the frequencies given by the f array input
%     ahat - array of dimension px1 of AR filter parameters for the model
%            arranged as ahat(1),...,ahat(p)
%     siguhat - excitation noise variance for the model
%
function [PAR,ahat,sig2uhat]=ARpsd_model(f,Pw,p)
delf=f(2)-f(1); % determine frequency spacing
for k=0:p  % compute autocorrelation sequence for desired PSD
    rw(k+1,1)=delf*sum(Pw.*cos(2*pi*f*k));
end
r=rw(2:p+1,1); % set up autocorrelation matrix for Yule-Walker equations
for k=1:p
    for l=1:p
        R(k,l)=rw(abs(k-l)+1);
    end
end
ahat=-inv(R)*r; % solve Yule-Walker equations
sig2uhat=rw(1)+ahat'*r; % find the excitation noise variance
ap=[1;ahat];
for k=1:length(f) % compute AR PSD values
    e=exp(j*2*pi*f(k)*[0:p]');
    Amag2=abs(e'*ap);
    PAR(k,1)=sig2uhat/(Amag2^2);
end






