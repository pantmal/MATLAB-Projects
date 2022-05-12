% Main prog

%Funcs
f1 = inline('((x + 1).^3) .* (x - 2)');
df1 = inline('((x+1).^2) .* (4*x - 5)');

f2 = inline('exp(x) - x.^2 - 2');
df2 = inline('exp(x) - 2*x');

% Errors
e_bisect = 0.5 * 10^(-2);
e_NR = 0.5 * 10^(-6);

n = 100; % max iterations

options = input('Choose between: 1 (for syndiasmos_D_NR) or 2 (for syndiasmos_D_T) or 3 for (graph): ');

switch options
  
  case 1

    disp('-----------------------------------------------')
    disp('Question 1.2 - results  for syndyasmos_D_NR')
    disp('-----------------------------------------------')

    %View the syndyasmos_D_NR.m file for the implentation of Question 1.1
    
    disp('Row 1: f1 & ξ = -1, Row 2: f1 & ξ = 2, Row 3: f2 & ξ =~ 1.31');
    disp('      a         b           x0        xn       n');
    result1 = syndyasmos_D_NR(f1, df1, e_bisect, e_NR, -2, 0.5, n); %Starting [a,b] = [-2, 0.5]
    disp(result1(1:1, 2:6));
    result2 = syndyasmos_D_NR(f1, df1, e_bisect, e_NR, 1, 6, n); %Starting [a,b] = [1, 6]
    disp(result2(1:1, 2:6));
    result3 = syndyasmos_D_NR(f2, df2, e_bisect, e_NR, -5, 5, n); %Starting [a,b] = [-5, 5]
    disp(result3(1:1, 2:6));
    disp('-----------------------------------------------')

    %  Question 1.3 - errors for syndyasmos_D_NR
    disp('Question 1.3 - errors for syndyasmos_D_NR')
    disp('-----------------------------------------------')

    % ret(1, 4) is x0 
    % p = 1 for the f1 function

    % f1 with ξ = -1
    disp('Function f1 and root of -1')
    root = -1;
    table1 = zeros(result1(1,6), 3);    % initialize space of size n (iterations) rows and 3 columns
    table1(1, 1) = 1;                   % n = 0
    table1(1, 2) = abs(result1(1, 4) - root);  % error for x0
    table1(1, 3) = NaN;                  % error fraction is undefined for x0 

    for i = 2 : result1(1,6) - 1
      table1(i, 1) = i;
      table1(i, 2) = abs(result1(2, i) - root);   % calculation of e_n
      table1(i, 3) = abs(table1(i, 2))/abs(table1(i-1, 2));    % calculation of e_n/e_(n-1)
    end

    table1(end, 1) = result1(1,6);
    table1(end, 2) = abs(result1(2, result1(1,6)) - root);   % calculation of last ε_n 
    table1(end, 3) = NaN;                  % error fraction for last xn is undefined

    
    disp('      n                e_n          e_n/e_n-1')
    disp(table1)

    disp('-----------------------------------------------')
    
    disp('Function f1 and root of 2')
    %This is for f1 and root of 2
    %Same work as in the above case
    root = 2;
    table2 = zeros(result2(1,6), 3);    
    table2(1, 1) = 1;
    table2(1, 2) = abs(result2(1, 4) - root); 
    table2(1, 3) = NaN;                  


    for i = 2 : result2(1,6) - 1
      table2(i, 1) = i;
      table2(i, 2) = abs(result2(2, i) - root);             
      table2(i, 3) = abs(table2(i, 2))/abs(table2(i-1, 2)); 
    end

    table2(end, 1) = result2(1,6);
    table2(end, 2) = abs(result2(2, result2(1,6)) - root);  
    table2(end, 3) = NaN; 

    
    disp('      n                e_n            e_n/e_n-1')
    disp(table2)

    disp('-----------------------------------------------')
    
    disp('Function f2')
    
    table3 = zeros(result3(1,6), 3);    
    table3(1, 1) = 1;
    table3(1, 2) = abs(result3(2, 2) - result3(2, 1)); %We don't know the root for f2 so we will use the second formula for the errors
    table3(1, 3) = NaN;

    for i = 2 : result3(1,6) - 1 
      table3(i, 1) = i;
      table3(i, 2) = abs(result3(2, i+1) - result3(2, i));              
      table3(i, 3) = abs(table3(i, 2))/ (abs(result3(2, i) - result3(2, i-1)).^2); 
    end


    table3(end, 1) = result3(1,6);
    table3(end, 2) = 0;  
    table3(end, 3) = NaN;

    
    disp('      n         e_n       e_n/e_n-1')
    disp(table3)
    disp('-----------------------------------------------')
    %The answer to Question 1.4 can be seen at the readme file
  
  case 2

    %  Question 1.5 

    disp('-----------------------------------------------')
    disp('Question 1.5 - results  for syndyasmos_D_Τ')
    disp('-----------------------------------------------')

    disp('Row 1: f1 & ξ = -1, Row 2: f1 & ξ = 2, Row 3: f2 & ξ =~ 1.31');
    disp('     a           b        x0          xn          n');
    result1= syndyasmos_D_T(f1, df1, e_bisect, e_NR, -2, 0.5, n, -1); %Starting [a,b] = [-2, 0.5]
    disp(result1(1:1, 2:6));
    result2 = syndyasmos_D_T(f1, df1, e_bisect, e_NR, 1, 6, n, 2);  %Starting [a,b] = [1, 6]
    disp(result2(1:1, 2:6));
    result3 = syndyasmos_D_T(f2, df2, e_bisect, e_NR, -5, 5, n, 1.31);  %Starting [a,b] = [-5, 5]
    disp(result3(1:1, 2:6));
    

    % Display of errors for 1.5
    
    disp('-----------------------------------------------')
    disp(' Display of errors for 1.5')
    disp('-----------------------------------------------')

    disp('Function f1 and root of -1')
    disp('      n         e_n      e_n/e_n-1')
    disp(result1(3:end, 1:end)')
    disp('-----------------------------------------------')

    disp('Function f1 and root of 2')
    disp('      n         e_n      e_n/e_n-1')
    disp(result2(3:end, 1:end)')
    disp('-----------------------------------------------')

    disp('Function f2')
    disp('      n         e_n      e_n/e_n-1')
    disp(result3(3:end, 1:end)')
    disp('-----------------------------------------------')


  case 3
  
    x=-7:0.1:7; %Some random range for x 
    y1=((x+1).^3).*(x-2);
    y2=exp(x) - x.^2 - 2;
    graph_3(x,y1,y2);  
    disp('Graphs can be seen at Figure 1 window')
  
end


