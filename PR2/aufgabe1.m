% 1
W = [1/12, 1/12, 1/12, 1/12, 1/6, 1/6];
bar(W);
ylabel('Wahrscheinlichkeit');
xlabel('Augenzahl');
title('Würfelwurf');

% 2
disp('Summe aller Wahrscheinlichkeiten: ');
disp(sum(W));

% 3
if (sum(W) ~= 1)
    disp('Es handelt sich nicht um eine Wahrscheinlichkeitsverteilung. Anpassungen werden vorgenommen.');
    W(1, 6) = W(1, 6) + (1 - sum(W));
    disp(W);
else
    disp('Es handelt sich um eine Wahrscheinlichkeitsverteilung.');
end

% 4
n = 10;
a = 0;
for i = 1 : n
    zahl = wuerfelexperiment(W);
    a = a + zahl;
    disp(zahl);
end

% 5
r = a / n;
disp('Relative Häufgkeit: ');
disp(r);

