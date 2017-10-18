% test6.m
%
% First initialization test: infeasible problem.
%

clear;

A = [1 1 1 2 1 3; 1 1 0 2 2 2; 1 0 0 12 1 1];
b = [-1; 3; -1];
c = [-1 -1 -1 -1 -1 -1];


[istatus,iB,iN,xB] = simplex_init(A,b,c);

if (istatus ~=16)
   fprintf('istauts WRONG!!!!\n');
end


A = [-A];
c = [c];

[istatus,iB,iN,xB] = simplex_init(A,b,c);

if (istatus ~=16)
   fprintf('istauts WRONG!!!!\n');
end

