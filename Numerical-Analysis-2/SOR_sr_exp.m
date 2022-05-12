clear; clc;
disp('METHODOS SOR-Peiramatikos ipologismos fasmatikis aktinas');

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
 %disp('B');  disp(B);
%idiotimes tou pinaka B (Jacobi)
    x=eig(B);     disp(x);
    rB=max(abs(x));
    disp(' rB'); disp( rB);
    omega=2.0/(1.0+sqrt(1-rB*rB));
    disp('omega'); disp(omega);

     col=0;   maria=0;
     disp('*******************    SOR     *********************');
     fid61=fopen('SOR.txt','a+');
     fprintf(fid61, 'w         r    \n\n');
     for omega=0.0:0.1:2.0
                  
                   %L1=I-omega*L;
                   %disp(L1);
                   L1=I-omega*U;    %pros ta pisw SOR
                   
                   L1a=inv(L1);
                   %disp(L1a);                   
                   
                   D_W=L1a*((1-omega)*I+omega*L); %pros ta pisw SOR
                   %disp(D__W);
                   
                   lambda=eig(D_W);
                   s_SOR=max(abs(lambda));  
%                    disp('s_SOR'); disp(s_SOR);
                   fprintf(fid61, '%f       %f    \n\n',omega, s_SOR);
                   
                        %apothikeusi apotelesmaton se pinakes gia dimiourgia
                       %grafikis parastasis
                       col=col+1;
                       finw(col,1)=omega;
                       fins(col,1)=s_SOR;
                       %disp(finw);  disp(fins);
                       
                       plot(finw,fins,'r-');
                       xlabel('\omega');              %  add axis labels and plot title
                       ylabel('\rho(L_{\omega_0})');
                       title('Behavior of \rho(L_{\omega_0}) with respect to \omega');

                       disp('Ypologismos elaxistou apo peiramatiko prosdiorismo');                    
                      
                       [elaxS, thesi]=min(fins);                       
                        wopt=finw(thesi,1); disp('wopt'); disp(wopt);
                        disp('elaxS');disp(elaxS);                       
                        disp('thesi');disp(thesi);                            
                       
%                       ypologismos olon ton theseon me tin idia peiramatiki fasmatiki
%                        aktina
%                        thesi=find(fins==elaxS);disp('thesi');disp(thesi);
%                        wopt=finw(thesi,1); disp('wopt'); disp(wopt);
     
                        maria=maria+1; 
%                         disp(maria);
       
     end
     
        fclose(fid61);          
