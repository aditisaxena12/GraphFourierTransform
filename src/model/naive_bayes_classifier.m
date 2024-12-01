function accuracy = naive_bayes_classifier()
    [X_train, X_test, y_train, y_test] = split_data();
    % Remove zero-variance features from training and testing data
    variance = var(X_train, 0, 1);  % Variance of each feature
    non_zero_variance_indices = variance > 0;  % Indices of non-zero variance features
    X_train = X_train(:, non_zero_variance_indices);
    X_test = X_test(:, non_zero_variance_indices);

    % Train Naive Bayes model
    model = fitcnb(X_train, y_train);

    % Predict on the test set
    y_pred = predict(model, X_test);

    % Calculate accuracy
    accuracy = sum(y_pred == y_test) / length(y_test);
end
