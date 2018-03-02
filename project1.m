% We will compare a random sparse rank-deficient m x n least squares
% problem using coleman and sun's algorithm and the SVD
m = 1000;
n = 4000;
density = 0.005;
A = sprand(m,n,density);
b = randn(m);
tic
[U,S,V] = svds(A, min(size(A)));
x_svd = V * S^(-1) * U' * b;
toc
tic
x_cs = coleman_sun(A, b);
toc
log(norm(A * x_cs - b))
log(norm(A * x_svd - b))