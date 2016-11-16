%  matlabexample.m 
%
%  This program computes and plots samples of a sinusoid
%  with amplitudes 1, 2, and 4.  If desired, the sinusoid can be
%  clipped to simulate the effect of a limiting device.
%  The frequency is 1 Hz and the time duration is 10 seconds. 
%  The sample interval is 0.1 seconds. The code is not efficient but
%  is meant to illustrate MATLAB statements.
%
clear all % clear all variables from workspace
delt=0.01; % set sampling time interval
F0=1; % set frequency
t=[0:delt:10]'; % compute time samples 0,0.01,0.02,...,10
A=[1 2 4]'; % set amplitudes
clip='yes'; % set option to clip
for i=1:length(A) % begin computation of sinusoid samples
   s(:,i)=A(i)*cos(2*pi*F0*t+pi/3); % note that samples for sinusoid 
                                    % are computed all at once and  
                                    % stored as columns in a matrix                                      
   if clip=='yes' % determine if clipping desired
      for k=1:length(s(:,i)) % note that number of samples given as 
                             % dimension of column using length command
         if s(k,i)>3 % check to see if sinusoid sample exceeds 3
            s(k,i)=3; % if yes, then clip
         elseif s(k,i)<-3 % check to see if sinusoid sample is less 
            s(k,i)=-3;    % than -3 if yes, then clip
         end
      end
   end
end
figure % open up a new figure window
plot(t,s(:,1),t,s(:,2),t,s(:,3)) % plot sinusoid samples versus time 
                                 % samples for all three sinusoids
grid % add grid to plot
xlabel('time, t') % label x-axis
ylabel('s(t)') % label y-axis
axis([0 10 -4 4]) % set up axes using axis([xmin xmax ymin ymax])
legend('A=1','A=2','A=4') % display a legend to distinguish 
                          % different sinusoids
