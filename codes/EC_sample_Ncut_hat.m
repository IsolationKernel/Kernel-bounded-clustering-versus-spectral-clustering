function TTclass = EC_sample_Ncut_hat(ndata,K,tau,k,sID)
K_g = K>=tau;
G = graph(K_g);
% G = graph(gather(K_g));
[Tclass, number] = conncomp(G);
all_mean = mean(ndata,1);
if size(number,2)>=k
    Tclass = Tclass';
    [~,index] = maxk(number,k);
    Tlass_k = zeros([size(ndata,1),1]);
    mean_i = [];

    for i = 1:1:k
        Tlass_k(sID(Tclass==index(i)))=i;
        mean_i = [mean_i;mean(ndata(sID(Tclass==index(i)),:),1)];
    end


    X2A = mean_i*all_mean';

%     needclass = (ndata*mean_i')./X2A';
%     [~,TTclass]=max(needclass,[],2);
    
    needclass = (ndata(Tlass_k==0,:)*mean_i')./X2A'; 
    [~,aha]=max(needclass,[],2);
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
%     X2A = Cmean*all_mean';
%     [~,Tclass2]=max(ndata*Cmean'./X2A',[],2);
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