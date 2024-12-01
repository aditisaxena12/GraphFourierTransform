function [X_train, X_test, y_train, y_test] = split_train_test(feature_matrix_file, labels_file, test_ratio)
    % SPLIT_TRAIN_TEST - Load feature matrix and labels, shuffle, and split into training and testing sets.
    %
    % Inputs:
    %   feature_matrix_file - Path to the .mat file containing the feature matrix.
    %   labels_file - Path to the .mat file containing the labels array.
    %   test_ratio - Ratio of the data to be used for testing (e.g., 0.2 for 20% test set).
    %
    % Outputs:
    %   X_train - Training feature matrix.
    %   X_test - Testing feature matrix.
    %   y_train - Training labels.
    %   y_test - Testing labels.

    info = whos('-file', feature_matrix_file);
    disp(info);

    % Load the feature matrix and labels
    load(feature_matrix_file, 'feature_matrix'); % Assumes feature matrix is saved as a table
    load(labels_file, 'labels_array');         % Assumes labels are saved as a numeric array

    % Ensure labels and features are consistent
    if size(feature_matrix, 1) ~= length(labels_array)
        error('Feature matrix and labels array dimensions do not match.');
    end

    % Shuffle the data
    num_samples = size(feature_matrix, 1);
    perm = randperm(num_samples);
    feature_matrix = feature_matrix(perm, :);
    labels_array = labels_array(perm);

    % Split data into training and testing sets
    num_test = round(test_ratio * num_samples);
    num_train = num_samples - num_test;

    X_train = feature_matrix(1:num_train, :);
    y_train = labels_array(1:num_train);
    X_test = feature_matrix(num_train+1:end, :);
    y_test = labels_array(num_train+1:end);
end
