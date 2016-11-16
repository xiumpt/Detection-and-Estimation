% ARpsd.m
%
%   This program computes a set of PSD values for the
%   frequency band [-1/2,1/2), given the parameters of an 
%   AR model. The FFT is used to evaluate the 
%   denominator polynomial of the AR PSD function. powsd(i) corre-
%   sponds to the PSD at frequency f=-1/2+(i-1)/L, where L is
%   the number of frequency samples desired. 
%
%   Input parameters:
%
%     a    - Array of dimension px1 of AR parameters
%            arranged as a(1) to a(p)
%     sig2u - Variance of excitation noise
%     L    - Number of frequency samples desired, choose L as a power
%            of two (a typical value is L=1024)
%
%   Output parameters:
%
%     powsd  - Real array of dimension Lx1 of PSD values
%     freq   - Values of frequencies, where -1/2 < freq < 1/2
%
 function [powsd,freq]=ARpsd(a,sig2u,L)
%  Compute denominator frequency function
   den=[1;a];
   denf=fftshift(fft(den,L));
   powsd=sig2u./(abs(denf).^2);
   for i=1:L
      freq(i,1)=-0.5+(i-1)/L;
   end
          
   
   
   
   
      

