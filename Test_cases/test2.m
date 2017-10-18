% test2.m
%
% Test that the simplex method code takes a correct step
% when the form is slightly more complicated.  
%
 
clear;

A =[-4     1     0    -3    -3    -5;
     1    -2    -1    -2    -2     3;
     1     2     4     7     7    -1];

b=[-2;-6; 17];

c=[1 1 1 2 5 1];

iB=[1 2 3];
iN=[4 5 6];
xB=[1 2 3]';


% take a step
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
