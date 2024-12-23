clc
clear all

% % Symbolic variables
% syms s K1 K2 K3 K4
% % Characteristic Equation Matrix
% CE = [s, 0, -1, 0; 0, s, 0, -1; 98.3*K1, 98.3*K2-767, s+98.3*K3+52.8, 98.3*K4; -98.3*K1, -98.3*K2+1040.1, -98.3*K3-52.8, s-98.3*K4];

% Firstly, initiliaze the matrices
A = [0, 0, 1, 0; 0, 0, 0, 1; 0, 767.0, -52.8, 0; 0, -1040.1, 52.8, 0];
B = [0; 0; 98.3; -98.3];
% C is a 4x4 identity matrix and D = 0
C = eye(4);
D = [0; 0; 0; 0];

% Create a state-space representation of this system
system = ss(A, B, C, D);

% Find the eigenvalues corresponding to this system, these are our poles
% P0 = eig(system);
% System is marginally stable, but will have output that doesn't return to zero
% P0 = [0, -34.8229, -8.9885 + 18.2563i, -8.9885 - 18.2563i];
% disp("Poles: ");
% disp(P0);

%Manipulate poles to make the system stable, get rid of zero and bring poles in towards the dominant poles
P = [-6, -10, -8 + 16i, -8 - 16i];

% Since the controllability matrix has a full space, its null matrix is empty
rct = rank(ctrb(system));
disp("Rank: ");
disp(rct);
disp("Null Matrix:");
nct = null(ctrb(system))

% Solve for K using Ackermann's Formula for closed-loop pole placement
K = acker(A, B, P);
disp("K: ");
disp(K);

%Check for the same eigenvalues of the closed loop system
Acl = A-B*K;
Ecl = eig(Acl);
disp("Check Eigenvalues: ");
disp(Ecl);

% Closed Loop Systems
systemcl = ss(Acl, B, C, D);

t=0:0.1:1;
% Graph step responses
figure
step(system,t,'r')
% All S1 step info is NAN and INF since it is unstable
S1 = stepinfo(system);

figure
step(systemcl,t,'k')
S2 = stepinfo(systemcl);
disp("S2 ");
S2(1,1)
S2(2,1)
S2(3,1)
S2(4,1)