function [accuracy, precision, recall, f1_score] = calculate_metrics(conf_matrix)
    % CALCULATE_METRICS computes performance metrics from a confusion matrix.
    %
    % Inputs:
    %   conf_matrix - Confusion matrix
    %
    % Outputs:
    %   accuracy - Overall accuracy
    %   precision - Per-class precision
    %   recall - Per-class recall
    %   f1_score - Per-class F1 score

    % Total samples
    total_samples = sum(conf_matrix(:));

    % Accuracy
    accuracy = trace(conf_matrix) / total_samples;

    % Per-class metrics
    precision = diag(conf_matrix) ./ sum(conf_matrix, 1)'; % True Positives / (True Positives + False Positives)
    recall = diag(conf_matrix) ./ sum(conf_matrix, 2);    % True Positives / (True Positives + False Negatives)

    % Handle NaN cases (division by zero)
    precision(isnan(precision)) = 0;
    recall(isnan(recall)) = 0;

    % F1 score
    f1_score = 2 * (precision .* recall) ./ (precision + recall);
    f1_score(isnan(f1_score)) = 0; % Handle NaN cases
end
