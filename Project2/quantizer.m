function [d,y,e] = quantizer(x,L)
	Xmax = max(x); %getting max and minimun values of the x array
	Xmin = min(x);
	d = (Xmax-Xmin)/L; %getting the d sub-step
	y = x; %initializing y and e arrays using x. they will be updated.
	e = x;
	mod_res = mod(L,2); %getting modulo of L to see if it's even or odd.
	for i = 1 : length(x)
		if mod_res == 0 %L is even
		    temp = ( floor(x(i)/d) + (1/2) ); %rounding to the nearest level
		else %L is odd
		    temp = floor( (x(i)/d) + (1/2) ); %rounding to the nearest level
		end
        	temp2 = d * temp; %multiplying the rounded result by the step.
        	if temp2 > Xmax %a few values exceed Xmax by rounding error so they are reset here.
	            temp2 = Xmax;
        	end
	        y(i) = temp2; %here y is getting the quantized value.
        	e(i) = x(i) - temp2 ; %getting the error.
	end
end

