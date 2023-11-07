function t = calculateT(p, n)
t = abs(tinv((1 - p./100) / 2, n - 1));
end