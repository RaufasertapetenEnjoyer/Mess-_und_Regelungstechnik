function dist = measuredist(v1, v2)
    %dist = random(gmdistribution(1.5, 0.1)) * norm(v1.Position - v2.Position);
    off=5;
    std=5;
    dist = off+randn*std + norm(v1.Position - v2.Position);

end