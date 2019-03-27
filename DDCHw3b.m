clear all;
clc;
close all;
theta_n = [2*pi*rand(1,6)]';
x1=[1;3;4;2;7;2];
y1=[2;1;3;5;2;3];
comb=[theta_n,x1,y1];
[t,xdot]=ode23('formcontrol',[0 15],comb);

figure;
plot(t,xdot(:,1:6));
xlabel('Time');
ylabel('theta_n');
title('Heading of Nodes')
legend('1','2','3','4','5','6')

hold on

figure;
plot(xdot(:,7:12),xdot(:,13:18))
xlabel('x');
ylabel('y');
title('Position of Nodes')
legend('1','2','3','4','5','6')
hold on

figure;
plot3(xdot(:,7:12),xdot(:,13:18),t)
xlabel('x');
ylabel('y');
zlabel('t');
title('3D plot of states')
legend('1','2','3','4','5','6')