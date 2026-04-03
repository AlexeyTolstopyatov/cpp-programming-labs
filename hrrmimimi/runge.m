% Фиксированный набор точек 
z=-1.0:0.2:1.0;
n = length(z); 
f=1.0./(1.0+25.0.*z.*z);

plot(z,f,'*');

x1 = -1.0;
n1=(n-1)*10+1;

grid on;

function v=ff(x, y, x1)
    n = length(x);
    % Многочлен сегодня
    p = 0; 
    for i = 1:n
        li = 1;
        for j = 1:n
            if i ~= j
                li = li * (x1 - x(j)) / (x(i) - x(j));
            end
        end
        % Многочлен завтра
        p = p + y(i) * li;
    end
    v=p;
end
hold off;
for i = 1:n
    v(i)=cos((2*i-1)/(2*n)*pi);
    y1(i)=1.0./(1.0+25.0.*v(i).*v(i));
end

x1 = -1.0;

for i = 1:n1 
    x3(i)=x1;
    p3(i) = ff(v, y1, x1); 
    y3(i) = 1.0./(1.0+25.0.*x1.*x1); 
    x1=x1+0.02; 
end

plot(v,y1,'*'); 
grid on;
hold on;
plot(x3,p3,'r-');
plot(x3,y3,'g-');

