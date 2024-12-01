function accuracy = svm_classifier()
    [X_train, X_test, y_train, y_test] = split_data();
    % Train SVM model with Error-Correcting Output Codes (ECOC)
    model = fitcecoc(X_train, y_train, 'Learners', templateSVM('KernelFunction', 'linear', 'Standardize', true));

    % Predict on the test set
    y_pred = predict(model, X_test);

    % Calculate accuracy
    accuracy = sum(y_pred == y_test) / length(y_test);
end
