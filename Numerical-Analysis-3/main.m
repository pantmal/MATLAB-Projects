clear;clc;

A = [16 -8 2 1; 2 -12 1 0; -1 1 -4 1; 0 -1 2 3];  %matrix A

n = size(A,1);

e = 0.5 * 10^(-6);                % tolerance/error

y0 = [1; 1; 1; 1]; %y0 vector

maxiters = 200;   % max iterations

%eigenvalues calculation 
[vectors, values] = eig(A);
eigvals = diag(values);
disp(eigvals);

%lamda1 and lamda4 defs
lamda1 = max(abs(eigvals));
lamda4 = min(abs(eigvals));

%Displays of real vals
fprintf('Real lambda1 = %.8f\n', lamda1);
fprintf('Real lambda4 = %.8f\n', lamda4);

disp('Real normalized eigen vectors = '); 
disp([(vectors(:,1) / norm(vectors(:,1), Inf)) ,   (vectors(:,2) / norm(vectors(:,2), Inf)) ,      (vectors(:,3) / norm(vectors(:,3), Inf)),      (vectors(:,4) / norm(vectors(:,4), Inf))]);
   
% Max eigenvalue
fprintf('    q1    |   iters   | lamda1  | eigenvector\n');
for q1 = lamda1-0.3 : -0.1 : lamda1-0.9
    [lamda1_approach, vector1, iters] = inverse_power_method(A, y0, q1, e, maxiters);
    fprintf('%.6f | %.8f | %5d | [%.6f %.6f %.6f %.6f]\n', q1, iters, lamda1_approach, transpose(vector1));
end

fprintf('\n');

% Min eigenvalue
fprintf('    q4    |  iters   | lamda4 | eigenvector\n');
for q4 = lamda4+0.3 : 0.1 : lamda4+0.9
    [lamda2_approach, vector2, iters] = inverse_power_method(A, y0, q4, e, maxiters);
    fprintf(' %.6f | %.8f | %5d | [%.6f %.6f %.6f %.6f]\n', q4, iters, lamda2_approach, transpose(vector2));
end
