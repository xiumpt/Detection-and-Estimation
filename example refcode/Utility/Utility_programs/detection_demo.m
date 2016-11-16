% detection_demo.m
%
%  This program compares the performance of an autocorrelator detector
%  with that of a matched filter and an energy detector by computing a 
%  receiver operating characteristic (ROC). The signal is
%  a sinusoid of unknown frequency embedded in white Gaussian noise.
%
%  Input parameters:
%
%    f0 - frequency of sinusoidal signal (0<f0<0.25)
%    N  - number of samples in data record
%    varw - variance of white Gaussian noise
%    nreal - number of realizations used to generate ROC
%
%  Output parameters:
%
%    Pfa - array of dimension ngam x 1 containing Pfa values
%    Pd  - array of dimension ngam x 1 containing Pd values
%
%  Verification of program:
%
%  The exact values for the various detectors should be:
%  for the autocorrelator, Pfa_ac(25)=0.0981, Pd_ac(25)=0.5069
%  for the matched filter, Pfa_mf(25)=0.1575, Pd_mf(25)=0.9540
%  for the energy detector, Pfa_ed(25)= 0.0428, Pd_ed(25)= 0.2270
%
%  External programs required:
%
%  roccurve.m  - used to compute the ROC
%  Q.m         - used to compute Q function (see [1, pg. 50])
%  Qinv.m      - used to compute inverse Q function (see [1, pg. 51])
%  Qchipr2     - used to compute right-tail-probability for
%                central and noncentral chi-squared probability density
%                function (see [1, pg. 55])
%
clear all
close all
timestart=clock; % clock time when program begins
randn('state',0) % set random number generator to fixed initial state to
% generate same set of noise samples each time this program is run
rand('state',0) 
f0=0.025;
% f0=0.15; % change to this frequency to show sensitivity to frequency
N=25;
n=[0:N-1]'; % integer time samples
s=cos(2*pi*f0*n); % generate signal
varw=2;
nreal=10000;
for i=1:nreal % compute realizations of detector test statistics
   w=sqrt(varw)*randn(N,1); % generate white Gaussian noise
   % w=sqrt(12*varw)*(rand(N,1)-0.5); % generate white uniform noise to show
                                     % effect of noise statistics
    x=s+w;                           % generate signal plus noise
    Tac_0(i,1)=sum(w(1:N-1).*w(2:N)); % autocorrelation test statistic for
                                      % noise only - see (7B.1)
    Tac_1(i,1)=sum(x(1:N-1).*x(2:N)); % autocorrelation test statistic for
                                      % signal plus noise 
    Tmf_0(i,1)=w'*s; % matched filter test statistic - see (7B.2)
    Tmf_1(i,1)=x'*s;
    Ted_0(i,1)=w'*w; % energy detector test statistic - see (7B.3)
    Ted_1(i,1)=x'*x;
end
ngam=50; % number of thresholds used to determine (Pfa,Pd) pairs
[Pfa_ac,Pd_ac,gam]=roccurve(Tac_0,Tac_1,ngam);
[Pfa_mf,Pd_mf,gam]=roccurve(Tmf_0,Tmf_1,ngam);
[Pfa_ed,Pd_ed,gam]=roccurve(Ted_0,Ted_1,ngam);
plot(Pfa_ac,Pd_ac,'-',Pfa_mf,Pd_mf,'--',Pfa_ed,Pd_ed,':',[0:0.01:1]',[0:0.01:1]','-.')
xlabel('Probability of false alarm (Pfa)')
ylabel('Probability of detection (Pd)')
legend('autocorrelator','matched filter','energy detector', 'lower bound')
title('detection\_demo.m')
grid
d2=s'*s/varw; % This is deflection coefficient - see (7B.5)
Pfa_mft=0.1; Pd_mft=Q(Qinv(Pfa_mft)-sqrt(d2)) % matched filter theoretical
                                              % Pd - see (7B.4)
gamma=61;epsilon=0.01;
Pfa_edt=Qchipr2(N,0,gamma/varw,epsilon) % energy detector theoretical 
                                        % Pfa - see (7B.6)                           
Pd_edt=Qchipr2(N,d2,gamma/varw,epsilon)  % energy detector theoretical 
                                        % Pd - see (7B.7)
runtime=clock-timestart % total run time



    