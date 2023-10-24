function output = correlation(x,y)
meanX = mean(x);
meanY = mean(y);

numerator = 0;
sum1 = 0;
sum2 = 0;

for i = 1 : length(x)
    numerator = numerator + (x(i) - meanX) .* (y(i) - meanY);
    sum1 = sum1 + (x(i) - meanX).^2;
    sum2 = sum2 + (y(i) - meanY).^2;
end

denominator = sqrt(sum1 .* sum2);

output = numerator ./ denominator;

end