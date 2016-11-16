function [wave_data,t] = wavefunc(Tstep,Tstop,amp,freq);
% wave 
t = (0:Tstep:Tstop); 
wave_data = amp*sin(2*pi*freq*t);
plot(t,wave_data);