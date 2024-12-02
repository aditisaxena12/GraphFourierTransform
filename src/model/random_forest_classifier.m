function [accuracy, precision, recall, f1_score] = random_forest_classifier()
    [X_train, X_test, y_train, y_test] = split_data();
    model = TreeBagger(100, X_train, y_train, 'Method', 'classification'); % 100 trees
    y_pred = str2double(predict(model, X_test));
    % Calculate confusion matrix
    conf_matrix = confusionmat(y_test, y_pred);
    
    % Calculate metrics
    [accuracy, precision, recall, f1_score] = calculate_metrics(conf_matrix);
end
