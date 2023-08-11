function [cw,cwu,cwd,cwow]=cumulative_wealth(s,M,T,data,w,cw,wau,cwu,wad,cwd,cwow,ow)
cw(1,s)=cw(1,s)*(1+(data(s+T,:)-1)*w);
if s<M-T
    cw(1,s+1)=cw(1,s);
end
cwu(1,s)=cwu(1,s)*(1+(data(s+T,:)-1)*wau);
if s<M-T
    cwu(1,s+1)=cwu(1,s);
end
cwd(1,s)=cwd(1,s)*(1+(data(s+T,:)-1)*wad);
if s<M-T
    cwd(1,s+1)=cwd(1,s);
end
if cwow(1,s)>=0
    cwow(1,s)=cwow(1,s)*(1+(data(s+T,:)-1)*ow);
else
    cwow(1,s)=cwow(1,s)+((data(s+T,:)-1)*ow)*abs(cwow(1,s));
if s<M-T
    cwow(1,s+1)=cwow(1,s);
end
end