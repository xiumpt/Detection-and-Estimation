% FSSP3exer4_2.m
%
clear all
close all
randn('state',0) % initialize random number generator
N=1000; % set number of realizations of data record of length N 
        % to be generated, either N=1000 or N=10000
sig2=4; % set WGN noise variance
w=WGNgendata(N,sig2);
sig2hat=sum(w.^2)/N % calculate noise variance estimate



