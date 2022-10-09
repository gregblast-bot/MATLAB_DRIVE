clc
clear all

N = 100;                       % 100 bits 
Ns = 3;                        % Number of samples
bitstream = randi(2,N,1)-1;    % Create a random stream of zeros and ones (binary)
V = bitstream;                 % V is equal to the bitstream value (0 or 1)
signal = [V,V,V];              % Create a signal represented by three of the same bits

stairs(bitstream);             % This makes the bitstream a visible, rectangular signal 
ylim([-5 5]);                  % Add some clearance above and below the signal

disp(signal);                  % Display signal three bit representation