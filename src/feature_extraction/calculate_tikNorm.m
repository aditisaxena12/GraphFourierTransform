function y = calculate_tikNorm(L, X)
    % Compute TikNorm
    % Inputs:
    %   L - Graph Laplacian matrix (N x N)
    %   X - Data matrix (N x M)
    % Output:
    %   y - TikNorm value
    
    % Compute P = L * X
    P = L * X;
    
    % Compute Hadamard product
    H = X .* P; % Element-wise multiplication
    
    % Sum of squared elements of H
    y = sum(H(:).^2);
end
