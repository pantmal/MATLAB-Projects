clear; clc;
disp('METHODOS SOR iterations-Peiramatiko');

%Getting the params
n = input("Enter size of array, n = ");
a = input("Enter value of a = ");
b = input("Enter value of b = ");

%Creating the A array
A = zeros(n);

%Main diagonal, etc
for i=1:n  
    A(i,i) = 4;
end

for i=2:n  
    A(i, i-1) = -a;
end

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
%idiotimes tou pinaka B (Jacobi)
    x=eig(B);   disp('x');   disp(x);
    rB=max(abs(x));  %m_up=rB
    disp(' rB'); disp( rB);
    
%    ipologismos omega
    disp('Methodos SOR');
    omega=2.0/(1.0+sqrt(1-rB*rB));

disp('*******************    SOR     *********************');
     fid611=fopen('SOR_iter.txt','a+');
    fprintf(fid611, 'w         iter    \n\n');
nm=0;col=0;   
for w=0.1:0.1:1.9
      
  nm=0; 
  x0=b;
  x1=x0; 
           
 tt=tic;  itcount=0;
 iter = itcount;
while itcount<=maxits
    x0=x1;
%    x1=inv(I-w*L)*((1-w)*I+w*U)*x0+w*inv(I-w*L)*D1*b; 
    x1=inv(I-omega*U)*((1-omega)*I+omega*L)*x0+omega*inv(I-omega*U)*D1*b;    %pros ta pisw SOR
  
   nm=norm(x1-x0, Inf); 
   if nm<tol  
      iter=itcount;
%      fprintf('siglisi se %d epanalipseis\n',iter);
       fprintf(fid611, '%f    %f    \n\n',w, iter);
       break;   
   end
       itcount=itcount+1;
    
 end% while

 %apothikeusi apotelesmaton se pinakes gia dimiourgia
                       %grafikis parastasis
                       col=col+1;
                       finw(col,1)=w;
                       finit(col,1)= iter;
                       %disp(finw);  disp(finit);                      
end  %for w
                    
                       % Dimiourgia grafikis parastasis
                       plot(finw, finit, 'r');
                       xlabel('\omega');              %  add axis labels and plot title
                       ylabel('iter');                %  add axis labels and plot title
                       title('Behavior of iterations with respect to \omega');
                       
                       
                        disp('Ypologismos elaxistou apo peiramatiko prosdiorismo');                    
                        [iterations, thesi]=min(finit);                       
                        wopt=finw(thesi,1); %disp('wopt'); disp(wopt);
                        % disp('iterations');disp(iterations);                       
                        %disp('thesi');disp(thesi);   
                        
%                        disp('ypologismos olon ton theseon me tin idia peiramatiki fasmatiki aktina');
                       thesi=find(finit==iterations);%disp('thesi');disp(thesi);
                       wopt=finw(thesi,1); %disp('wopt'); disp(wopt);

                       
if nm>tol
    disp('oxi siglisi meta apo'); disp(maxits); disp('epanalipseis');
end
e=toc(tt);
 disp('e=cputime');disp(e);
 
 
 disp('Peiramatika apotelesmata'); 
 disp('wopt'); disp(wopt);
 disp('iterations');disp(iterations);                       
 disp('thesi');disp(thesi);   
 
 
 disp('Beltistes parametroi');
 disp('omega'); disp(omega);

 fclose(fid611);   
