function r = calculate_stationaryRatio(L, X_GDFT)
    % Compute Stationary Ratio
    % Inputs:
    %   L - Graph Laplacian matrix (N x N)
    %   X_GDFT - GDFT of data matrix (N x M)
    % Output:
    %   r - Stationary ratio
    
    % Eigen decomposition of L
    [U, ~] = eig(L);
    
    % Covariance matrix of X_GDFT
    C = cov(X_GDFT'); % Covariance (transpose ensures correct orientation)
    
    % Project C onto the space of L's eigenvectors
    T = U' * C * U; 
    
    % Compute Frobenius norm of T
    norm_F = norm(T, 'fro');
    
    % Compute 2-norm of diagonal of T
    norm_diag = norm(diag(T), 2);
    
    % Stationary Ratio
    r = norm_diag / norm_F;
end
