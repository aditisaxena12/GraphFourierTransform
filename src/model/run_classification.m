
% Initialize results
classifiers = {'k-NN', 'Random Forest', 'Logistic Regression', 'SVM', 'Naive Bayes', 'Neural Network'};
accuracies = zeros(1, length(classifiers));

% Run classifiers
accuracies(1) = knn_classifier();
accuracies(2) = random_forest_classifier();
accuracies(3) = logistic_regression_classifier();
accuracies(4) = svm_classifier();
accuracies(5) = naive_bayes_classifier();
accuracies(6) = neural_network_classifier();
% 
% Display accuracies
disp('Classifier Accuracies:');
disp(array2table(accuracies, 'VariableNames', classifiers));

% Plot accuracies
figure;
bar(accuracies);
set(gca, 'XTickLabel', classifiers, 'XTick', 1:length(classifiers));
xlabel('Classifiers');
ylabel('Accuracy');
title('Classifier Accuracy Comparison');
grid on;
