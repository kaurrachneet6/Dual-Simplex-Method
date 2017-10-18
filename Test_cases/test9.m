% test9.m
%
% Solve a simplex method problem test.
%

clear;

% first form an invertible matrix
R = [4 1 1; -1 2 1; 1 1 -1];

% form a vector b which is in the span of R
b=R*[1; 2; 1];

B=[1 1 1; 1 1 0; 1 0 0];
A = [R B];

p = randperm(6);
A=A(:,p);

c=[-2 1 1 -1 -1 -1];
c=c(p);


% test
irule=0;
[istatus,X,eta,iB,iN,xB] = simplex_method(A,b,c,irule);

%return;

if (istatus~=0)
   fprintf('istatus is wrong\n');
end

[X,eta,isfeasible,isoptimal,zN]=simplex_test(A,b,c,iB,xB)

if (isfeasible ~= 1)
   fprintf('your solution is not feasible!!!\n');
end


if (isoptimal ~= 1)
   fprintf('your solution is not optimal!!!\n');
end


