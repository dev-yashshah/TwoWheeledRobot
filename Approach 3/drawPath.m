function drawPath(start,headingAngle,destinations,R,L,W)
    robot=TwoWheeledRobot(start(1), start(2), headingAngle, R, W, L);
    for i=1:size(destinations)
        p=destinations(i,:);
        [modes, duration] = p2preach(robot, cell2mat(p(1)), cell2mat(p(2)));
        if modes(1) == 0
            robot.run( modes(1), duration(1));
        else
            robot.run( modes(1), duration(1));
            robot.run( modes(2), duration(2));
        end
    end
    axis equal;
end
