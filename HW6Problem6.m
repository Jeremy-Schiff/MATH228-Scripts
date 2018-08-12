number_iterations = 1000;
for n = [50, 100, 200, 400]
    max_q = 0;
    condition_of_max = 0;
    total_q = 0;
    total_condition = 0;
    for i = 1 : number_iterations
        A = zeros(n, n);
        for entry = 1 : n
            A(entry, entry) = -2;
            if entry ~= 1
                A(entry - 1, entry) = 1;
            end
            if entry ~= n
                A(entry + 1, entry) = 1;
            end
        end
        b = (sin(pi * (1:n) / (n + 1)))';
        A_tilde = A.*(1+10^(-8)*randn(n,n));
        x = A \ b;
        x_tilde = A_tilde \ b;
        q = norm(x-x_tilde)/norm(x)*norm(A)/norm(A-A_tilde);
        condition = cond(A_tilde);
        total_q = total_q + q;
        total_condition = condition + total_condition;
        if q > max_q
            max_q = q;
            condition_of_max = condition;
        end
    end
    avg_q = total_q / number_iterations;
    avq_condition = total_condition / number_iterations;
    fprintf(['For n=%d, the max q was %f with a condition number ' ...
    'of %f and the avg q was %f with a condition number of %f \n'], ...
    n, max_q, condition_of_max, avg_q, avq_condition);
end