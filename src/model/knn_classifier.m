function accuracy = knn_classifier()
    [X_train, X_test, y_train, y_test] = split_data();
    k = 5; % Number of neighbors
    model = fitcknn(X_train, y_train, 'NumNeighbors', k);
    y_pred = predict(model, X_test);
    accuracy = sum(y_pred == y_test) / length(y_test);
end
