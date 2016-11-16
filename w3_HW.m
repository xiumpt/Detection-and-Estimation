%=======================================
% Linear FM: 
% the phase is B[n] = 2pi(f_0*n+0.5*m*n.^2)
% s[n]=Acos[2pi(f_0*n+0.5*m*n.^2)+phi]  n=0,...,N-1
% - The phase is quadratic in n -> the first difference is linear with n 
% - It is called a linear FM (LFM) or a chirp
% Plot the following signals samples and the spectrum as the parameters indicated in the figure
% Signals samples and the spectrum for a linear FM with A = 1, f0 = 0.01, phi = 0, m = 0.1/(N-1) and N = 100
%=======================================
close all; clear all;

A=1; fo=0.01; phi=0; N=100; m=0.1/(N-1); 
n=[0:N-1]';

%b=2*pi*(fo*n+0.5*m*n.^2);
s=A*cos(2*pi*(fo*n+0.5*m*n.^2)+phi);

subplot(1,2,1);stem(n,s);
xlabel('n');ylabel('s[n]');title('FM');axis([0,100,-1,1]);grid;

% Fourier transform
f=([0:1023]'/1024)-0.5; % frequencies from -0.5 to 0.5
for i=1:1024
    e=exp(j*2*pi*f(i)*n);
    S2mag(i,1)=abs(sum(e'*s));
end

subplot(1,2,2);plot(f,S2mag);
xlabel('f');ylabel('|S(f)|');title('FM spectrum');grid;
