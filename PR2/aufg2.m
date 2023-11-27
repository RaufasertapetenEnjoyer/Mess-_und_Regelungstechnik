function aufg2()
close all
clear all

% Anzahl der Messwerte
numSamples=100;

% Hier werden Messwerte simuliert
% Die Messreihe wird mit einer Normalverteilung generiert 
% FORMAT
% XY = [x1, y1;
%       x2, y2;
%       ....]
type = 3; % 1 2 3

[XY]=generateMeasurements(numSamples,type);

 % Mittelwert, Kovarianzmatrix und Korrelationskoeffizient berechnen

 %Aufgabe 2.1
 %Bei Type 1 sind die Werte rund um den wahren Wert kreisförmig verteilt. Es
 %kann nicht wirklich eine Abhängigkeit erahnt werden, weil die Werte mal
 %positiv/positiv, positiv/negativ etc. sind, desweitern sind die Werte
 %zueinander immer unterscheidlich groß nicht das doppelte oder ähnliches.

 %Bei Type 2 sind die Werte wie eine steigende Gerade um den wahren Wert verteilt. Es
 %kann eine Abängigigkeit erahnt werden, weil die Werte teilweise sehr nah
 %aneinander sind (annähernd gleich und selbes Vorzeichen).

 %Bei Type 3 sind die Werte wie eine fallende Gerade um den wahren Wert verteilt. Es
 %kann eine Abängigigkeit erahnt werden, weil die Werte teilweise sehr nah
 %aneinander sind (annähernd gleich), hier haben die Werte aber ein
 %entgegengesetztes Vorzeichen.


 %Aufgabe 2.2
 mu = mean(XY);
 C = cov(XY);

 disp("Die Mittelwerte betragen: ");
 disp("meanX = " + mu(1));
 disp("meanY = " + mu(2));
 
 disp("Die Kovarianzmatrix lautet: ");
 disp(C);

 %Elemente auf der Diagonalen sind die Varianzen von X und Y
 %(sum(xi-meanX)^2 * 1/n)
 %Elemente auf der Gegendiagonales sind die Kovarianzen
 %positiver Wert = tendentielle Variation in selbe Richtung
 %negativer Wert = tendentielle Variation in entgegengesetzte Richtung


 %Audgabe 2.3
 X = [XY(1:100,1)];
 Y = [XY(1:100,2)];

 [XY2]=generateMeasurements(numSamples,2);
 [XY3]=generateMeasurements(numSamples,3);

 corrKoeff = correlation(X,Y);
 disp("Der Korrelationskoeffizient für Typ1 beträgt: ");
 disp(corrKoeff);
 disp(C);

 corrKoeff = correlation(XY2(1:100,1), XY2(1:100,2));
 disp("Der Korrelationskoeffizient für Typ2 beträgt: ");
 disp(corrKoeff);
 C = cov(XY2);
 disp(C);

 corrKoeff = correlation(XY3(1:100,1), XY3(1:100,2));
 disp("Der Korrelationskoeffizient für Typ3 beträgt: ");
 disp(corrKoeff);
 C = cov(XY3);
 disp(C);

 %Möglicher Zusammenhang zwischen Kovarianzmatrix und
 %Korrelationkoeffizient: Vorzeichen Koeffizient = Vorzeichen Werte 
 %Gegendiagonale der Matrix, sprich Zussammenhang zwischen
 %Korrellationskoeffizienz und Kovarianz
 %je größer der Betrag der Werte auf Gegendiagonalen, desto größer die
 %Koeffizienten (oder anders herum) 


 % Zeichnen der Messwerte
 plot(XY(:,1), XY(:,2), 'LineStyle', 'none','Marker', '.','Color', 'g','MarkerSize',20,'DisplayName', 'Messwerte');
 hold on
 plot(0,0, 'LineStyle', 'none','Marker', '.','Color', 'r','MarkerSize',20,'DisplayName', 'Wahrer Wert');
 xlabel('x')
 ylabel('y')
 axis square
 xlim([-1 1])
 ylim([-1 1])
 legend show


end

function [XY,C_GroundTruh]=generateMeasurements(numSamples,type)

mu=[0;0];

switch type
    case 1
    % standard deviation
    s1=0.2;
    s2=0.2;
    % correlation coefficient
    rho=0.0;

    case 2
        
    % standard deviation
        s1=0.2;
        s2=0.2;
    % correlation coefficient
        rho=0.9;
        
    otherwise
    % standard deviation
        s1=0.2;
        s2=0.2;
    % correlation coefficient
        rho=-0.9;
end
%covariance matrix
C=[s1^2, rho*s1*s2;
    rho*s1*s2, s2^2];

if(0)
% cholesky decomposition for geneneration of correlated noise
[L,p] = chol(C,'lower');

% random gaussian noise with variance 1
xy=randn(2,numSamples);

% apply transformation to gaussian noise and add mean value
XY=L*xy+repmat(mu,1,numSamples);
else
% Calc Eigenvectors und Eigenvalues for geneneration of correlated noise
[V,D] = eig(C);

% random gaussian noise with variance 1
xy=randn(2,numSamples);
xy=repmat([sqrt(D(1,1));sqrt(D(2,2))],1,numSamples).*xy
% apply transformation to gaussian noise and add mean value
XY=V*xy+repmat(mu,1,numSamples);
end

C_GroundTruh=C; 
XY=XY';
end
