classdef TwoWheeledRobot < handle
    properties
        x;      % x coordinate
        y;      % y coordinate
        theta;  % heading angle
        
        R;      % wheel radius
        w;      % max angular velocity of the wheels
        L;      % length of the axis
    end
    
    methods
        function robot = TwoWheeledRobot(x_pos, y_pos, heading_angle, radius, v, length)
            robot.x = x_pos;
            robot.y = y_pos;
            robot.theta = heading_angle;
            robot.R = radius;
            robot.w = v;
            robot.L = length;
        end
        
        function info(robot)
            fprintf("x-coordinate: %f\n", robot.x);
            fprintf("y-coordinate: %f\n", robot.y);
            fprintf("heading angle: %f\n", robot.theta);
            fprintf("wheel radius: %f\n", robot.R);
            fprintf("max angular velocity of wheel: %f\n", robot.w);
            fprintf("length of the axis: %f\n", robot.L);
        end
        
        function run(robot, mode, t)
            
            switch(mode)
                case 0  % going straight
                    x = robot.x + robot.R*robot.w*cos(robot.theta)*t;
                    y = robot.y + robot.R*robot.w*sin(robot.theta)*t;
                    
                    plot([robot.x, x], [robot.y, y], 'color', 'b', 'linewidth', 3,'DisplayName','Straight');
                    hold on;
                    
                    robot.x = x;
                    robot.y = y;
            
                case 1  % turning left
                    
                    
                    deltaTheta = robot.R/robot.L * robot.w * t;
                    
                    thetap = robot.theta + pi/2;
                    xc = robot.x + robot.L/2 * cos(thetap);
                    yc = robot.y + robot.L/2 * sin(thetap);
                    
                    
                    start_angle = robot.theta-pi/2;
                    end_angle = start_angle + deltaTheta;
                    
                    % plot the arc
                    plotArc(xc, yc, robot.L/2, start_angle, end_angle);
                   
                    % updating the position
                    robot.theta = robot.theta + deltaTheta;
                    tmp = robot.theta - pi/2;
                    
                    robot.x = xc + robot.L/2 * cos(tmp);
                    robot.y = yc + robot.L/2 * sin(tmp);
                    
                case 2 % right turn
                    deltaTheta = - robot.R/robot.L * robot.w * t;

                    thetap=robot.theta - pi/2;
                    xc=robot.x + robot.L/2 * cos(thetap);
                    yc=robot.y + robot.L/2 * sin(thetap);


                    startAngle=robot.theta + pi / 2;
                    endAngle=startAngle + deltaTheta;

                    %plot the arc %end angle will be greater than start
                    %angle and plotarc requires left to be greater than
                    %right.

                    plotArc(xc,yc,robot.L / 2,endAngle,startAngle);

                    %Update the values
                    robot.theta = robot.theta + deltaTheta;
                    tmp = robot.theta + pi / 2;

                    robot.x = xc + robot.L/2 * cos(tmp);
                    robot.y = yc + robot.L/2 * sin(tmp);
            end
        end
    end
end