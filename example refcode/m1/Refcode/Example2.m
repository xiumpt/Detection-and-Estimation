Tstep = 0.001;
t=0:Tstep:1;
amp = 1;
freq = 10;
%y = amp * sin(2*pi*freq*t);
[wave_data,t] = wavefunc(Tstep,1,amp,freq);
%plot(t,y);
%axis([0,1,-2,2]);
%grid;