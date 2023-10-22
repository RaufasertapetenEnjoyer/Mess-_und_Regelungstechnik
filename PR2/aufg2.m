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
type=1;% 2 3

[XY]=generateMeasurements(numSamples,type);

 % Mittelwert, Kovarianzmatrix und Korrelationskoeffizient berechnen

 
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
