A = randn(1000, 1000);
penta = diag(diag(A,-2),-2) + diag(diag(A,-1),-1) + diag(diag(A)) + diag(diag(A,1),1) + diag(diag(A,2),2);
symm = (penta + penta')/2;
[V,D] = eig(symm);
V(abs(V) < 10^(-3))=0;
spy(V);