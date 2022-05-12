clear;
Ts = 0.01;
t = 0 : Ts : 1;
x = 4 * cos(2 * pi * t); %getting the sampled signal

[d1,y1,e1] = quantizer(x,7); %quantizing and coding the signal using L = 7
y1(1) = y1(2); %the first and last values had a rounding error so they are fixed here.
y1(end) = y1(end-1);
z1 = coder(y1,d1);

[d2,y2,e2] = quantizer(x,8);%quantizing and coding the signal using L = 7
y2(1) = y2(2);%the first and last values had a rounding error so they are fixed here.
y2(end) = y2(end-1);
z2 = coder(y2,d2);

%Making the necessary plots.
subplot(211);plot(t,x,t,y1,'.',t,e1),title('Levels = 7')
subplot(212);plot(t,x,t,y2,'.',t,e2),title('Levels = 8')

