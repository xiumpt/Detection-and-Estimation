% sinusoid_gen.m
%
%  This program generates a sum of damped sinusoids and also computes
%  the magnitude of the Fourier transform. See (3.9).
%
%
%  Input parameters:
%
%    N    - number of data samples desired
%    p    - number of damped sinusoids desired
%    A    - p x 1 array containing the amplitudes of sinusoids
%    r    - p x 1 array containing the damping factors (-1<r_i<1), if
%           undamped sinusoids are desired let r_i=1
%    f    - p x 1 array of frequencies desired (0<f_i<1)
%    phi  - p x 1 array of phases desired in radians (-pi<phi_i<pi)
%    Nf   - number of frequencies desired for magnitude of Fourier
%           transform
%
%  Output parameters:
%
%    n    - N x 1 array of integer time samples
%    s    - N x 1 array of signal samples
%    freq - Nf x 1 array of frequency samples over the interval [-0.5,0.5)
%    Smag - Nf x 1 array of Fourier transform magnitude samples
%
function [n s freq Smag]=sinusoid_gen(N,p,A,r,f,phi,Nf)
n=[0:N-1]';
s=zeros(N,1);
for i=1:p
    s=s+A(i)*(r(i).^n).*cos(2*pi*f(i)*n+phi(i));
end
freq=[0:Nf-1]'/Nf-0.5;
for k=1:Nf
e=exp(j*2*pi*freq(k)*n);
Smag(k,1)=abs(e'*s);
end



 





