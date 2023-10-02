%Aufgabe1
A = zeros(5,6);
A(1:2,1:2) = ones(2);
A(3:5,1:3) = 5;
A(3:5,4:6) = diag([1,2,3]);
A(3:5,4:6) = fliplr(A(3:5,4:6));
A(1:2,5:6) = zeros(2);
A(1:2,3:4) = diag([4,3]);
disp('Die zu erzeugende Matrix.');
disp(A);

%Aufabe2
%1.
indexe = 2:2:size(A,2);
abstract = A(:,indexe);
disp('Die abstrahierte Matrix, wenn man nur jede 2. Stelle beachtet.');
disp(abstract);

%2.
indexeSpalten = 3:1:5;
indexeZeilen = 2:1:4;
unterMatrix = A(indexeZeilen,indexeSpalten);
disp('Die zu extrahierende Untermatrix.');
disp(unterMatrix);

%3.
%Spaltenweise, sprich bei einer 3x3 Matrix, wäre A(1) das erste, A(3) das Elmement an der Stelle (3,1),
%A(4) das Element an der Stelle (1,2) und A(9) das letzte Element

%4.
%4 0 5 5 5