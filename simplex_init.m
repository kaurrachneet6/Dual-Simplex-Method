function [istatus,iB,iN, xB]=simplex_init(A,b,c)
b1=length(b)
c1=length(c)
A=[eye(b1) A]
c=[ones(1,b1) zeros(1,c1)]
irule=0
iB=[1:b1]
iN=[b1+1:b1+c1]
xB=b
[istatus,iB,iN,xB,Binv] = simplex_step(A,b,c,iB,iN,xB,irule)
if (istatus~=16)
    if(c(iB)*xB==0) 
        istatus=0
    else
        istatus=16
    end
else
    istatus=4
    
end
end
    