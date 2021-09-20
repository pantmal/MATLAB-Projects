clear;

number = [1 1 1 5 2 0 1 6 0 0 2 6 8]; %my academic ID
dt = 1; %1 second
nd = 0.2; %the duration of every digit
np = 0.08; %the duration of the pause between each digit

Y = ss_dtmf(number, dt, nd, np);%calling the function to get the array
sound(Y) %listening to the sound produced by the digits