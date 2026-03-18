x=0.001:0.05:4;
[0.001, 4.0]

y=log(x) - x + 2;

plot(x,y);
hold on;
plot(x,0*y,'r-');
grid on;

x=fzero('y',[0.1 0.5]);
[x y(x)]
x=fzero('y',[3.00 3.50]);
[x y(x)]
x=fsolve('y',[0.1 3.5]);
[x y(x)]
