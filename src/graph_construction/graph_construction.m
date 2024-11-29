function [X,W,L] = graph_construction(data_file_path)

% Step 1 - Load data and make it into a matrix
X = create_EEGmatrix(data_file_path);

% Step 2 - use this matrix X to create the Graph and return the adjacency
% matrix
W = construct_graph(X);

% Step 3 - use the adjacency matrix to compute the laplacian
L = compute_laplacian(W);


end