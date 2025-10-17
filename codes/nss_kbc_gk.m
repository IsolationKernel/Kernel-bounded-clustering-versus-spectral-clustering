clear
clc


load(datafile); % load data

t = min(size(data,1),400);  % parameter of nystrom
k = size(unique(class),1);  % number of clusters
s = min(size(data,1),1000); % sample size
sig = 1;                    % parameter of Guassian kernel
[ndata] = sNstr(data,t,sig);  % approx nystrom for Guassian kernel

sID = randperm(size(ndata,1),s);
K = ndata(sID,:)*ndata(sID,:)'; % Kernel matrix

Kn=0.35;                        % parameter of KBC $\tau$
Tclass = EC_sample(ndata,K,Kn,k,sID);