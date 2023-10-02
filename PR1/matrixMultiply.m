function [A] = matrixMultiply(B, C)
if (size(B,2) == size(C,1))
    length = size(B,2);
    sumVektor = zeros(1, length);

    A = zeros(size(B,1), size(C,2));
    %Gehe durch die Zeilen der ersten Matrix B, size(B,1) = Anzahl der
    %Zeilen von Matrix B
    for i = 1 : size(B,1)
        %Gehe durch die Spalten der zweiten Matrix C, size(C,2) = Anzahl
        %der Spalten
        for h = 1 : size(C,2)
            counter = 1;

            %Summiere die Werte der Zeilen von B multipliziert mit den
            %Werten der Spalten von C
            for j = 1 : length
                    sumVektor(counter) = B(i,j) .* C(j,h);
                    counter = counter + 1;
            end

            A(i,h) = sum(sumVektor);
            sumVektor = zeros(1,size(B,1));
            counter = 0;
        end
    end
else
    printf("Die Matrizen können nicht multipliziert werden, da die Anzahl der Zeilen von B nicht mit der Anzahl der Spalten von C übereinstimmen");
end
end