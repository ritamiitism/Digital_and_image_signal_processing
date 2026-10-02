fs = 6e2;
ts = 0:1/fs:2;
x = chirp(ts,250,ts(end),50,"quadratic",0,"convex","complex");

M = 49;
L = 11;
g = bartlett(M);
Ndft = 1024;

[s,f,t] = spectrogram(x,g,L,Ndft,fs);
waterplot(s,f,t)
