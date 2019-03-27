clear all
clc
close all
%Solving for first problem
a1= [0 0 0 0 0 0;
    0.5 0 0 0 0 0;
    0.5 0 0 0 0 0;
    0 0.5 0 0 0 0;
    0 0 0.5 0 0 0;
    0 0 0.5 0 0 0];
d1=diag(sum(a1,2));
l1=d1-a1;
conpro1=@(t1,x1)([-l1*x1]);     %Consensus Protocol
[T1,X1]=ode23(conpro1,[0 15],[0 2 -2 3 -3 4]');

%Plotting states Vs. Time

figure(1)
plot(T1,X1)
axis([0 15 -5 5]);
legend('1','2','3','4','5','6')
title('State vs. Time')
xlabel('Time');
ylabel('Node State');
hold on

%Solving for the second problem
a2= [0 0.5 0.5 0 0 0;
    0.5 0 0 0.5 0 0;
    0.5 0 0 0 0.5 0.5;
    0 0.5 0 0 0 0;
    0 0 0.5 0 0 0;
    0 0 0.5 0 0 0];
d2=diag(sum(a2,2));
l2=d2-a2;
conpro2=@(t2,x2)([-l2*x2]);     %Consensus Protocol
[T2,X2]=ode23(conpro2,[0 15],[0 2 -2 3 -3 4]');

%Plotting states Vs. Time

figure(2)
plot(T2,X2)
axis([0 15 -5 5]);
legend('1','2','3','4','5','6')
title('State vs. Time')
xlabel('Time');
ylabel('Node State');
hold on


%Solving for third problem
a3= [0 0.5 0.5 0.5 0.5 0.5;
    0.5 0 0 0 0 0;
    0.5 0 0 0 0 0;
    0.5 0 0 0 0 0;
    0.5 0 0 0 0 0;
    0.5 0 0 0 0 0];

d3=diag(sum(a3,2));
l3=d3-a3;
conpro3=@(t3,x3)([-l3*x3]);     %Consensus Protocol
[T3,X3]=ode23(conpro3,[0 15],[0 2 -2 3 -3 4]');

%Plotting states Vs. Time

figure(3)
plot(T3,X3)
axis([0 15 -5 5]);
legend('1','2','3','4','5','6')
title('State vs. Time')
xlabel('Time');
ylabel('Node State');
hold on

%Solving for fourth problem
a4= [0 0.5 0.5 0.5 0.5 0.5;
    0.5 0 0.5 0 0 0.5;
    0.5 0.5 0 0.5 0 0;
    0.5 0 0.5 0 0.5 0;
    0.5 0 0 0.5 0 0.5;
    0.5 0.5 0 0 0.5 0];
d4=diag(sum(a4,2));
l4=d4-a4;
conpro4=@(t4,x4)([-l4*x4]);     %Consensus Protocol
[T4,X4]=ode23(conpro4,[0 15],[0 2 -2 3 -3 4]');

%Plotting states Vs. Time

figure(4)
plot(T4,X4)
axis([0 15 -5 5]);
legend('1','2','3','4','5','6')
title('State vs. Time')
xlabel('Time');
ylabel('Node State');
hold on

%Solving for fifth problem
a5= [0 0 0 0 0 0.5;
    0.5 0 0 0 0 0;
    0 0.5 0 0 0 0;
    0 0 0.5 0 0 0;
    0 0 0 0.5 0 0;
    0 0 0 0 0.5 0];
d5=diag(sum(a5,2));
l5=d5-a5;
conpro5=@(t5,x5)([-l5*x5]);     %Consensus Protocol
[T5,X5]=ode23(conpro5,[0 15],[0 2 -2 3 -3 4]');

%Plotting states Vs. Time

figure(5)
plot(T5,X5)
axis([0 15 -5 5]);
legend('1','2','3','4','5','6')
title('State vs. Time')
xlabel('Time');
ylabel('Node State');
hold on

%Solving for 6th problem
a6= [0 0.5 0 0 0 0.5;
    0.5 0 0.5 0 0 0;
    0 0.5 0 0.5 0 0;
    0 0 0.5 0 0.5 0;
    0 0 0 0.5 0 0.5;
    0.5 0 0 0 0.5 0];
d6=diag(sum(a6,2));
l6=d6-a6;
conpro6=@(t6,x6)([-l6*x6]);     %Consensus Protocol
[T6,X6]=ode23(conpro5,[0 15],[0 2 -2 3 -3 4]');

%Plotting states Vs. Time

figure(6)
plot(T6,X6)
axis([0 15 -5 5]);
legend('1','2','3','4','5','6')
title('State vs. Time')
xlabel('Time');
ylabel('Node State');
hold on

%Solving for 7th problem
a7= [0 0.5 0 0 0 0;
    0.5 0 0.5 0 0 0;
    0 0.5 0 0.5 0 0;
    0 0 0.5 0 0.5 0;
    0 0 0 0.5 0 0.5;
    0 0 0 0 0.5 0];

d7=diag(sum(a7,2));
l7=d7-a7;
conpro7=@(t7,x7)([-l7*x7]);     %Consensus Protocol
[T7,X7]=ode23(conpro7,[0 15],[0 2 -2 3 -3 4]');

%Plotting states Vs. Time

figure(7)
plot(T7,X7)
axis([0 15 -5 5]);
legend('1','2','3','4','5','6')
title('State vs. Time')
xlabel('Time');
ylabel('Node State');
hold on



