clear all; clc;close all;


%% Simulating Dynamics for 4 agents and leader
[t,Zdot] = ode23('formationcontrol',[0:0.01:50],[2*rand(8,1);2*rand(8,1);zeros(2,1);ones(2,1)]);

%% Positions of the agents and leader
figure;
plot(Zdot(:,1),Zdot(:,2))       %agent1
hold on
plot(Zdot(:,5),Zdot(:,6))       %agent2
plot(Zdot(:,9),Zdot(:,10))      %agent3
plot(Zdot(:,13),Zdot(:,14))     %agent4
plot(Zdot(:,17),Zdot(:,18))     %Leader


grid on;
title('Positions of agents and leader')
xlabel('x');ylabel('y');

p1 = plot(Zdot(:,1),Zdot(:,2),'s');
p2 = plot(Zdot(:,5),Zdot(:,6),'s');
p3 = plot(Zdot(:,9),Zdot(:,10),'s');
p4 = plot(Zdot(:,13),Zdot(:,14),'s');
p = plot(Zdot(:,17),Zdot(:,18),'o','MarkerFaceColor',[0.91 0.41 0.17]);
legend('1','2','3','4','Leader')
hold off
%% Plot Animations
for k = 1:size(t,1)
 p1.XData = Zdot(k,1);
 p1.YData = Zdot(k,2);
 p2.XData = Zdot(k,5);
 p2.YData = Zdot(k,6);
 p3.XData = Zdot(k,9);
 p3.YData = Zdot(k,10);
 p4.XData = Zdot(k,13);
 p4.YData = Zdot(k,14);
 p.XData = Zdot(k,17);
 p.YData = Zdot(k,18);

 drawnow limitrate
 
end
drawnow
%% Velocities of agents and leader
figure;
plot(Zdot(:,3),Zdot(:,4))       %agent1
hold on
plot(Zdot(:,7),Zdot(:,8))       %agent2 
plot(Zdot(:,11),Zdot(:,12))     %agent3
plot(Zdot(:,15),Zdot(:,16))     %agent4
plot(Zdot(:,19),Zdot(:,20))     %Leader
legend('1','2','3','4','Leader')
grid on;
title('Velocities of agents and Leader')
xlabel('V_x');ylabel('V_y');

%% Leader Position Phase Plot
figure
plot(Zdot(:,17),Zdot(:,18))
title('Leader position');
xlabel('x');ylabel('y');
