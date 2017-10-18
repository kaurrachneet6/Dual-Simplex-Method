function A = pivot_step(A,i,j)
[n,m] = size(A);

A(i,:) = A(i,:)/A(i,j);

for k=1:n
   if k~= i
	A(k,:)=A(k,:)-A(k,j)*A(i,:);
   end
end
