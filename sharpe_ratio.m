function [sr]=sharpe_ratio(A,s,w,n,M,T,sr)
A=A-ones(size(A));
for j=1:n
    r(j,1)=sum(A(s:s+T-1,j))/T;
end
r1=r'*w;
r2=r.*w;
r3=mean(r2);
r4=0;
for k=1:n
    r4=r4+(r2(k,1)-r3)^2;
end
r4=r4/(n-1);
sr(1,s)=r1/sqrt(r4);
end