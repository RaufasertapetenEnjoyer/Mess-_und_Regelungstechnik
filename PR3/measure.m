function Z = measure(samples, ideal_distance)

sample_rate = 50; % [hz]
duration = (samples) / sample_rate; % [s]

velocity = 10; % [m/s]
track_length = velocity * duration; % [m]
gap = ideal_distance; % [m]

pad = 10;

scenario = drivingScenario('SampleTime', 1 / sample_rate);
roadCenters = [ -pad 0; track_length + gap + pad 0]; % [m]
road(scenario, roadCenters, 'lanes', lanespec(2));

egoCar = vehicle(scenario);
otherCar = vehicle(scenario);

egoTrajectory = [ 0 0; track_length 0];
otherTrajectory = egoTrajectory + [ gap 0 ];

trajectory(egoCar, egoTrajectory, 10);
trajectory(otherCar, otherTrajectory, 10);

figure;
measure = animatedline('Marker', 'x', 'LineStyle', 'none');
ideal = animatedline('Color', 'g');
xlabel('Zeit in Sekunden');
ylabel('Abstand in Meter');
xlim([0, duration]);
ylim([0, 2.5 * ideal_distance]);
legend('Messwert', 'Wahrer Wert');

plot(scenario);
ylim([-10 10]);
view(33, 33);

pause(2)
running = true;
while running
    dist = measuredist(egoCar, otherCar);
    
    addpoints(measure, scenario.SimulationTime, dist);
    addpoints(ideal, scenario.SimulationTime, ideal_distance);

    pause(1 / sample_rate);
    
    running = advance(scenario);
    ylim([-10 10]);
end
pause(2)

[~, Z] = getpoints(measure);
Z=Z(1:samples);
% close

end