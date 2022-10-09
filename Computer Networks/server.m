%server
t = tcpip('0.0.0.0', 30000, 'NetworkRole', 'server');
fopen(t);
pause(0.1);
data = fscanf(t, "%s");
fclose(t);