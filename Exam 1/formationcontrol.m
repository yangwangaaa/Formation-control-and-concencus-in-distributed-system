function Zdot = formationcontrol(t,z)
%% Adjacency Matrix of the formation graph

a = [0 0 0.5 0;
     0.5 0 0 0;
     0.5 0.5 0 0;
     0 0.5 0 0;];
 
 d = diag(sum(a,2));
 %% Graph Laplacian Matrix

 l = (d - a);
 %% Offset of the agents wrt leader
 del0 = [1 1];
 del1 = [1 -1];
 del2 = [-1 -1];
 del3 = [-1 1];

 del = [del0'; zeros(1,2)';del1'; zeros(1,2)';del2' ;zeros(1,2)';del3'; zeros(1,2)'];

 %% Setting the value of gamma
 gamma = 3;
 %% Pinning Gain Matrix
 G = [0 0 0 0;0 0.5 0 0;0 0 0 0;0 0 0 0];

 %% PD Gain Matrices
 kp = eye(2);
 kd = gamma*eye(2);
 K = [kp kd];

 c = 550;
 %% Agent Node Dynamics Matrices
 aSys = [zeros(2) eye(2);
          zeros(2) zeros(2)];
 bSys = [zeros(2); eye(2)];

 %% Kronecker Products
 kron1 = kron(eye(4),aSys);
 cL = c*(l + G);
 BK = bSys*K;
 kron2 = kron(cL,BK);
 Ac = kron1-kron2;
  
 %% Leader Dynamics
 x0 = aSys * z(17:20);

 %% Node Dynamics equation
 z0  = Ac*z(1:16) + kron2*del + kron2*([z(17:20); z(17:20); z(17:20); z(17:20)]);
 Zdot = [z0;x0];

end
