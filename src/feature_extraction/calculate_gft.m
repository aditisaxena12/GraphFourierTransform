function [X_GDFT, U] = calculate_gft(L, X)
    % Compute Graph Discrete Fourier Transform (GDFT)
    % Inputs:
    %   L - Graph Laplacian matrix (N x N)
    %   X - Data matrix (N x M)
    % Output:
    %   X_GDFT - GDFT of the data matrix
    %   U      - Eigenvectors matrix
    
    % Ensure L is symmetric and numeric
    if ~ismatrix(L) || ~isnumeric(L)
        error('L must be a numeric Laplacian matrix.');
    end

    % Eigen decomposition
    [U, ~] = eig(L);

    % Ensure X is numeric
    if ~ismatrix(X) || ~isnumeric(X)
        error('X must be a numeric data matrix.');
    end

    % Compute GDFT
    X_GDFT = U' * X; % U^T * X
end
