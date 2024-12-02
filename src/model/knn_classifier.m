function [accuracy, precision, recall, f1_score] = knn_classifier()
    [X_train, X_test, y_train, y_test] = split_data();
    k = 5; % Number of neighbors
    model = fitcknn(X_train, y_train, 'NumNeighbors', k);
    y_pred = predict(model, X_test);
    % Calculate confusion matrix
    conf_matrix = confusionmat(y_test, y_pred);
    
    % Calculate metrics
    [accuracy, precision, recall, f1_score] = calculate_metrics(conf_matrix);
end
