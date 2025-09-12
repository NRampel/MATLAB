function[Q_vec] = RLS_estimation(mat_A, mat_R, Y_seq)

    %Getting dimensions (n) and time (k_plus1)
    [n, k_plus1] = size(Y_seq); 

    %Initialize error covariance matrix as an identity
    P = eye(n); 
    R_inv = inv(mat_R); 
    q_vec_prev = zeros(n,1); 
    Q_vec = zeros(n, k_plus1); 

    for t = 1:k_plus1
        y = Y_seq(:,t); 
        K = P * mat_A' * inv(mat_A * P * mat_A' + mat_R); 
        P = R_inv - K * mat_A * R_inv * P; 
        e = y - mat_A * q_vec_prev; 
        q_vec_est = q_vec_prev + K * e; 
        Q_vec(:,t) = q_vec_est; 
        q_vec_prev = q_vec_est; 
    end 

end
