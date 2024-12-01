function accuracy = logistic_regression_classifier()
    [X_train, X_test, y_train, y_test] = split_data();
     % Train logistic regression model
    % MATLAB expects labels to be categorical for multinomial regression
    y_train_categorical = categorical(y_train);
    coefficients = mnrfit(X_train, y_train_categorical);

    % Predict probabilities for test data
    y_pred_probs = mnrval(coefficients, X_test);

    % Determine predicted labels
    [~, y_pred] = max(y_pred_probs, [], 2);

    % Calculate accuracy
    accuracy = sum(y_pred == y_test) / length(y_test);
end
