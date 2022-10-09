data = 'ECE1150';
t = tcpip('loaclhost', 30000, 'NetworkRole', 'server');
fopen(t);
fprintf(t,data);
fclose(t);
