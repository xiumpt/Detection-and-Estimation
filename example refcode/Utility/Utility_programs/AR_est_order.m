%  AR_est_order.m
%
%  This program estimates the AR model order needed to estimate the AR PSD,
%  based on the EEF approach (see (1.9)).
%
%  Input parameters:
%    x      - array of dimension N x 1 containing the data
%    pmax   - maximum AR model order that estimate can produce
%
%  Output parameters:
%    phat  - estimated value of AR model order
%
  function phat=AR_est_order(x,pmax)
  N=length(x);
  for k=1:pmax
      xk=x(k+1:N,1); % set up x_k vector of dimension N-k
      Hk=zeros(N-k,k);
      for i=1:N-k
          for j=1:k             
              Hk(i,j)=x(k+(i-j));  % compute H_k matrix of dimension 
                                   % (N-k) x k
          end
      end
      num=xk'*xk;
      den=num-xk'*Hk*inv(Hk'*Hk)*Hk'*xk;
      xi(k,1)=(N-k)*log(num/den);
    if xi(k)>k
        EEF(k,1)=xi(k)-k*(log(xi(k)/k)+1);  % compute EEF
    else
        EEF(k,1)=0;
    end
  end
   [mm phat]=max(EEF); % find estimated order as the one that maximizes EEF
   
   stem(EEF)
 
 



 

 
 
 
 
 
         
   
   
   
   
   
   
   