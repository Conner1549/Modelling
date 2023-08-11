function asset_allocation
global M N T i;
load('FRENCH32.mat','data');
[M,N]=size(data);
omiga=ones(N,1);
input_request='please enter a number for time window: ';
T=input(input_request);
i=1;
t=1:M-T;
cw=ones(1,M-T);
cwu=ones(1,M-T);
cwd=ones(1,M-T);
cwow=ones(1,M-T);
maxd=zeros(1,M-T);
sr=zeros(1,M-T);
for s=1:M-T
[ow]=original(data,s,T);
[A,omiga,count,X]=pretreatment(data,N,T,s,omiga);
covm=cov(A);
[omiga,wau,wad]=cacl(covm,A,count,X,s);
[maxd]=maximum_drawdown(data,omiga,s,T,M,maxd);
[sr]=sharpe_ratio(data,s,omiga,N,M,T,sr);
[cw,cwu,cwd,cwow]=cumulative_wealth(s,M,T,data,omiga,cw,wau,cwu,wad,cwd,cwow,ow);
end
plot_picture(t,cw,cwu,cwd,maxd,sr,cwow);
mmaxd=sum(maxd)/(M-T-14);
end