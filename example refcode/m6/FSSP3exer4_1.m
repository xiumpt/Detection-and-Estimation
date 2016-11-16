% FSSP3exer4_1.m
%
clear all
close all
randn('state',0) % initialize random number generator
N=1000; % set number of realizations of data record of length N  
       % to be generated
sig2=4; % set WGN noise variance
w=WGNgendata(N,sig2);
count=0;
for i=1:N
    if w(i)>3
        count=count+1; % keep count of how many outcomes exceed 3
    end
end
count % print out number of outcomes exceeding 3



