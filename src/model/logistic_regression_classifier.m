function [accuracy, precision, recall, f1_score] = logistic_regression_classifier()
    [X_train, X_test, y_train, y_test] = split_data();
     % Train logistic regression model
    % MATLAB expects labels to be categorical for multinomial regression
    y_train_categorical = categorical(y_train);
    coefficients = mnrfit(X_train, y_train_categorical);

    % Predict probabilities for test data
    y_pred_probs = mnrval(coefficients, X_test);

    % Determine predicted labels
    [~, y_pred] = max(y_pred_probs, [], 2);

    % Calculate confusion matrix
    conf_matrix = confusionmat(y_test, y_pred);
    
    % Calculate metrics
    [accuracy, precision, recall, f1_score] = calculate_metrics(conf_matrix);
end
