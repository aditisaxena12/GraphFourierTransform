function accuracy = neural_network_classifier()
    % NEURAL_NETWORK_CLASSIFIER - Train and evaluate a neural network for classification.
    %
    % Inputs:
    %   feature_matrix_file - Path to the .mat file containing the feature matrix.
    %   labels_file - Path to the .mat file containing the labels array.
    %   test_ratio - Ratio of the data to be used for testing (e.g., 0.2 for 20% test set).
    %
    % Output:
    %   accuracy - Classification accuracy of the neural network model.

    % Split data into training and testing sets
    [X_train, X_test, y_train, y_test] = split_data();

    % Normalize the feature data
    X_train = normalize(X_train, 'range');
    X_test = normalize(X_test, 'range');

    % Convert labels to categorical for neural network
    y_train_categorical = categorical(y_train);
    y_test_categorical = categorical(y_test);

    % Define the neural network structure
    num_classes = numel(unique(y_train)); % Number of output classes
    hidden_layer_sizes = [10, 10]; % Example: Two hidden layers with 10 neurons each
    net = patternnet(hidden_layer_sizes);

    % Configure network training settings
    net.trainParam.showWindow = true; % Show training GUI
    net.trainParam.epochs = 100;     % Maximum epochs
    net.trainParam.goal = 0.01;      % Training goal (optional)

    % Train the neural network
    net = train(net, X_train', dummyvar(y_train_categorical)');

    % Test the network
    y_pred_probs = net(X_test'); % Network output probabilities
    [~, y_pred] = max(y_pred_probs', [], 2); % Predicted class labels

    % Calculate accuracy
    accuracy = sum(y_pred == y_test) / length(y_test);
end
