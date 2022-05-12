function x = ss_dtmf1(key, t1, Ts) %ss_dtmf1 described in question 3a
t = 0 : Ts : t1; %getting the seconds
if key == 0  %getting f1 and f2 based on the key
    f1 = 941;
    f2 = 1336;
elseif key == 1
    f1 = 697;
    f2 = 1209;
elseif key == 2    
    f1 = 697;
    f2 = 1336;
elseif key == 3
    f1 = 696;
    f2 = 1477;
elseif key == 4
    f1 = 770;
    f2 = 1209;
elseif key == 5
    f1 = 770;
    f2 = 1336;
elseif key == 6
    f1 = 770;
    f2 = 1477;
elseif key == 7
    f1 = 852;
    f2 = 1209;
elseif key == 8
    f1 = 852;
    f2 = 1336;
elseif key == 9
    f1 = 852;
    f2 = 1477;
elseif key == 10 %for '*'
    f1 = 941;
    f2 = 1209;
elseif key == 11 %for '#'
    f1 = 941;
    f2 = 1477;
elseif key == 12 %the pause needed
    f1 = 0;
    f2 = 0;
end
x = sin(2 * pi * f1 * t) + sin(2 * pi * f2 * t); %calling the function
end