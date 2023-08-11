function [A,omiga,count,X]=pretreatment(data,N,T,s,omiga)
n=N;
A=data(s:s+T-1,:);
A=A-ones(size(A));
X=A;
count=zeros(n,1);
for j=1:n
    w_j=sum(A(:,j))/T;
    if w_j<0
        A(:,j)=0;
        omiga(j)=0;
        count(j,1)=j;
    else
        continue
    end
end
A(:,any(A,1)==0)=[];
count(any(count,2)==0)=[];
end