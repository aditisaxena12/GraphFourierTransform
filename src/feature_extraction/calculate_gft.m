function [X_GDFT, U] = calculate_gft(L, X)
    % Compute Graph Discrete Fourier Transform (GDFT)
    % Inputs:
    %   L - Graph Laplacian matrix (N x N)
    %   X - Data matrix (N x M)
    % Output:
    %   X_GDFT - GDFT of the data matrix
    %   U      - Eigenvectors matrix
    
    % Eigen decomposition of L
    [U, ~] = eig(L); % U: eigenvectors, ~: eigenvalues (not used)
    
    % Compute GDFT
    X_GDFT = U' * X; % U^T * X
end
