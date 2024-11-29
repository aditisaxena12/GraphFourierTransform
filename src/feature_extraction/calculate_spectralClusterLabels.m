function gamma = calculate_spectralClusterLabels(L,k)
    % Unique Spectral Cluster Labels
    % Inputs:
    %   L - Laplacian Matrix
    %   k - Number of Clusters
    % Output:
    %   gamma - Unique Spectral Labels
    % Eigenvalue Decomposition of L
    [eigVecs, eigVals] = eig(L);

    % Select k Smallest Eigenvectors
    [~, indices] = sort(diag(eigVals)); % Sort eigenvalues
    U = eigVecs(:, indices(1:k)); % Select k smallest eigenvectors

    % Apply K-means Clustering
    labels = kmeans(U, k);

    % Compute Unique Spectral Cluster Labels (γ)
    gamma = numel(unique(labels));


    disp(['Cluster Labels: ', mat2str(labels)]);
    disp(['Unique Spectral Cluster Labels (γ): ', num2str(gamma)]);
end
%calculate_Unique_Spectral_Cluster_Labels([1, 2, 3; 4, 5, 6; 7, 8, 9],2); %Example to check