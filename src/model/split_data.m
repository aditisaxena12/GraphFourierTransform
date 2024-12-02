function [X_train, X_test, y_train, y_test] = split_data()

base_dir = '/Users/aditisaxena/Documents/coursework/Digital Signal Processing/Project/GFT/GraphFourierTransform/data';

% File paths
feature_matrix_file = fullfile(base_dir,'/feature_matrix.mat');
labels_file = fullfile(base_dir,'/labels_array.mat');

% Test ratio (e.g., 20% for testing)
test_ratio = 0.1;

% Split data
[X_train, X_test, y_train, y_test] = split_train_test(feature_matrix_file, labels_file, test_ratio);

% Display results
disp('Training set size:');
disp(size(X_train, 1));
disp('Testing set size:');
disp(size(X_test, 1));

end