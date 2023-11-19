function modDistance = moddist(distance)
    %modDistance = random(gmdistribution(1.5, 0.1)) * distance;
    %function dist = measuredist(v1, v2)
    %dist = random(gmdistribution(1.5, 0.1)) * norm(v1.Position - v2.Position);
    off=5;
    std=5;
    dist = off+randn*std + norm(distance);
    modDistance = 0.25 * dist^1.44;
end