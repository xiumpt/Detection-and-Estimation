% pdf_hist_est.m
%
%  This program estimates and plots the PDF of a set of data using a 
%  histogram estimator.
%
%  Input parameters:
%
%    x      - array of dimension N x 1 containing the data
%    nbins  - number of bins (<N/10)
%    plotit - set equal to 1 if a plot is desired, set equal to 0 otherwise
%    xmin   - minimum value x-axis for plot
%    xmax   - maximum value x-axis for plot
%    ymax   - maximum value y-axis for plot
%
%  Output parameters:
%
%    xx    - array of dimension nbins x 1 containing x-axis bin centers
%    pdfest - array of dimension nbins x 1 containing estimated PDF values
%
 function [xx,pdfest]=pdf_hist_est(x,nbins,plotit,xmin,xmax,ymax)
  N=length(x);
  if nbins < N/10  % check to see if there are sufficient data samples
                   % to estimate PDF in each bin
  [y,xxx]=hist(x(1:N),nbins);  % compute histogram
  xx=xxx';   % convert to column vector
  delx=xx(2)-xx(1); % determine the bin width
  pdfest=y'/(N*delx);  % compute PDF estimate (see (6.18))
  if plotit==1  % plot estimated PDF if desired
  colormap([0.5 0.5 0.5])
  bar(xx,pdfest)
  grid
  axis([xmin xmax 0 ymax]);
  xlabel('x')
  ylabel('PDF, p(x)')
  end
  else
        message='reduce number of bins desired'
  end   

