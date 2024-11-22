function energy = calculate_graphEnergy(L)
    % Graph Energy (E(G))
    % Inputs:
    %   L - Laplacian matrix
    % Output:
    %   energy - Graph energy

    % Compute eigenvalues of Laplacian
    eigenvalues = eig(L);
    
    % Compute graph energy
    energy = sum(abs(eigenvalues));

    fprintf('Graph Energy (E(G)): %.4f\n', energy);
end
