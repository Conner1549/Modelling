function [ow]=original(A,s,T)
A=A(s:s+T-1,:);
A=A-ones(size(A));
r=mean(A);
r=r';
rp=mean(r);
A=cov(A);
[m,n]=size(A);
a=ones(n,1);
ow1=((a'*inv(A)*a*rp-a'*inv(A)*r)/(r'*inv(A)*r*a'*inv(A)*a-(a'*inv(A)*r)^2))*inv(A)*r;
ow2=((r'*inv(A)*r-a'*inv(A)*r*rp)/(r'*inv(A)*r*a'*inv(A)*a-(a'*inv(A)*r)^2))*inv(A)*a;
ow=ow1+ow2;
end
