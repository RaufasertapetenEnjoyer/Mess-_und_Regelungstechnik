% arg0: # of Samples
% arg1: vector of (ideal) distances 
% arg2 (optional): bool flag to toggle visualization

function Z = measure(varargin)

    % extract params
	samples = varargin{1};
    ideal_distances = varargin{2};
    if nargin >= 3
        visualise = varargin{3};
    else
        visualise = true;
    end
    
    % fixed config
    sample_rate = 50; % [hz]
    velocity = 10; % [m/s]
    pad = 10; % [m]
    
    pause_scale = 0.1; % [s]
    sleep = 1; % [s]
    
    % config
    duration = samples / sample_rate; % [s]
    track_length = velocity * duration; % [m]

    % calcs 
    Z = zeros(samples, length(ideal_distances));

    figure;
    valueaxes = gca;
    if visualise
        figure;
        scenarioaxes = gca;
        
        scenario = drivingScenario('SampleTime', 1 / sample_rate);

        roadCenters = [ -pad 0; track_length + max(ideal_distances) + pad 0]; % [m]
        road(scenario, roadCenters, 'lanes', lanespec([1 2]));
        
        egoCar = vehicle(scenario);
        otherCar = vehicle(scenario);
        
        plot(scenario,'Parent', scenarioaxes);
        ylim(scenarioaxes, [-10 10]);
        view(scenarioaxes, 33, 33);
    end

    for m = 1:length(ideal_distances)

        cla(valueaxes);
    
        ideal_distance = ideal_distances(m); % [m]
        
        if visualise
            egoTrajectory = [ 0 0; track_length 0];
            otherTrajectory = egoTrajectory + [ ideal_distance 0 ];

            trajectory(egoCar, egoTrajectory, velocity);
            trajectory(otherCar, otherTrajectory, velocity);
            
            restart(scenario);
        end

        measure = animatedline(valueaxes, 'Marker', 'x', 'LineStyle', 'none');
        ideal = animatedline(valueaxes, 'Color', 'g');
        xlabel('Zeit in Sekunden');
        ylabel('Abstand in Meter');
        xlim(valueaxes, [0, duration]);
        ylim(valueaxes, [0, 4 * ideal_distance]);
        legend(valueaxes, 'Messwert', 'Wahrer Wert');

        pause(sleep)
        for step = 1:samples
            time = step / sample_rate;
            
            measure_dist = moddist(ideal_distance);
            
            addpoints(ideal, time, ideal_distance);
            addpoints(measure, time, measure_dist);
            
            if visualise
                advance(scenario);
                ylim(scenarioaxes, [-10 10]);
            end
            
            if visualise
                pause(1 / sample_rate * pause_scale);
            end
        end
        pause(sleep)

        [~, Z(:,m)] = getpoints(measure);

    end
end