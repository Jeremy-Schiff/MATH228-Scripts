m = 1000;
n = 500;
density = 0.1;
A = sprand(m,n,density);
b = randn(m);
x_cs = coleman_sun(A, b);