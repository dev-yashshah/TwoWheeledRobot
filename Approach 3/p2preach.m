function [modes, duration]= p2preach(robot,target_x, target_y)
    % Step 1: verifying if we need to make a turn
    
    heading_vector = [cos(robot.theta), sin(robot.theta)];
    vector_cur_pos_to_target_pos= [target_x - robot.x , target_y - robot.y];
    
    b=0;
    v1 = [cos(robot.theta), sin(robot.theta)];
    v2 = [target_x - robot.x, target_y - robot.y];
    
    if v1(1)*v2(1) > 0 && v1(2)*v2(2) > 0
        r1 = v1(1)/v2(1);
        r2 = v1(2)/v2(2);
        
        tol = 1e-12;
        
        if r1 - r2 >= -tol && r1 - r2 <= tol
            b = 1;
        end
    end
    
    if b>0
        modes=[0];
        duration=[norm(vector_cur_pos_to_target_pos,2)/(robot.R * robot.w)];
    else
        b = heading_vector(2);
        a = heading_vector(1);
        line_eq=b*(target_x-robot.x) - a*(target_y-robot.y);
        
        if line_eq<0
            xc = robot.x + robot.L/2 * cos(robot.theta + pi/2);
            yc = robot.y + robot.L/2 * sin(robot.theta + pi/2);
            
            beta = acos( (robot.L/2) / (norm([target_x - xc, target_y - yc], 2)) );
            
            v1 = [robot.x - xc, robot.y - yc];
            v2 = [target_x - xc, target_y - yc];
            
            alpha = acos( (v1(1)*v2(1) + v1(2)*v2(2)) / ( norm(v1,2) * norm(v2,2)) );
            
            tmp = v1(1)*v2(2) - v1(2)*v2(1);
            
            if(tmp < 0)
                deltaTheta = 2*pi - alpha - beta;
            else
                deltaTheta = alpha - beta;
            end
            
            t_l = deltaTheta / ((robot.R / robot.L) * robot.w);
            
            tmp2 = robot.theta + deltaTheta - pi/2;
            pos_after_turn = [xc + robot.L/2 * cos(tmp2), yc + robot.L/2 * sin(tmp2)];
            t_s = norm([pos_after_turn(1) - target_x, pos_after_turn(2) - target_y],2) / (robot.R * robot.w);
            
            modes = [1, 0];
            duration = [t_l, t_s];

        else
            xc = robot.x + robot.L/2 * cos(robot.theta - pi/2);
            yc = robot.y + robot.L/2 * sin(robot.theta - pi/2);
            
            beta = acos( (robot.L/2) / (norm([target_x - xc, target_y - yc], 2)) );
            
            v1 = [robot.x - xc, robot.y - yc];
            v2 = [target_x - xc, target_y - yc];
            
            alpha = acos( (v1(1)*v2(1) + v1(2)*v2(2)) / ( norm(v1,2) * norm(v2,2)) );
            
            tmp = v1(1)*v2(2) - v1(2)*v2(1);
            
            if(tmp >= 0)
                deltaTheta = 2*pi - alpha - beta;
            else
                deltaTheta = alpha - beta;
            end
            
            t_r = deltaTheta / ((robot.R / robot.L) * robot.w);
            
            tmp2 = robot.theta - deltaTheta + pi/2;
            pos_after_turn = [xc + robot.L/2 * cos(tmp2), yc + robot.L/2 * sin(tmp2)];
            t_s = norm([pos_after_turn(1) - target_x, pos_after_turn(2) - target_y],2) / (robot.R * robot.w);
            
            modes = [2, 0];
            duration = [t_r, t_s];
        end
    end
end
