xSpanne = -1:0.2:1;
plot(xSpanne, f1(xSpanne), 'Marker','square','LineStyle',':','Color',[1 0 0]);
% Legend

% Create ylabel
ylabel('y-Achse');

% Create xlabel
xlabel('x-Achse');

% Create title
title('Aufgabe3');

hold on;

plot(xSpanne, f2(xSpanne),'Marker','o','LineStyle','--','Color',[0 1 0]);

hold on;

xSpanne = linspace(-1,1,50);
plot(xSpanne, f3(xSpanne),'Marker','+','Color',[1 1 0]);

legend('f(x) = 1/x^2', 'f2(x) = x^3', 'f(x) = cos(x)^4');

hold on;