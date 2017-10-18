% test1.m
%
% Test simplex_method.m by making sure that it takes a single
% step correctly.  This script uses a simple Tableau form.
%

clear;

% start with a Tableau form
A1 = [1 1 1; 1 1 -1; 1 1 0];

A = [eye(3) A1];
b = [1;2;3;];

iB=[1 2 3];
iN=[4 5 6];
xB=b;

c=[0 0 0 -1 2 1];

% test a step in this extremely simple state
irule=0;
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

