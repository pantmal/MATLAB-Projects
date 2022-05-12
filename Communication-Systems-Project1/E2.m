clear;

t= -5:0.1:5; %getting some values for t

v=@(t)(x(-t));  %getting the v(t) and y(t) described in the second question
y=@(t)(v(t-2));

w=@(t)(x(t-2)); %similar work for w(t) and z(t). now in reverse order
z=@(t)(w(-t));

subplot(211);plot(t,y(t)); %getting the graphs from y(t) and z(t) for the required comparison
subplot(212);plot(t,z(t),'r');
