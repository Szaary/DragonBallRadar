function dragonBallRadar(isSound)
% is sound 0 - false, 1 true
% inspiration from: https://gist.github.com/moorepants/1007366/46b4a5a7b93ba4b2e9ed6df75bbe491368ef36c1
% autors: Michał Karcz, Filip Pita
if(isSound == 1 | isSound == 0)

t = 0:0.015:1000;
x = cos(t);
y = sin(t);

fig = figure();
ax = axes();
S(1) = load('splat');


hold on
% points distance from center
dot0Distance=0.01;
dot1Distance=0.25;
dot2Distance=0.5;
dot3Distance=0.75;
dot4Distance=1;
dot5Distance=1.25;

% distance between same type points
distanceToSecondPoint=10;
distanceToThirdPoint=20;

% dragon ball
dotBall = plot(x(1), y(1));
rmin=0.2;
rmax=1.5;
markerSize=50;


% first radar dot points
dot0 = plot(dot0Distance * x(1), dot0Distance  * y(2));
dot1 = plot(dot1Distance * x(1), dot1Distance  * y(2));
dot2 = plot(dot2Distance * x(1), dot2Distance  * y(2));
dot3 = plot(dot3Distance * x(1), dot3Distance  * y(2));
dot4 = plot(dot4Distance * x(1), dot4Distance  * y(2));
dot5 = plot(1.25 * x(1), 1.25 * y(2));

% second and third radar line
dot11 = plot(dot1Distance * x(1), dot1Distance  * y(2));
dot12 = plot(dot1Distance * x(1), dot1Distance  * y(2));

dot21 = plot(dot2Distance * x(1), dot2Distance  * y(2));
dot22 = plot(dot2Distance * x(1), dot2Distance  * y(2));

dot31 = plot(dot3Distance * x(1), dot3Distance  * y(2));
dot32 = plot(dot3Distance * x(1), dot3Distance  * y(2));

dot41 = plot(dot4Distance * x(1), dot4Distance  * y(2));
dot42 = plot(dot4Distance * x(1), dot4Distance  * y(2));

dot51 = plot(dot5Distance * x(1), dot5Distance  * y(2));
dot52 = plot(dot5Distance * x(1), dot5Distance  * y(2));

hold off

% size of points
set([dot0, dot1, dot2, dot3, dot4, dot5], 'Marker', '.', 'MarkerSize', 20)
set([dot51, dot41, dot31, dot21, dot11], 'Marker', '.', 'MarkerSize', 8)
set([dot52, dot42, dot32, dot22, dot12], 'Marker', '.', 'MarkerSize', 2)

% points colors
set([dot0, dot1, dot2, dot3, dot4, dot5, dot51, dot41, dot31, dot21, dot11, dot52, dot42, dot32, dot22, dot12], 'Color', '#81E553')
set(dotBall, 'Color', '#EDB120')



% drawing radar
axis([-2, 2, -2, 2])

radious3 = 2
rectangle('Position',[0-radious3 0-radious3 2*radious3 2*radious3], ...
           'Curvature',[1 1], 'LineWidth', 72, EdgeColor='w');


radius  = 1.5;
rectangle('Position',[0-radius 0-radius 2*radius 2*radius], ...
           'Curvature',[1 1], 'LineWidth', 10, EdgeColor='#CDCDCD');
axis equal

radious2 = 0.2;
rectangle('Position',[0-radious2 1.8-radious2 2*radious2 2*radious2], ...
           'Curvature',[1 1], 'LineWidth', 5, EdgeColor='#CDCDCD', FaceColor='#C3C6C2');


set(gca,'color','#122C05')


% drawing points
for i = 1:length(t)      
    set(dot0, 'XData', dot0Distance *x(i), 'YData', dot0Distance *y(i))  
    set(dot1, 'XData', dot1Distance *x(i), 'YData', dot1Distance *y(i))
    set(dot2, 'XData', dot2Distance *x(i), 'YData', dot2Distance *y(i))
    set(dot3, 'XData', dot3Distance *x(i), 'YData', dot3Distance *y(i))
    set(dot4, 'XData', dot4Distance *x(i), 'YData', dot4Distance *y(i))
    set(dot5, 'XData', dot5Distance *x(i), 'YData', dot5Distance *y(i))

    if(i>distanceToSecondPoint)
    set(dot51, 'XData', dot5Distance *x(i-distanceToSecondPoint), 'YData', dot5Distance *y(i-distanceToSecondPoint))
    set(dot41, 'XData', dot4Distance *x(i-distanceToSecondPoint), 'YData', dot4Distance *y(i-distanceToSecondPoint))
    set(dot31, 'XData', dot3Distance *x(i-distanceToSecondPoint), 'YData', dot3Distance *y(i-distanceToSecondPoint))
    set(dot21, 'XData', dot2Distance *x(i-distanceToSecondPoint), 'YData', dot2Distance *y(i-distanceToSecondPoint))
    set(dot11, 'XData', dot1Distance *x(i-distanceToSecondPoint), 'YData', dot1Distance *y(i-distanceToSecondPoint))
    end
    if(i>distanceToThirdPoint)
    set(dot52, 'XData', dot5Distance *x(i-distanceToThirdPoint), 'YData', dot5Distance *y(i-distanceToThirdPoint))
    set(dot42, 'XData', dot4Distance *x(i-distanceToThirdPoint), 'YData', dot4Distance *y(i-distanceToThirdPoint))
    set(dot32, 'XData', dot3Distance *x(i-distanceToThirdPoint), 'YData', dot3Distance *y(i-distanceToThirdPoint))
    set(dot22, 'XData', dot2Distance *x(i-distanceToThirdPoint), 'YData', dot2Distance *y(i-distanceToThirdPoint))
    set(dot12, 'XData', dot1Distance *x(i-distanceToThirdPoint), 'YData', dot1Distance *y(i-distanceToThirdPoint))
    end

    if(mod(i,350) == 0)
        if(isSound)
            sound(S(1).y,S(1).Fs);
        end
         r=rmin+rand(1)*(rmax-rmin);         
         set(dotBall, 'Marker', '.', 'MarkerSize', markerSize)
         set(dotBall, 'XData', r*x(i), 'YData', r*y(i))
    else 
        set(dotBall, 'Marker', '.', 'MarkerSize', 50 - mod(i,350)/10)
    end         
    drawnow
end
end
end