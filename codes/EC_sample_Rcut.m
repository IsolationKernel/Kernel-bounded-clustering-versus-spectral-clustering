function TTclass = EC_sample_Rcut(ndata,K,tau,k,sID)
K_g = K>=tau;
G = graph(K_g);
% G = graph(gather(K_g));
[Tclass, number] = conncomp(G);

if size(number,2)>=k
    Tclass = Tclass';
    [~,index] = maxk(number,k);
    Tlass_k = zeros([size(ndata,1),1]);
    mean_i = [];
    n_Ai = [];
    for i = 1:1:k
        Tlass_k(sID(Tclass==index(i)))=i;
        mean_i = [mean_i;mean(ndata(sID(Tclass==index(i)),:),1)];
         n_Ai = [n_Ai,size(Tclass==index(i),1)];
    end

%     needclass = ndata*mean_i';
%     [~,TTclass]=max(needclass,[],2);
    x2X = ndata(Tlass_k==0,:)*mean(ndata,1)';
    x2X = repmat(size(ndata,1).*x2X,1,k);
    x2A = ndata(Tlass_k==0,:)*mean_i';
    x2x = sum(ndata(Tlass_k==0,:).* ndata(Tlass_k==0,:),2);
    x2x = repmat(x2x,1,k);
%     needclass = x2X - 2*x2A-x2x;
    n_A = repmat(n_Ai,size(ndata(Tlass_k==0,:),1),1);
    needclass = (x2X - 2*x2A-x2x)./n_A;
    [~,aha]=min(needclass,[],2);

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