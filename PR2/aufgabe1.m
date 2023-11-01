%Aufgabe 1.1
%Mögliche Augenzahlen
X = [1,2,3,4,5,6];

%Vektor an Wahrscheinlichkeiten
W = [1./12, 1./12, 1./12, 1./12, 1./6, 1./6];

bar(X, W);
%stem(X,W);

%Aufgabe1.2
summeWahr = sum(W);

if summeWahr == 1
    disp("Die Summe der Wahrscheinlickeiten beträgt: 1. Es handelt sich um eine Wahrscheinlickeitsverteilung.");
else
    disp("Die Summe der Wahrscheinlickeiten beträgt: " + summeWahr + ". Es handelt sich nicht um eine Wahrscheinlickeitsverteilung.");
end

%Aufgabe1.3
differenz = 1 - summeWahr;

W = [1./12, 1./12, 1./12, 1./12, 1./6, 1./6 + differenz]; % oder differenz durch n (= 6) teilen und auf jede Stelle addieren
summeWahr = sum(W);

if summeWahr == 1
    disp("Die Summe der Wahrscheinlickeiten beträgt: 1. Es handelt sich um eine Wahrscheinlickeitsverteilung.");
else
    disp("Die Summe der Wahrscheinlickeiten beträgt: " + summeWahr + ". Es handelt sich nicht um eine Wahrscheinlickeitsverteilung.");
end

%Aufgabe 1.4
for i = 1 : 10
    zahl = wuerfelexperiment(W);
    disp("Die gewürfelte Zahl im " + i + ". Wurf lautet: " + zahl);
end

%Aufgabe1.5
%stichUmfang = 10;
%stichUmfang = 50;
%stichUmfang = 100;
%stichUmfang = 1000;
%stichUmfang = 10000;
stichUmfang = 100000;
stichproben = zeros(1,6);

for i = 1 : stichUmfang
    zahl = wuerfelexperiment(W);
    stichproben(1,zahl) = stichproben(1,zahl) + 1;
end

disp("Die Stichproben lauten: ");
disp(stichproben);

relHaeufig = stichproben(1:1:6) ./ stichUmfang;

disp("Die Relativen Häufigkeiten lauten: ");
disp(relHaeufig);

bar(X,relHaeufig);

%Die Werte der, aus der Stichprobe errechneten, relativen Häufigkeiten nähern
%sich den realen Werten der Wahrscheinlichkeinen an. Je größer die
%Stichprobe desto näher ist man an der realen Wahrscheinlichkeit.

