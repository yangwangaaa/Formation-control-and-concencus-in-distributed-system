clear all; clc;close all;


% Simulating Dynamics for leader & 4 agents
[t,Zdot] = ode23(@frmctrl,[0:0.01:40],[zeros(2,1);ones(2,1);2*rand(8,1);2*rand(8,1)]);

% Positions of the leader & agents
figure;
plot(10,10,'o','MarkerFaceColor','green');
plot(1.5,2.5,'o','MarkerFaceColor','blue');
plot(2.5,1.5,'o','MarkerFaceColor','blue');
plot(3,4,'o','MarkerFaceColor','blue');
plot(4,3,'o','MarkerFaceColor','blue');
plot(4,5,'o','MarkerFaceColor','blue');
plot(5.6,4,'o','MarkerFaceColor','blue');
plot(Zdot(:,5),Zdot(:,6))       % Node 1
hold on
plot(Zdot(:,9),Zdot(:,10))       % Node 2
hold on
plot(Zdot(:,13),Zdot(:,14))      % Node 3
hold on
plot(Zdot(:,17),Zdot(:,18))     % Node 4
hold on
plot(Zdot(:,1),Zdot(:,2))       % Leader
legend('1','2','3','4','Leader')
grid on;
title('Positions of Leader & agents')
xlabel('x');ylabel('y');
p1 = plot(Zdot(:,5),Zdot(:,6),'o');
p2 = plot(Zdot(:,9),Zdot(:,10),'o');
p3 = plot(Zdot(:,13),Zdot(:,14),'o');
p4 = plot(Zdot(:,17),Zdot(:,18),'o');
p = plot(Zdot(:,1),Zdot(:,2),'o','MarkerFaceColor','red');
hold off
% Plot Animations
for k = 1:size(t,1)
 p.XData = Zdot(k,1);
 p.YData = Zdot(k,2);
 p1.XData = Zdot(k,5);
 p1.YData = Zdot(k,6);
 p2.XData = Zdot(k,9);
 p2.YData = Zdot(k,10);
 p3.XData = Zdot(k,13);
 p3.YData = Zdot(k,14);
 p4.XData = Zdot(k,17);
 p4.YData = Zdot(k,18);
 drawnow limitrate
end
drawnow
% Velocities of Leader & agents
figure;
plot(Zdot(:,7),Zdot(:,8))     % Node 1
hold on
plot(Zdot(:,11),Zdot(:,12))     % Node 2
hold on
plot(Zdot(:,15),Zdot(:,16))     % Node 3
hold on
plot(Zdot(:,19),Zdot(:,20))     % Node 4
hold on
plot(Zdot(:,3),Zdot(:,4))       % Leader
legend('1','2','3','4','Leader')
grid on;
title('Velocities of Leader & agents')
xlabel('V_x');ylabel('V_y');

% Leader Position Phase Plot
figure
plot(Zdot(:,1),Zdot(:,2))
title('Leader position');
xlabel('x');ylabel('y');



function Zdot = frmctrl(t,z)
vX = z(3)
vY = z(4)
global kG K kF
    
kG = -10;
K = [0.5 -1 3 -1 -2 4.5]; 

obs = [1.5 2.5 3 4 4 5.6;
        2 1 4 3 5 4];

%% Vector to Goal at (10,10)
    r = sqrt((10-z(1))^2 + (10-z(2))^2);
    
%% Force on the robot due to Goal (x-direction)
    fXG = (kG*(z(1) - 10))/(r);
%% Force on the robot due to Goal (y-direction)
    fYG = (kG*(z(2) - 10))/(r);
    FO1x = 0;
    FO1y = 0;
   

    
%% Force on the leader and follower due to obstacles
for i = 1:6
    ObsCord = obs(:,i);
    oX = ObsCord(1);
    oY = ObsCord(2);
    rOL = sqrt((oX-z(1))^2 + ((oY-z(2))^2));
    fOX = (K(i)*(z(1) - oX))/(rOL);
    fOY = (K(i)*(z(2) - oY))/(rOL);
    FO1x = FO1x + fOX;
    FO1y = FO1y + fOY;
end
    
%% Total Forces on the robot (x & y direction)
    fX = fXG+FO1x;
    fY = fYG+FO1y;
    
if r<0.1
        fX = 0;
        fY = 0;
        vX = 0;
        vY = 0;
               
end 

% Adjacency Matrix of the formation graph
A = [0 0 1/2 0;
     1/2 0 0 0;
     1/2 1/2 0 0;
     0 1/2 0 0];
 D = diag(sum(A,2));
 L = (D - A);           % Graph Laplacian Matrix

 gamma = 3.75;
 % Offset of the agents wrt leader
 delta0 = [1 1];
 delta1 = [1 -1];
 delta2 = [-1 -1];
 delta3 = [-1 1];

 delta =[delta0'; zeros(2,1) ; delta1'; zeros(2,1) ; delta2' ;zeros(2,1) ; delta3'; zeros(2,1)];

 % PD Gain Matrices
 kp = eye(2);
 kd = gamma*eye(2);
 K = [kp kd];

 c = 550;
 % Agent Node Dynamics Matrices
 A_sys = [zeros(2) eye(2);
          zeros(2) zeros(2)];
 B_sys = [zeros(2); eye(2)];

 % Pinning Gain Matrix
 G = [0 0 0 0;0 1/2 0 0;0 0 0 0;0 0 0 0];

 % Kronecker Products
 kron1 = kron(eye(4),A_sys);
 cL = c*(L + G);
 BK = B_sys*K;
 kron2 = kron(cL,BK);
 Ac = kron1 - kron2;

 % Leader Dynamics
 %x0 = A_sys * z(1:4);

 % Node Dynamics equation
 z0 = Ac*z(5:20) + kron2 *delta + kron2*([z(1:2); z(3:4); z(1:2); z(3:4); z(1:2); z(3:4); z(1:2); z(3:4)]);

 Zdot = [x0;z0];

end
