m_values = [2, 4, 8,16,32,64,128,256,512,1024];
x_values = [0,0,0,0,0,0,0,0,0,0];
for i = [1:10]
    m = m_values(i);
    A = randn(m,m) /sqrt (m);
    x_values(i) = svds(A,1,'smallest')
end

figure;
plot(m_values, x_values, 'y');
hold;
