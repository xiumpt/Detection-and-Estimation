%  pdf_AR_est_order.m
%
%  This program estimates the AR model order needed to estimate the PDF
%  using an AR model.  The value can be input to the program pdf_AR_est.m
%  to estimate the PDF.
%  It assumes that the PDF is symmetric about x=0.  See
%  S. Kay, "Model-Based Probability Density Function Estimation", IEEE
%  Signal Processing Letters, Dec. 1998 for more details.
%
%  Input parameters:
%
%    x      - array of dimension N x 1 containing the data
%    pmax   - maximum AR model order that estimate can produce
%    ks     - set to 4 or larger, needed to normalize data to have values
%             in the interval [-0.5,0.5].  It is assumed that the original data
%             values are in the interval -ks*sqrt(var)<x<ks*sqrt(var).
%             Recommend a value no larger than 7.
%
%  Output parameters:
%
%    pest  - estimated value of AR model order
%
%  External programs used:
%
%    YWsolve.m (contained on the CD)
%
  function pest=pdf_AR_est_order(x,pmax,ks)
var=cov(x);  % estimate the variance of random variable for scaling
scale=2*ks*sqrt(var); 
x=x/scale; % scale the data to the [-0.5,0.5] interval
   for i=1:pmax+1  % find the "autocorrelation" sequence (actually the
       % characteristic function sequence phi[0],phi[1],...,phi[p]
   phi(i,1)=mean(cos(2*pi*x*(i-1)));
   end
for i=1:pmax
    [a,sig2u]=YWsolve(phi,i); % find AR parameters for each possible order
    for k=1:length(x) % compute the AR pdf for each data point (and assuming 
        % the given model order)
       A(k,1)=1;   
       for l=1:i
           A(k,1)=A(k,1)+a(l)*exp(-j*2*pi*l*x(k));
       end
       pdfest(k,1)=(sig2u/(abs(A(k))^2)); 
       % compute twice the log-likelihood ratio for use in EEF.  Note that
       % the zeroth order PDF is just p_0(x)=sig2u_0/scale so the scale factor cancels
       % out of the likelihood ratio. Also, sig2u_0=1 for the PDF to integrate
       % to one over |x|<=1/2. Twice the log-likelihood ratio
       % becomes LGi=2*ln(p_i/p_0)=2*sum(ln(pdfest(k))), 
    end
    LGi(i,1)=2*sum(log(pdfest));
    if LGi(i)>i
        EEF(i,1)=LGi(i)-i*(log(LGi(i)/i)+1);
    else
        EEF(i,1)=0;
    end
end
   [mm pest]=max(EEF); % find estimated order as the one that maximizes EEF
 



 

 
 
 
 
 
         
   
   
   
   
   
   
   