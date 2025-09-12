function[meas_vec] = measure_state(C_mat, noise_vec, state_vec)
%Inputs: C_mat, a general sensor matrix inputted by user
%noise_vec = A 4D vector that takes into account any 'noise' in the
%trajcectory, such as turbulence 
%state_vec = A vector that holds the sequence of state vectors
%Process: Firstly, the code will check if any element in the noise vector
%is 0 or less. If it is, then this code will not run. If the code is above
%0, the code will derive p and M by taking the size of the sensor matrix
%and the size of the state vector, and then create a random matrix using
%randn. It will also initialize the measured vector. Then in a loop from 1
%to M iterations, the code will use equation 2 to create the state vector
%of n elements. 
%Output: A measured vector with n elements. 

    %This will return an error if any element in the noise vec is 0 or less
    if any(noise_vec <= 0)
        err("standard deviations must be above 0"); 
    else

        %If not, the code will run its course, diagonolizing and setting
        %the p (number of sensors) as the size of C_mat, and then take the
        %amount of iterations by
        D = diag(noise_vec);  
        [p, ~] = size(C_mat); 
        [~, M] = size(state_vec); 
        W = randn(p, M); 
        meas_vec = zeros(p, M); 

        for n = 1:M
            meas_vec(:,n) = C_mat * state_vec(:,n) + D * W(:,n); 
        end
    end 
end
