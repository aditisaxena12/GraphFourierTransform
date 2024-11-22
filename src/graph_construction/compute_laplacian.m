function L = compute_laplacian(W)
    % Perform laplacian computation
    % Input: W - adjacency matrix
    % Output: L - laplacian matrix

    % Compute D - diagonal degree matrix
    D = diag(sum(W, 2));

    % Compute the Laplacian L
    L = D - W;

end