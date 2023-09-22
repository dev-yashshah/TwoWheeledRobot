robot = TwoWheeledRobot(0, 0, pi/4, 1, pi, 1);
 
modes = ["straight", "left", "straight", "right","straight", "left", "straight", "right", "straight"];
durations = [2, 1, 2, 1, 2, 1, 2, 1, 2];

for i=1:numel(modes)
    if modes(i) == "straight"
        robot.run(0,durations(i))
    elseif modes(i) == "left"
        robot.run(1,durations(i))
    elseif modes(i) == "right"
        robot.run(2,durations(i))
    end
end
axis equal;
robot.info()