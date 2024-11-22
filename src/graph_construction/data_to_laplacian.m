function L = data_to_laplcian()

% Step 1 - Load data and make it into a matrix
X = create_EEGmatrix();

% Step 2 - use this matrix X to create the Graph and return the adjacency
% matrix
W = construct_graph(X);

% Step 3 - use the adjacency matrix to compute the laplacian
L = compute_laplacian(W);


end