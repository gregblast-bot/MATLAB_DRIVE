clc
clear all

N = 100;                       % 100 bits 
Ns = 3;                        % Number of samples
bitstream = randi(2,N,1)-1;    % Create a random stream of zeros and ones (binary)
V = bitstream;                 % V is equal to the bitstream value (0 or 1)
signal = [V,V,V];              % Create a signal represented by three of the same bits

% For snr of -10dB to 10dB
for snr = -10 : 10
    % Input V as the transmitted signal, the snr and use 'measured; in
    % order to meausre the signal power of V before adding noise
    y = awgn(V, snr, 'measured'); 
end

figure(1)
stairs(bitstream);             % This makes the bitstream a visible, rectangular signal 
ylim([-5 5]);                  % Add some clearance above and below the signal

figure(2)
plot(y);                       % Plot the signal with noise

disp(signal);                  % Display signal three bit representation