% pole_plot_PSD.m
%
%  This program allows the user to specify poles in the unit circle of the
%  z-plane.  These poles are then converted to autoregressive parameters
%  and the corresponding power spectral density P(f) is plotted, assuming
%  the excitation noise variance is sig2u=1.  Either
%  complex conjugate and/or real poles can be input using a left mouse-
%  click at the displayed crosshairs.  The power spectral density is 
%  currently set to be plotted in a linear scale but can be changed to 
%  logarithmic (dBs) (see comments in code for setup).
%  The resultant autoregressive parameters a[1]....,a[p] can be 
%  written out, if desired (see comments in code for setup).  
%
%!!!!!!!!!!!!!!!!!!!!!!!USER INSTRUCTIONS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
%    1. Run program to obtain figure window
%    2. Maximize figure window
%    3. Left click the mouse to obtain cross-hairs
%    4. Left click again to place a pair of complex conjugate poles at the
%       crosshair location
%    5. Left click to regain the crosshairs to specify next pair of complex
%       conjugate poles 
%    6. Continue until finished entering complex conjugate poles
%    7. Hit "enter"
%    8. Left click mouse to obtain crosshairs
%    9. Left click mouse to place a real pole on real axis near the
%    crosshairs
%    10. Continue until finished entering real poles
%    11. Hit "enter" to terminate and obtain final results
%
%!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
clear all
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
logplot=0; %set to 1 for a log PSD plot 
AR_par=0; %set to 1 to output AR parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
theta=2*pi*[0:0.01:1]';
xx=cos(theta);
yy=sin(theta);
subplot(2,1,1)
plot(xx,yy)
set(gca,'Xtick',[-1:0.2:1],'Ytick',[-1:0.2:1])
grid
axis('square')
title('pole\_plot\_PSD.m')
hold on
text(-3.25,0.5,'Left click mouse','Color','blue')
text(-3.25,0.35,'to obtain crosshairs','Color','blue')
text(-3.25,-0.2,'Input complex poles in unit circle - ','Color','blue')
text(-3.25,-0.35,'when finished hit enter','Color','blue')
ic=0;
while 1==1
     T=waitforbuttonpress;
    if T==1
        break
    end
     ic=ic+1;
    [xc(ic,1) yc(ic,1)]=ginput(1);
    if xc(ic)^2+yc(ic)^2>1
        text(1.2,0,'Please enter pole within unit circle','Color','blue')
        
        xc(ic)=[];
        yc(ic)=[];
        ic=ic-1;
    else
        r=sqrt(xc(ic)^2+yc(ic)^2);
        phi=atan2(yc(ic),xc(ic))/(2*pi);
         plot(xc(ic),yc(ic),'x',xc(ic),-yc(ic),'x')
         text(1.2,0.65-ic*0.15,['r = ',num2str(r),', \phi/2\pi = \pm',num2str(phi)],'Color','blue')
    end
end
if ic>0
z1=xc+j*yc;
z2=xc-j*yc;
end
text(-3.25,-0.6,'Input real poles - ','Color','blue')
text(-3.25,-0.75,'when finished hit enter','Color','blue')
T=0;ir=0;
while 1==1
     T=waitforbuttonpress;
     if T==1
         break
     end
     ir=ir+1;
    [xr(ir,1) yr(ir,1)]=ginput(1);
    plot(xr(ir),0,'x')
    text(1.2,0.5-(ir+ic)*0.15,['z = ',num2str(xr(ir))],'Color','blue')    
end
if ir>0
z3=xr;
end
z=[];
if ic>0
    z=[z;z1;z2];
end
if ir>0
    z=[z;z3];
end
a=real(poly(z));a=a';
freq=[0:2047]'/2048-0.5;
Amag=abs(fftshift(fft(a,2048)));
PSD=1./Amag.^2;  % see (4.2) for form of the AR PSD
hold off
subplot(2,1,2)
if logplot==1
plot(freq,10*log10(PSD))
ylabel('Power spectral density, P(f) (dB)')
else
plot(freq,PSD)
ylabel('Power spectral density, P(f)')
end
grid
xlabel('frequency, f')
p=length(a)-1;
a=a(2:p+1,1);
if AR_par==1
    message='the AR filter parameters are a(1),a(2),...,a(p)'
a
end





