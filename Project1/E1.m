clear;

syms x(t) %piecewise function used for the function described in the first question

x(t) = piecewise((0<=t)&(t<1), t,(1<=t)&(t<3), (1/(2*(3-2*t))),0); %the x(t) required

t1= -5:0.05:5 ;%getting some values for t

subplot(311); 
x1=x(t1);
plot(t1,x1); %getting the required graphs with plot

subplot(312); %similar work for 2t
x2=x(t1*2);
plot(t1,x2,'g');

subplot(313); %as well as t/2
x3=x(t1/2);
plot(t1,x3,'r');
