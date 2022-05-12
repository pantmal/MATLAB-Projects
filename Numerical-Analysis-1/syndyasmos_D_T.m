% This is the combined function of Cutting Method and Bisection %

function ret = syndyasmos_D_T(f, df, e1, e2, a, b, n, root)
  bisect_results = bisect_m(f, a, b, e1, n);
  cut_results = temnousa(f, bisect_results(end, 4), bisect_results(end, 3), e2, n, root);
  
  % slice: max value between column length of Bisect results and Cutting method results %
  row_length = max(size(bisect_results(:, 4)'), size(cut_results(:, 2)'));
  ret = zeros(3, row_length(2));   % create an array with row size equal to the value that slice chose
  
  ret(1, 1) = bisect_results(end, 1);   % number of iterations executed in Bisect
  ret(1, 2) = bisect_results(end, 2);   % last a value defined by Bisect
  ret(1, 3) = bisect_results(end, 3);   % last b value defined by Bisect
  ret(1, 4) = bisect_results(end, 4);   % x0 is as close as Bisect got to ξ
  ret(1, 5) = cut_results(end, 2);   % xn is as close as Cutting method got to ξ
  ret(1, 6) = cut_results(end, 1);   % iterations that NR executed 
  
  
  row_length = size(cut_results(:, 2)');
  ret(2, 1:row_length(2)) = cut_results(:, 2)';        % this row contains the xn values returned from Cutting method
  
  row_length = size(cut_results(:, 1)');
  ret(3, 1:row_length(2)) = cut_results(:, 1)';        % this row contains the xn values returned from Cutting method
  
  row_length = size(cut_results(:, 4)');
  ret(4, 1:row_length(2)) = cut_results(:, 4)';        % this row contains the ε_n values returned from Cutting method
  
  row_length = size(cut_results(:, 5)');
  ret(5, 1:row_length(2)) = cut_results(:, 5)';        % this row contains the ε_n-ε_n-1 values returned from Cutting method
end
