function [lamda, zfinal, iters] = inverse_power_method(A, y0, q, tol, M)  
	
  n = size(A,1);
	
  if size(A, 2) ~= n
		error('inverse_power_method works on square matrices.')
	end

	p=min(find (abs(y0)==max(abs(y0)))); %Find integer p such that |yp|=max||yi||, i=1,...,n 
  z = y0 / y0(p);                            % z0
	
	lambda0=0;
	znew = z;
  itcount = 1;
  B = inv(A - q * eye(n));   % B = inverse(A -qI) 
    
  for j= 1 : M
     ynew=B*znew;                   % Step 1
     lambda=ynew(p);                % Step 2
     p=min(find (abs(ynew)==max(abs(ynew))));  % Step 4 (step 3 is skipped because it is not needed for power method calculation)
     znew=ynew/ynew(p);             % Step 5
     
     if abs(lambda0-lambda)<tol     % Step 6
         break;
     end;
     
     lambda0=lambda;                % Step 7
     itcount = itcount + 1;
   end;  
	
	
	% max iters exceeded
	lamda = (1/lambda) + q;
	zfinal = znew;
  iters = itcount;
	%disp('Max iterations exceeded.');
	
    
end
