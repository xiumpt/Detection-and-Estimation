%=====================================
% Line Signal
% Given the observed data model x[n] = 1 + 0.2n + w[n] where w[n] is a WGN with unit variance. 
% Find the least squares estimate of parameters [A B]^T from the line model s[n] = A + Bn.
%=====================================
clear all; close all;

N=50; n=[0:N-1]';

% Data Sample
x1=1+0.2*n;
x2=1+0.2*n+randn(N,1);
subplot(1,2,1);
plot(n,x1,'--');hold on; 
plot(n,x2,'x');grid on;
xlabel('n');ylabel('x[n]');title('Data Sample');
axis([0,20,-1,6]);

%  least squares estimator: H^T*H*Theta = H^T*x
%  => Theta = (H^T*H)^-1*H^T*x = ([A B]')
% s = H * Theta
h=[];
for i=0:N-1
    h=[h;1,i];
end

th=inv(h'*h)*h'*x2;  % theta
s=h*th;

subplot(1,2,2);
plot(n,x1,'--');hold on;grid;
plot(n,s,'o');
xlabel('n');ylabel('s[n]');title('Estimate line signal');
axis([0,20,-1,6]);

