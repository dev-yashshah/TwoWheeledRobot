start_points=[
    0 0;
    -1 2;
    -2 -1;
    -5 -1;
    0 0;
    0 0;
    ];

heading_angles=[ 3*pi/4; pi; 5*pi/4; pi/4; pi/2; pi/4 ];
destinations={
    {-3 3},...
    {2 -3},...
    {2 3},...
    {-4 -1},...
    {1 -2},...
    {1,1; 2,0; 3,1; 5,1; 6,0; 7,2; 8,1}...
    };

r=0.2;
l=1;
w=pi;

for i=1:size(start_points)
    drawPath(start_points(i,:),heading_angles(i,:),destinations{1,i},r,l,w)
    pause;
    close all
end