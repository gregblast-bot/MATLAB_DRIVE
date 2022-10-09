close all;
clear all;
clc
%% 1) Set a requirement for step response, like settling time, overshoot 
%and static error of output.
A=[0,1,0,0;0,-42.44,212.24,0;0,0,0,1;0,0,0,-42.44];
B=[0;106.12;0;78.6];
C=[1,0,0,0;0,1,0,0;0,0,1,0;0,0,0,1];
D=0;
sys = ss(A, B, C, D)
t=0:0.1:10;
figure;
step(sys,t,'r')
%The parameters including overshoot, settling time and static error.
S = stepinfo(sys)
%% 2)Select the desired poles according to your requirements. If possible, 
%calculate the feedback matrix K to place the poles to the desired poles.
eig(sys)
% Now we check the stability
rank(ctrb(sys))
%The desired poles
P = [-1; -2; -3; -3.2850]
K = place(A,B,P)
%% 3) Simulate step response of the feedback system and calculate the parameters
%%including overshoot, settling time and static error. If the system does not satisfy the
%%requirement, go back to step 2).
Acl = A-B*K
syscl = ss(Acl,B,C,D)
figure;
step(syscl,'g')
%The parameters including overshoot, settling time.
S = stepinfo(syscl)
title('Step response of feedback control system')
grid on
%% 4) Design state observer of the system. The magnitude of observer poles must be 2~5
%times of system poles. Select different observer poles and compare the performance
%of observers.
sys=ss(A,B,C,D)
eig(sys)
rank(obsv(sys))
% Observer pole placement at  -10 and -9
% This observer will lead to a fast approximation of the states
L_T=place(A',C',[-10,-9,-8,-7])
L=L_T'
% Observer pole placement at  -1 and -2
% This observer will lead to a slower approximation of the states
% L_anastrofos=place(a',c',[-1,-2])
% L=L_anastrofos'
% State observer Feedback
sys=ss(A,B,C,D)
eig(sys)
rank(obsv(sys))
rank(ctrb(sys))
K=place(A,B,[-5 -6 -7 -8])