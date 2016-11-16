%  ED_threshold.m
%
%  This function subprogram computes the threshold gamma required for an energy
%  detector to achieve a given Pfa.  See (10.13).  It uses a bracketing
%  search to determine the value needed to yield a given right-tail 
%  probability of a central chi-squared PDF with N degrees of freedom.
%  This is given by x=Q_{\chi^2_N}^{-1}(Pfa).
%
%  Input parameters:
%    N  - number data samples
%    Pfa  - probability of false alarm desired
%    sig2 - variance of WGN
%    xmax - interval of [0,xmax] is used to search for the value x such that
%           Pfa=Q_{\chi^2_N}(x).  If x is too small, then program will not
%           terminate!
%
%  Output parameters:
%    gamma - threshold required
%
%  External function subprograms required:
%    Qchipr2.m   
%
function gamma=ED_threshold(N,Pfa,sig2,xmax)
xmin=0;  % set initial x_min to zero
error=100;
while abs(error)>Pfa/100  %  maximum error in x is determined by
                   % the value that yields a 1% error in the desired Pfa
  x=0.5*(xmin+xmax);  % this is the current iterate for gamma
  Pfaest=Qchipr2(N,0,x,Pfa/100);  % calculate right-tail probability for 
                                  % current iterate of x
  error=-(Pfaest-Pfa);  % calculate error, if error > 0, then Pfaest<Pfa
  % and therefore x is too large so keep x as the maximum value but on 
  % next iterate use the midpoint, and similarly if error < 0 so that x 
  % is too small
   if error > 0
      xmax=x;
   else
      xmin=x;
   end
end
gamma=sig2*x;  % compute final value of threshold


   
   
      
   
   
   