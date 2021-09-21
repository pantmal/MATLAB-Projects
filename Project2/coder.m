function z = coder(y,d)
	y_un = unique(y); %getting unique values of the y array
	z = y; %initializing the z array using y. it will be updated.
	for i = 1 : length(y)
	    find_index = find(y_un == y(i)); %getting the index of the quantized value in the y_un array. this will be its level.
	    binary_num = dec2base(find_index-1,2)-'0'; %getting binary array. our values start from 0. so level 1 is 0000 etc.
	    z_num = polyval(binary_num, 10); %getting numeric format of the binary array.
	    z(i) = z_num; %placing coded value in the z array
	end
end

