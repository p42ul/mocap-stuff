% MoCap Animate
% Paul Buser (2022)
% The MCT for Matlab had very slow animation, so I made my own.

clear;

fp = 'walk_example.c3d';
mc = mcread(fp);

% Read the X, Y, and Z data by skipping intervals of 3.
X = mc.data(:, 1:3:end);
Y = mc.data(:, 2:3:end);
Z = mc.data(:, 3:3:end);

framerate = 1 / mc.freq;

% Create our initial plot.
p = plot3(X(1, :), Y(1, :), Z(1, :), '.');

% Set the min and max of our 3D graph so it doesn't jump around.
xlim([min(min(X)), max(max(X))]);
ylim([min(min(Y)), max(max(Y))]);
zlim([min(min(Z)), max(max(Z))]);

% Animate.
pause('on');
for frame = 2:length(X)
    set(p, 'XData', X(frame, :));
    set(p, 'YData', Y(frame, :));
    set(p, 'ZData', Z(frame, :));
    drawnow;
    pause(framerate);
end
