B = [1,4,2;2,10,1];
C = [22,0;0,11;2,1];

A1 = matrixMultiply(B,C);

A2 = B*C;

if(A1 == A2)
    disp("Die beiden Matrizen sind identisch!");
    disp(A1);
    disp(A2);
end