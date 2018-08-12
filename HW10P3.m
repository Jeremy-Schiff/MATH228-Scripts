clear;
T = randn(5, 5);
M = [4, 0, 0, 0, 0; 0, -4, 0, 0, 0; 0, 0, 3, 0, 0; 0, 0, 0, -2, 0; 0, 0, 0, 0, -1];
A = T * M * inv(T);
v_not = randn(5);
j_values = [1:30];
for j = j_values
    v_j = A^j * v_not;
    v_j1 = A^(j+1) * v_not;
    u_j = (4*v_j + v_j1)/norm(4*v_j + v_j1);
    w_j = (-1)^j*(4*v_j - v_j1)/norm(4*v_j - v_j1); 
    u(j) = norm(A*u_j-4 * u_j);
    w(j) = norm(A*w_j+4 * w_j);
    v_norm = v_j/norm(v_j);
    v(j) = v_norm(1);
end
figure;
plot(j_values, u, 'y');
hold;
plot(j_values, w, 'm');
plot(j_values, v, 'c');