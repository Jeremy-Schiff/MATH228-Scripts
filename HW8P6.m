clear;
matrix_size = 10;
A = randn(matrix_size,matrix_size) - 2*eye(matrix_size);
alpha = max(real(eig(A)));
time_scale = 0.01;
indices = [1:20/time_scale];
x = indices * time_scale;
for index = indices
    t = index * time_scale;
    y_1(index) = expm(t*alpha);
    y_2(index) = norm(expm(t*A));
end
figure;
semilogy(x,y_1);
hold;
semilogy(x,y_2);
eig(A)

