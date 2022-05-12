% Question 1.1 - Combined function of bisect and Newton-Raphson

function ret = syndyasmos_D_NR (f, df, e1, e2, a, b, n)
  bisect_results = bisect_m(f, a, b, e1, n);
  nr_results = rf_newton2(f, df, bisect_results(end, 4), e2, n);
  
  % Defining the return array 'ret'
  row_length = max(size(bisect_results(:, 4)'), size(nr_results(:, 2)'));
  ret = zeros(2, row_length(2));
  
  ret(1, 1) = bisect_results(end, 1);   % number of iterations executed in bisect
  ret(1, 2) = bisect_results(end, 2);   % last a value by bisect
  ret(1, 3) = bisect_results(end, 3);   % last b value by bisect
  ret(1, 4) = bisect_results(end, 4);   % x0 is as close as bisect got to the root
  ret(1, 5) = nr_results(end, 2);   % xn is as close as NR got to the root
  ret(1, 6) = nr_results(end, 1);   % iterations that NR executed

  row_length = size(nr_results(:, 2)');
  ret(2, 1:row_length(2)) = nr_results(:, 2)';        % the xn values from NR
end
