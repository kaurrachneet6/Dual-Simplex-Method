% test10.m
%
% An infeasible input to simplex method.
%

clear;

% first form an invertible matrix
R = [4 1 1; 1 2 1; 1 1 1];

% form a vector b which is in the span of R
b=R*[1; -4; -1];

B=[1 1 1; 1 1 0; 1 0 0];
A = [R B];

c=[-2 1 1 -1 -1 -1];


irule=1;
[istatus,X,eta,iB,iN,xB] = simplex_method(A,b,c,irule);

if (istatus~=4)
   fprintf('istatus is wrong\n');
end

