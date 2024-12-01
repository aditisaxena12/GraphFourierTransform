function accuracy = random_forest_classifier()
    [X_train, X_test, y_train, y_test] = split_data();
    model = TreeBagger(100, X_train, y_train, 'Method', 'classification'); % 100 trees
    y_pred = str2double(predict(model, X_test));
    accuracy = sum(y_pred == y_test) / length(y_test);
end
