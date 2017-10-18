% test8.m
%
% Tough initialization.  This one should only work if
% you've done the extra credit.
%

clear;

% first form an invertible matrix
R = [4 1 1; -1 2 1; 1 1 -1];

% form a vector b which is in the span of 2 vectors of R
b=R*[1; 2; 0];

B=[1 1 1; 1 1 0; 1 0 0];
A = [R B];

% form a random permutation
p=randperm(6);
A=A(:,p);

% c doesn't matter for this test
c=[-1 -1 -1 -1 -1 -1];

[istatus,iB,iN,xB] = simplex_init(A,b,c);

if (istatus~=0) 
   fprintf('looks like you did not do the extra credit!\n');
end

% test feasibility
X = zeros(6,1);
X(iB)=xB;

if (norm(A*X-b) > eps)
   fprintf('NOT FEASIBLE!!!\n');
end

if (min(X) < 0)
   fprintf('NOT FEASIBLE!!!\n');
end

% test that we have a basis
if (rcond(A(:,iB)) > 1.0e6)
   fprintf('NOT BASIC!!!\n');
end

