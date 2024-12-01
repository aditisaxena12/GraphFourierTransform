% Base directory containing EEG files
base_dir = '/Users/aditisaxena/Documents/coursework/Digital Signal Processing/Project/GFT/GraphFourierTransform';
eeg_dir = fullfile(base_dir, 'data', 'ProcessedMATFiles');

% Path to the PARTICIPANTS.TSV file
participants_file = '/Users/aditisaxena/Documents/coursework/Digital Signal Processing/Project/GFT/GraphFourierTransform/data/Data-OpenNeuro/ds004504-1.0.8/participants.tsv';

% Add required paths
addpath(fullfile(base_dir, 'data_preprocessing'));
addpath(fullfile(base_dir, 'graph_construction'));

% Read the file into a table
participants = readtable(participants_file, 'FileType', 'text', 'Delimiter', '\t');

disp(participants);

num_participants = height(participants);

% Map Group to numeric labels
% 'A' -> 0, 'F' -> 1, 'C' -> 2
labels_array = zeros(num_participants, 1);

% Initialize feature matrix (rows: files, columns: features)
% Example: [Stationary Ratio, TikNorm, Total Variation, Graph Energy, ...]
% Adjust the number of features based on your implementation
num_features = 11; % Adjust based on features being computed
feature_matrix = zeros(num_participants, num_features);

% Loop through each EEG file and compute features
for i = 1:height(participants)
    % Load the EEG file
    filename = participants.participant_id{i}+"_task-eyesclosed_eeg.mat";
    file = fullfile(eeg_dir, filename);
    
    % Display progress
    fprintf('Processing file %d of %d: %s\n', i, height(participants), filename);
    
    % Graph construction and signal extraction
    [X, W, L] = graph_construction(file);
    D = diag(sum(W, 2));
    
    % Compute features
    % 1. Stationary Ratio
    [X_GDFT, U] = calculate_gft(L, X);
    stationary_ratio = calculate_stationaryRatio(L, X_GDFT);
    
    % 2. TikNorm
    tiknorm = calculate_tikNorm(L, X);
    
    % 3. Total Variation
    tv = calculate_totalVariation(X, W);
    
    % 4. Graph Energy
    energy = calculate_graphEnergy(L);
    
    % 5. Spectral Entropy
    H = calculate_spectralEntropy(U);
    
    % 6. Signal Energy
    beta = calculate_signalEnergy(X);
    
    % 7. Signal Power
    sigma_square = calculate_signalPower(X);
    
    % 8. Spectral Cluster Labels (using k = 5 as an example)
    k = 5;
    gamma = calculate_spectralClusterLabels(L, k);
    
    % 9. Average Degree
    mu_D = calculate_averageDegree(D);
    
    % 10. Heat Trace
    h = calculate_heatTrace(L);
    
    % 11. Diffusion Distance
    h_prime = calculate_diffusionDistance(L);
    
    % Store features in matrix
    feature_matrix(i, :) = [
        stationary_ratio, tiknorm, tv, energy, ...
        H, beta, sigma_square, gamma, ...
        mu_D, h, h_prime
    ];

    switch participants.Group{i}
        case 'A'
            labels_array(i) = 0; % Alzheimer's
        case 'F'
            labels_array(i) = 1; % Frontal Dementia
        case 'C'
            labels_array(i) = 2; % Healthy
    end
end


% Save feature matrix to a file
output_file = fullfile(base_dir,'data','feature_matrix.mat');
save(output_file, 'feature_matrix');

% Display completion message
disp('Feature extraction completed. Features saved to:');
disp(output_file);

% Save labels matrix to a file
output_labels = fullfile(base_dir,'data','labels_array.mat');
save(output_labels, 'labels_array');

% Display completion message
disp('Labels extraction completed. Labels saved to:');
disp(output_labels);

