[X,Y] = meshgrid(-pi:0.1:pi);
Z = cos(X) * sin(Y)';


subplot(1, 2, 1);

surf(X,Y,Z);

% Create title
title('Aufgabe4');

% Create subtitle
subtitle('surf');

% Create ylabel
ylabel('y-Achse');

% Create xlabel
xlabel('x-Achse');

% Create zlabel
zlabel('z-Achse');


subplot(1, 2, 2);

surfc(X,Y,Z);

% Create subtitle
subtitle('surfc');

% Create ylabel
ylabel('y-Achse');

% Create xlabel
xlabel('x-Achse');

% Create zlabel
zlabel('z-Achse');