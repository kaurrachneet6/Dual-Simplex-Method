% test10.m
%
% An infeasible input to simplex method.
%
clear;

% start with a tableau form
A1 = [-1 1 2; -1 1 1; 0 1 1];

A = [eye(3) A1];
b = [1;2;3];

iB=[1 2 3];
iN=[4 5 6];
xB=b;

c=[0 0 0 -1 2 1];

%[fval, X] = linprog(c',[],[],A,b,zeros(6,1),[])

% form an invertible matrix B and modify the problem
B=[4 1 0; 1 -2 -1; 1 2 4];
A=B*A;
b=B*b;

% modify c
N = A(:,iN);
c1=[1 1 0];
c2=c(4:6)+c1*B^(-1)*N;
c=[c1 c2];


irule=0;
[istatus,X,eta,iB,iN,xB] = simplex_method(A,b,c,irule);

if (istatus~=32)
   fprintf('istatus is wrong\n');
end

