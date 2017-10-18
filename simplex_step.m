function [istatus,iB,iN,xB,Binv] = simplex_step(A,b,c,iB,iN,xB,irule)
    Binv = (A(:,iB))^(-1)   %finding inverse of basis matrix B
    A=Binv*A
    b= Binv*b
    rc = c(iN) - c(1,iB)*A(:,iN)   %calculating reduced costs
    negrc = [find(rc<0); rc(rc<0)]   %calculating negative reduced costs
    if isempty(negrc)
        istatus = -1
        return
    end
    if (irule==0)   %Most Negative rule
        [redc,j1] = min(negrc(2,:))   %Computing the most negative reduced cost and pivoting column 
        j = negrc(1,j1)   %Pivot Coloumn
    elseif irule==1   % Bland's Rule
        j1=negrc(:,1)  %Computing the first negative reduced cost and pivoting column
        j=j1(1,1)   %Pivot Coloumn
        redc = j1(2,1)   %first negative reduced cost
    end
    j
    iN(j)
    x=A(:,iN(j))
pospc = [(find(A(:,iN(j))>1e-10))'; (A(A(:,iN(j))>1e-10,iN(j)))']  
if isempty(pospc)
    istatus = 16
    return
end
[minratio,i] = min((xB(pospc(1,:)))'./pospc(2,:))

A = pivot_step(A,iB(i),iN(j))
Binv = (A(:,iB))
xB= Binv*b
t = iB(i)
iB(i) = iN(j)
iN(j) = t


 if any(xB==0)
 else
     istatus = 0
 end
end