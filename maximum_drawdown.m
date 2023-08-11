function [maxd]=maximum_drawdown(A,w,s,T,M,maxd)
r=s+T;
B=(A(r-1,1).*w-A(r,1).*w)/A(r-1,1);
maxd(1,s)=max(B);
end