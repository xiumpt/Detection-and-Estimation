clear all;  close all;

%randn('state' ,0) % initialize random number generator
M=100; % set number of realizations of data record of length N=64 to be generated
N=64; % data record length % Change this for the exercise
maxerror=0.25; % Change this for the exercise
count=0;

for i=1:M % 1~100
    x=10+randn(N,1); % generate DC level in WGN with variance of one % and N=64 data samples
    Ahat=mean(x); % compute sample mean
    
    if abs(10-Ahat)<=maxerror % determine if the estimate falls in interval of [9.75,10.25] %abs=Absolute value
    count=count+1; % keep count of how many estimates fall within interval
    end
end

count % print out number of estimates meeting spec