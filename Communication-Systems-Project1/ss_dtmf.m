function Y = ss_dtmf(number, dt, nd, np) %ss_dtmf described in 3b
    Ts = 1 / 8000; %the frequency sample
    Y = []; %the Y array that will be created
    
    for i = 1 : length(number) %for every digit
        x = ss_dtmf1(number(i), nd * dt, Ts); %getting the duration of every digit
        Y = cat(2, Y, x); %adding it to the Y
        x = ss_dtmf1(12, np * dt, Ts); %getting the duration of the pause between each digit
        Y = cat(2, Y, x); %also adding it to the Y
    end
end    