function x = coleman_sun(A, b)
% COLEMAN_SUN Solves for x in Ax=b via Coleman and Sun's 2010 algorithm.
% On a high level, their algorithm makes use of a Taylor series
% approximation to find the minimum norm least squares solution. This
% approach is well-suited for sparse matrices A that are rank deficient.
%
% Inputs:
% A - a m x n matrix with real entries
% b - a 1 x m matrix with real entries
%
% Outputs:
% x - the minimum norm least squares solution
threshhold = 0.001;
beta = 0.00025;
[Q, R] = qr(A);
diagonal_entries = abs(diag(R));
diagonal_entries(diagonal_entries==0) = [];
w_max = max(diagonal_entries);
w_min = min(diagonal_entries);
lambda = beta * (w_min * w_min / w_max / w_max) * (w_max * w_max + 1) / 2;
M = A' * A;
d = A' * b;
multiplicative_coefficient = (M + lambda * eye(size(M)))^(-1);
current_x = multiplicative_coefficient * d;
current_t = current_x;
while normest(current_t) / normest(current_x) > threshhold
    t = lambda * current_t;
    current_t = multiplicative_coefficient * t;
    current_x = current_x + current_t;
end
x = current_x;