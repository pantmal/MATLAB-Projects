clear; clc;
disp('METHODOS SOR iterations');

%Getting the params
n = input("Enter size of array, n = ");
a = input("Enter value of a = ");
b = input("Enter value of b = ");

%Choosing the method
options = input('Choose between: 1 (for pros ta pisw SOR) or 2 (for e.m. SOR) or 3 (for e.m. GS) or 4 (for e.m. Jacobi): ');

%Creating the A array
A = zeros(n);

%Main diagonal
for i=1:n  
    A(i,i) = 4;
end

%Lower diagonal
for i=2:n  
    A(i, i-1) = -a;
end

%Upper diagonal
for i=1:n-1 
    A(i, i+1) = -b;
end

%The x vector
for i=1:n
    x(i) = 1;
end

x = x'
b = A*x
x0 = b
x1=x0;

%  disp('step0-x1');disp(x1);
%  disp('step0-x0');disp(x0);

%error defintion
tol=(1/2)*10^-6;

maxits=100;

itcount=0;

%And now creating the rest of the arrays

CL=-tril(A, -1);
%disp('CL');disp(CL);

CU=-triu(A, 1);
%disp('CU');disp(CU);


I=eye(n);
%disp(I);
D=diag(diag(A));
%disp('D');disp(D);

D1=inv(D);
%disp('D1'); disp(D1);

L=D1*CL;
%disp('L');disp(L);

U=D1*CU;
%disp('U');disp(U);

B=L+U;
%disp('B');  disp(B);

%idiotimes tou pinaka B (Jacobi)
    x=eig(B);     disp(x);
    rB=max(abs(x));
%     m_low=min(abs(x));
%     m_up=max(abs(x)); 
%     disp('m_low'); disp(m_low); disp(' m_up'); disp( m_up);
disp(' rB'); disp(rB);
%     omega=2.0/(1.0+sqrt(1-m_up*m_up));
     omega=2.0/(1.0+sqrt(1-rB*rB));
    disp('omega'); disp(omega);


 t=tic;
while itcount<=maxits
   x0=x1;
%    disp('x0'); disp(x0);
%    x1=(1-omega)*x0+omega*(L*x1+U*x0+D1*b);  

  %Applying the chosen method
  switch options
  
case 1
      x1=inv(I-omega*U)*((1-omega)*I+omega*L)*x0+omega*inv(I-omega*U)*D1*b;    %pros ta pisw SOR
    
case 2
  
      x1=inv(I-omega*L)*((1-omega)*I+omega*U)*x0+omega*inv(I-omega*L)*D1*b;     %e.m. sor
    
case 3
     x1=inv(I-L)*U*x0+inv(I-L)*D1*b;                 %Gauss - Seidel
    
case 4
  
   x1=(U+L)*x0;                                    %Jacobi
   
end

%   disp('step 1 - x1');disp(x1);
   nm=norm(x1-x0, Inf); 
%   disp('nm'); disp(nm);
   if nm<tol  
       iter=itcount;
       disp('siglisi se'); disp(iter); disp('epanalipseis'); 
      break;   
   end
   itcount=itcount+1;
%     disp('itcount'); disp(itcount);
%    disp('x0'); disp(x0);
end% while
% if nm<tol  
%        disp('siglisi se'); disp(itcount); disp('epanalipseis'); 
%    end
if nm>tol
    disp('oxi siglisi meta apo'); disp(maxits); disp('epanalipseis');
end
%disp('x1'); disp(x1);
e=toc(t);
disp('e=cputime');disp(e);



