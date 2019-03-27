function xdot = formcontrol(t,Theta)
a=[0 0 0.5 0 0 0;
    0.5 0 0 0 0 0.5;
    0.5 0.5 0 0 0 0;
    0 0.5 0 0 0 0;
    0 0 0.5 0 0 0;
    0 0 0 0.5 0.5 0;];
d=diag(sum(a,2));
l=d-a;
v=2.5;
Theta_dot=-l*Theta(1:6);
x_dot=v*sin(Theta(1:6));
y_dot=v*cos(Theta(1:6));
xdot = [Theta_dot;x_dot;y_dot];
