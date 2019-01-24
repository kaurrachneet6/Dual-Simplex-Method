function [finstat,X,eta,iB,iN,xB] = simplex_method(A,b,c,irule)
X = zeros(length(c),1);                         %initialising X                 
eta = 0;                                        %initialising cost
istatus = 0                                     %initialising istatus
[initstat,iB,iN, xB]=simplex_init(A,b,c)        %perform initialisation
if initstat == 0                                %proceed when initialisation is successful
    Binv = inv(A(:,iB))                         %Binv of feasible basis 
    while istatus == 0
     [istatus,iB,iN,xB, Binv] = simplex_step(A,b,c,iB,iN,xB,Binv,irule)
    end
    if istatus == -1                            %OPTIMAL SOLUTION OBTAINED
        finstat = 0
        X(iB) = xB;                             %optimal solution
        eta = c(iB)*xB                          %optimal cost
    elseif istatus == 16                        %UNBOUNDED SOLUTION BTAINED
        finstat = 32
    end
elseif initstat == 16                           %INFEASIBLE SOLUTION
    finstat = 4
else                                            %INITIALISATION FAILS
    finstat = 16
end
end