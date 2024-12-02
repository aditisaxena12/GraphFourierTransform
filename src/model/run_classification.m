% File to run all classification models

% Initialize results
num_classifiers = 6;
classifiers = {'k-NN', 'Random Forest', 'Logistic Regression', 'SVM', 'Naive Bayes', 'Neural Network'};
metrics = struct('accuracy', zeros(num_classifiers, 1), ...
                 'precision', {}, ...
                 'recall', {}, ...
                 'f1_score', {});


% Evaluate classifiers
[metrics(1).accuracy, metrics(1).precision, metrics(1).recall, metrics(1).f1_score] = logistic_regression_classifier();
[metrics(2).accuracy, metrics(2).precision, metrics(2).recall, metrics(2).f1_score] = svm_classifier();
[metrics(3).accuracy, metrics(3).precision, metrics(3).recall, metrics(3).f1_score] = naive_bayes_classifier();
[metrics(4).accuracy, metrics(4).precision, metrics(4).recall, metrics(4).f1_score] = knn_classifier();
[metrics(5).accuracy, metrics(5).precision, metrics(5).recall, metrics(5).f1_score] = random_forest_classifier();
[metrics(6).accuracy, metrics(6).precision, metrics(6).recall, metrics(6).f1_score] = neural_network_classifier();

% Display results
for i = 1:num_classifiers
    fprintf('\nClassifier: %s\n', classifiers{i});
    fprintf('Accuracy: %.2f\n', metrics(i).accuracy);
    fprintf('Precision: %.2f (average)\n', mean(metrics(i).precision));
    fprintf('Recall: %.2f (average)\n', mean(metrics(i).recall));
    fprintf('F1 Score: %.2f (average)\n', mean(metrics(i).f1_score));
end

% Plot accuracies
accuracies = [metrics.accuracy];
figure;
bar(accuracies);
set(gca, 'XTickLabel', classifiers, 'XTick', 1:length(classifiers));
xlabel('Classifiers');
ylabel('Accuracy');
title('Classifier Accuracy Comparison');
grid on;
