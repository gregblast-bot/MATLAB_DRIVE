clc
clear all

N = 100;                       % 100 bits
Ns = 3;                        % Number of samples
t = 1/3;                       % Time for each sample
bitstream = randi(2,N,1)-1;    % Create a random stream of zeros and ones (binary)
V = bitstream;                 % V is equal to the bitstream value (0 or 1)
signal = [V,V,V];              % Create a signal represented by three of the same bits

% Input V as the transmitted signal, the snr and use 'measured; in
% order to meausre the signal power of V before adding noise
x = awgn(V, 10, 'measured');
y = awgn(V, -10, 'measured'); 

% Set count to zero
count = 0;

% Loop from zero to 100 taking for every 0.33 seconds
for i = 0:t:100
    % Set recovered equal to zero every cycle
    recovered = 0;
    % Increment count
    count = count + 1;
    % Recovered equals the signal compounded every three samples
    recovered = V + recovered;
    
    % For every three cycles, if the signal is greater than zero
    % the recovered signal equals 1, else recovered signal equals zero
    if mod(count, 3) == 0
        if V/3 >= 0
            recovered = 1;
        else
            recovered = 0;
        end
    end
end

figure(1)
stairs(bitstream);             % This makes the bitstream a visible, rectangular signal 
ylim([-5 5]);                  % Add some clearance above and below the signal

figure(2)
plot(x);                       % Plot signal with snr 10dB

figure(3)
plot(y);                       % Plot signal with snr -10dB

figure(4)                      % Plot recovered signal
plot(recovered);
ylim([-5 5]);                  % Add some clearance above and below the signal


disp(signal);                  % Display signal three bit representation