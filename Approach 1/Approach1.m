%% Basic Testing
robot=TwoWheeledRobot(0, 0, pi/4, 1, pi, 1);
robot.run(1,1);
robot.info();

%% Adding Mode
robot=TwoWheeledRobot(0, 0, pi/4, 1, pi, 1);
robot.run(0,2);
robot.run(1,0.5);
robot.run(0,1);
robot.run(2,1);
robot.run(0,2);
axis equal;
robot.info()

%%
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
%%
theta0=pi/4;
theta1 =pi/2;

r=1;

theta=theta0:0.01:theta1;

x0=0;
y0=0;

x=x0 + r * cos(theta);
y=y0 + r * sin(theta);

plot(x,y);

%%
x=0;
y=0;
L=1;
theta=pi/4;
R=1;
w=1;
t=1;
a=[x];
b=[y];
for t = 0:0.2:1
    x = x + L/2 * (sin( theta + (R/L) * w * t)-sin(theta));
    y = y + L/2 * (cos(theta) - cos( theta + (R/L) * w * t));
    a=[a,x];
    b=[b,y];
    theta=theta + (R/L) * w * t;
end
plot(a,b,'LineWidth',3);