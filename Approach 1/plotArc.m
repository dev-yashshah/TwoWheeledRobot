function plotArc(xc, yc, radius, start_rad, end_rad)

theta = start_rad:0.01:end_rad;

x = xc + radius * cos(theta);
y = yc + radius * sin(theta);

plot(x, y, 'linewidth', 3, 'color', 'r');
hold on;


end