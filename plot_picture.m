function plot_picture(t,cw,cwu,cwd,maxd,sr,cwow)
figure
plot(t,cw)
xlabel('time(day)')
ylabel('y times more than the initial value')
hold on
plot(t,cwu)
xlabel('time(day)')
ylabel('y times more than the initial value')
plot(t,cwd)
xlabel('time(day)')
ylabel('y times more than the initial value')
plot(t,cwow)
xlabel('time(day)')
ylabel('y times more than the initial value')
figure
plot(t,maxd)
xlabel('time(day)')
ylabel('maximum drawdown per day')
figure
plot(t,sr)
xlabel('time(day)')
ylabel('sharpe ratio')
figure
plot(t,cwow)
xlabel('time(day)')
ylabel('y times more than the initial value')
hold on
plot(t,cw)
xlabel('time(day)')
ylabel('y times more than the initial value')
end

