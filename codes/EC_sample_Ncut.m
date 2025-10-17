function TTclass = EC_sample_Ncut(ndata,K,tau,k,sID)
K_g = K>=tau;
G = graph(K_g);
% G = graph(gather(K_g));
[Tclass, number] = conncomp(G);

if size(number,2)>=k
    Tclass = Tclass';
    [~,index] = maxk(number,k);
    Tlass_k = zeros([size(ndata,1),1]);
    sum_i = [];

    for i = 1:1:k
        Tlass_k(sID(Tclass==index(i)))=i;
        sum_i = [sum_i,sum(ndata(sID(Tclass==index(i)),:),1)'];
    end


    x2x = sum(ndata(Tlass_k==0,:).* ndata(Tlass_k==0,:),2);
    x2x = repmat(x2x,1,k);
    x2A = ndata(Tlass_k==0,:)*sum_i;
    X2A = sum(ndata,1)*sum_i;
    A2A = sum(sum_i.*sum_i,1);
    [nx,~]=size(x2x);
    A2A = repmat(A2A,nx,1);
%     X2x =  sum(ndata(Tlass_k==0,:)*ndata(Tlass_k==0,:)',2);
%     X2x =  sum(ndata(Tlass_k==0,:)*ndata',2);
%     X2x = repmat(X2x,1,k);
    
    x2X = ndata(Tlass_k==0,:)*mean(ndata,1)';
    x2X = repmat(size(ndata,1).*x2X,1,k);
    
%     needclass = (x2x+2.*x2A+A2A)./(x2X+X2A);
    needclass = (x2x+2.*x2A)./(x2X+X2A);
    [~,aha]=max(needclass,[],2);

%     needclass = ndata(Tlass_k==0,:)-

    Tlass_k(Tlass_k==0) = aha;
    TTclass = Tlass_k;
    
%% postprocessing

Tclass = TTclass;
Th=ceil(size(ndata,1)*0.01);
Tclass2=Tclass+1;

for iter=1:100
    Cmean=[];
    for i=1:k
        Cmean=[Cmean;mean(ndata(Tclass==i,:),1)];
    end
    [~,Tclass2]=max(ndata*Cmean',[],2);

    if sum(Tclass2~=Tclass)<Th
        break
    end
    Tclass=Tclass2;
end
TTclass = Tclass;



else
    TTclass = zeros(size(ndata,1),1)+1;
end