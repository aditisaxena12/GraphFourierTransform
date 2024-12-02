function [accuracy, precision, recall, f1_score] = svm_classifier()
    [X_train, X_test, y_train, y_test] = split_data();
    % Train SVM model with Error-Correcting Output Codes (ECOC)
    model = fitcecoc(X_train, y_train, 'Learners', templateSVM('KernelFunction', 'linear', 'Standardize', true));

    % Predict on the test set
    y_pred = predict(model, X_test);

    % Calculate confusion matrix
    conf_matrix = confusionmat(y_test, y_pred);
    
    % Calculate metrics
    [accuracy, precision, recall, f1_score] = calculate_metrics(conf_matrix);
end
