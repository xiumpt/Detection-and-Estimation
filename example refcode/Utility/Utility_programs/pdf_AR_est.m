% pdf_AR_est.m
%
%  This program estimates and plots the PDF of a set of data using an 
%  AR estimator.  It assumes that the PDF is symmetric about x=0.  See
%  S. Kay, "Model-Based Probability Density Function Estimation", IEEE
%  Signal Processing Letters, Dec. 1998 for more details.
%
%  Input parameters:
%
%    x      - array of dimension N x 1 containing the data
%    p      - AR model order desired
%    kstd   - set to 4 or larger, needed to normalize data to have values
%             in the interval [-0.5,0.5].  It is assumed that the original data
%             values are in the interval -kstd*sqrt(var)<x<kstd*sqrt(var).
%             Recommend a value no larger than 7.
%    plotit - set equal to 1 if a plot is desired, set equal to 0 otherwise
%    linear - set equal to 1 if a linear plot is desired, set equal to 
%             0 to obtain a semilogy plot
%
%  Output parameters:
%
%    xx    -  array of dimension M x 1 containing x-axis values
%    pdfest - array of dimension M x 1 containing estimated PDF values
%    M      - number of PDF values computed (M=1000*(xmax-xmin), where
%             xmin, xmax are the smallest and largest values in x array
%
%  External programs used:
%
%    YWsolve.m (contained on the CD)
%
function [xx,pdfest,M]=pdf_AR_est(x,p,kstd,plotit,linear)
   var=cov(x);  % estimate variance of data
   scale=2*kstd*sqrt(var);  % calculate scaling constant to make sure all
                            % normalized data is in interval [-0.5,0.5]                                                    
   x=x/scale;               % normalize data
   for i=1:p+1              % compute estimated characteristic function
                            %    assuming PDF is even
   k=i-1;
   phi(i,1)=mean(cos(2*pi*x*k));
   end
   [a,sig2u]=YWsolve(phi,p);  % solve Yule-Walker equations for AR parameters
  xmin=-scale/2;xmax=scale/2;  % convert back to original data interval
   xx=[xmin:0.001:xmax]';    % set up x-axis points at which to compute PDF
   M=length(xx);            % keep track of number of PDF samples to be computed
   for k=1:length(xx)
       A(k,1)=1;   % compute the denominator polynomial at each x-axis point
       for l=1:p
           A(k,1)=A(k,1)+a(l)*exp(-j*2*pi*l*xx(k)/scale);
       end
     pdfest(k,1)=(sig2u/(abs(A(k))^2))/scale;  % compute final PDF estimate
        % be careful to apply the 'scale' factor to undo effect on the PDF estimate
        % from the tranformation of PDFs relation: Y=X/a implies p_Y(y)=p_X(ay)|a|
        % implies p_X(u)=p_Y(u/a)/|a| since we have estimated p_Y(y)
   end
   if plotit ==1  % plot the estimate PDF on either a linear or log scale
       if linear ==1 
           plot(xx,pdfest)
       else
       semilogy(xx,pdfest)
       end
       grid
       xlabel('x')
       ylabel('p(x)')
   end
  
  
  

