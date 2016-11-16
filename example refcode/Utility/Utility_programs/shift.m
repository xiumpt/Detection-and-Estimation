% shift.m
%
%  This function subprogram shifts the given sequence by Ns points.
%  Zeros are shifted in either from the left or right.
%
%  Input parameters:
%    x  - real or complex array of dimension Lx1
%    Ns - integer number of shifts where Ns>0 means a shift to the
%         right and Ns<0 means a shift to the left and if Ns=0, then
%         the sequence is not shifted
%
%   Output parameters:
%    y  - real or complex array of dimension Lx1 containing the 
%         shifted sequence
function y=shift(x,Ns)
L=length(x);
if abs(Ns)>L
   y=zeros(L,1);
   else  
if Ns>0
y(1:Ns,1)=0;
y(Ns+1:L,1)=x(1:L-Ns);
elseif Ns<0
   y(L-abs(Ns)+1:L,1)=0;
   y(1:L-abs(Ns),1)=x(abs(Ns)+1:L);
else
   y=x;
end
end



