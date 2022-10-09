% t = (-1:0.01:1)';
% 
% impulse = t==0;
% unitstep = t>=0;
% ramp = t.*unitstep;
% quad = t.^2.*unitstep;
% 
% plot(t,ramp);

% t=0:0.1:10
% alpha=2
% ramp=alpha*t         % Your input signal
% model=tf(1,[1 20 3]);    % Your transfer function
% [y,t]=lsim(model,ramp,t)
% plot(t,y)
% 
% s = tf('s');
% G = 1/(s+1);
% figure
% subplot(311), impulse(G);   % Impulse reponse
% subplot(312), step(G);      % Step Response
% subplot(313), step(G / s);  % Ramp response

t = (3:0.1:9)';
w = (9:0.1:15)';

unitstep = t>=0;
ramp = t.*heaviside(t);
quad = -w.*heaviside(w);

plot(t,ramp);
hold on;
plot(w,ramp);
grid on;