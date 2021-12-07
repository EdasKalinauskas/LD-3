clear all
clc

x = linspace(0.1,1,20);
d = ((1 + 0.6 * sin (2 * pi * x / 0.7)) + 0.3 * sin (2 * pi * x)) / 2;
% atsitiktiniai w1 w2 b
w1=randn(1);
w2=randn(1);
b = rand (1);
n=0.1;
% pasirenkam c1 c2 fi1 fi2
c1 = 0.2;
c2 = 0.9;
sigma1=0.2;
sigma2=0.2;

% [reiksmes vieta] = findpeaks(d)
% c1=x(vieta (1))
% c2=x(vieta (2))
% 
% for in=1:1:length(x)
%     if x(in)<(in+1)
%     min=x(in+1)
%     else 
%         continue
%     end
% end
for ind = 1:100 
for i=1:1:length(x)
fi1(i) = exp(-((x(i)-c1)^2)/(2*sigma1^2));
fi2(i) = exp(-((x(i)-c2)^2)/(2*sigma2^2));
y(i) = fi1(i)*w1 + fi2(i)*w2+b;
e=d(i)-y(i);
w1 = w1+n*e*fi1(i);
w2 = w2+n*e*fi2(i);
b = b+n*e;
end
end
for i=1:1:length(x)
y(i) = fi1(i)*w1 + fi2(i)*w2+b;
end
figure, plot (x,d,x,y)
