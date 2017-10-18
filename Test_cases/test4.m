% test4.m
%
% Bland's rule pivot rule test.
% 

clear;

% start with a tableau form
A1 = [1 1 2; 1 1 1; 1 1 1];

A = [eye(3) A1];
b = [1;2;3];

iB=[1 2 3];
iN=[4 5 6];
xB=b;

c=[0 0 0 -1 -2 1];

% form an invertible matrix B and modify the problem
B=[4 1 0; 1 -2 -1; 1 2 4];
A=B*A;
b=B*b;

% modify c
N=A(:,iN);
c1=[1 1 1];
c2=c1*B^(-1)*N+c(iN);

% take a step with Bland's rule
irule=1;
[istatus,iB,iN,xB] = simplex_step(A,b,c,iB,iN,xB,irule);

X = zeros(6,1);
X(iB) = xB;

if (istatus ~= 0)
   fprintf('INCORRECT ISTATUS!\n');
end

if (norm(X-[0;1;2;1;0;0]) > 1e-10)
   fprintf('INCORRECT STEP!\n');
end

if (norm(sort(iN)-[1 5 6]) > 1e-10)
   fprintf('iN incorrect!\n');
end

if (norm(sort(iB)-[2 3 4]) > 1e-10)
   fprintf('iB incorrect!\n');
end


