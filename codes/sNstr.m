function [ndata,U,D] = sNstr(data,k,sig)
 
m=k;
n = size(data,1);
p=5;
q=2;

idx = randperm(n);   

cols = idx(1:m);    
  
m_dis=pdist2(data,data(cols,:));
C = exp(-0.5*(m_dis.^2)./(2*sig^2));

W = C(cols,:);    

%%%% perform truncated SVD on m-by-m matrix W

[V,D] = rsvd(W,k,p,q);

%%%% form the approximation


U = C * ( sqrt(m/n) * V );
D = (n/m) * diag(diag(D).^-1);

ndata = U*chol(D)'; % feature map  
% ndata = U;
end

