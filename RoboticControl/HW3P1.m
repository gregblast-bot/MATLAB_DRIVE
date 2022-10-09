clear all; 
 
T = 20;          % Time of simulation 
dt = 0.01;      % Sampling time interval  
x(1) = 0;        % Initial x location 
y(1) = 0;        % Initial y location 
phi(1) = pi;    % Initial heading 
v0 = 10;         % Speed of the mobile robot 
 
k_P = 0.5;       % Gain of P control 
 
x_d = 40;    % Desired x location 
y_d = 40; % Desired y location 
 
plot(x_d, y_d, 'rd'); hold on;   % Plot the target location as a red diamond 
 
%%%% Start simulation:  
 
for i = 1 : T/dt 
 
     % Controller: 
 
     phi_d = atan2(y_d-y(i),x_d-x(i)); 
     ee = phi_d-phi(i);
     eep = atan2(sin(ee), cos(ee));
     u(i) = k_P*(eep);  % This might cause angle problem! 
     
     % Dynamics of mobile robot: 
 
     x(i+1) = x(i) + dt*v0*cos(phi(i)); 
     y(i+1) = y(i) + dt*v0*sin(phi(i)); 
     phi(i+1) = phi(i) + dt*u(i); 
 
     plot(x(i),y(i),'b.'); hold on;  % Plot the trajectory of the mobile robot 
 
end  