function [wa,wau,wad]=cacl(covm,A,count,X,t)
X1=cov(X);
[m,n]=size(A);
sen1=zeros(1,32);
sen2=zeros(1,32);
rp=zeros(n,1);
rou=zeros(1,1000);
a=ones(n,1);
[mc,nc]=size(count);
count1=count;
w=ones(n,1);
w=w./n;
y=ones(n+4,1);
y=y./(n+4);
for j=1:n
    rp(j,1)=sum(A(:,j))/m;
end
R=sum(rp)/n;
B=[rp';a'];
b=[R;1];
D=[B;-B;eye(n)];
d=[b;-b;zeros(n,1)];
L1=2*norm(covm);
beta=0.9*(2/L1);
omiga=0.9*(2*(2-beta*L1))/(4*beta*(norm(D)^2)+L1*(2-beta*L1));
for i=1:1000
    wb=w;
    w=w-beta*(2*covm*w+D'*y);
    y1=(y/omiga)+D*(2*w-wb);
    y=omiga*(y1-max(y1,d));
end
wa=zeros(n+mc,1);
mci=0;
tf=isempty(count);
a=0;
for s=1:n+mc
    if tf == 1
        wa=w;
    else
        if s<count(mci+1,1)
            wa(s,1)=w(s-a,1);
        else
            mci=mci+1;
            a=a+1;
            wa(s,1)=0;
            if mci+1>mc
                mci=mc-1;
                count(mc,1)=99999;
            end
        end
    end
end
bu=[R;1.1];
bd=[R;0.9];
du=[bu;-bu;zeros(n,1)];
dd=[bd;-bd;zeros(n,1)];
count=count1;
for i=1:1000
    wb=w;
    w=w-beta*(2*covm*w+D'*y);
    y1=(y/omiga)+D*(2*w-wb);
    y=omiga*(y1-max(y1,du));
end
wau=zeros(n+mc,1);
mci=0;
tf=isempty(count);
a=0;
for s=1:n+mc
    if tf == 1
        wau=w;
    else
        if s<count(mci+1,1)
            wau(s,1)=w(s-a,1);
        else
            mci=mci+1;
            a=a+1;
            wau(s,1)=0;
            if mci+1>mc
                mci=mc-1;
                count(mc,1)=99999;
            end
        end
    end
end
for i=1:1000
    wb=w;
    w=w-beta*(2*covm*w+D'*y);
    y1=(y/omiga)+D*(2*w-wb);
    y=omiga*(y1-max(y1,dd));
end
wad=zeros(n+mc,1);
mci=0;
tf=isempty(count);
a=0;
count=count1;
for s=1:n+mc
    if tf == 1
        wad=w;
    else
        if s<count(mci+1,1)
            wad(s,1)=w(s-a,1);
        else
            mci=mci+1;
            wad(s,1)=0;
            a=a+1;
            if mci+1>mc
                mci=mc-1;
                count(mc,1)=99999;
            end
        end
    end
end
end