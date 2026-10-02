n1=[0:99];
x1=cos(2*pi*n1/10);
n2=[0:99]
n3=[0:119]
x2=cos(2*pi*n2/20);
x3=cos(2*pi*n3/30)
x4=[x1 x2 x3];
N=[0:length(x4)-1];

N1=2048;
F1=[0:N1-1]/N1;
mx1=fft(x4,N1);
figure(1)
plot(F1,mx1);
figure(4)
plot(N,x4);
n1=[0:299];
x1=cos(2*pi*n1/10);
n2=[0:299]
n3=[0:299]
x2=cos(2*pi*n2/20);
x3=cos(2*pi*n3/30)
x4=x1+x2+x3;
N=[0:length(x4)-1];

N1=2048;
F1=[0:N1-1]/N1;
mx1=fft(x4,N1);
figure(2)
plot(F1,mx1);
figure(3)
plot(N,x4);