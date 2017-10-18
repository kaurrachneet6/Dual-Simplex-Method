% test7.m
%
% Feasible initialization test.
%

clear;
eps=1.0e-10;

% first form an invertible matrix
R = [4 1 1; -1 2 1; 1 1 -1];

% form a vector b which is in the span of R
b=R*abs(randn(3,1));
%b=R*[1; 2; 1];

B=[1 1 1; 1 1 0; 1 0 0];
A = [R B];

%R(:,1:2)*randn(2,12)];

% form a random permutation
p=randperm(6);
A=A(:,p);

% c doesn't matter for this test
c=[-1 -1 -1 -1 -1 -1];

[istatus,iB,iN,xB] = simplex_init(A,b,c);

X = zeros(6,1);
X(iB)=xB;

if (istatus~=0) 
   fprintf('istatus wrong!\n');
end

% test feasibility
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

