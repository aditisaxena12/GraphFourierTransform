function X = create_EEGmatrix(Preprocessed_SignalPath)
% function to load data files and construct matrix X of size (electrodes x discrete time series)
% Inputs -
% Preprocessed_SignalPath - The path of the EEG file of the participant
% Outputs -
% X - Matrix containing time signal corresponding to each electrode

% Load the .mat file
% Load the preprocessed EEG data
X_struct = load(Preprocessed_SignalPath);

X = X_struct.eeg_data.data;      % Access the first field or adjust as necessary

% Verify and display the dimensions
if isnumeric(X)
    fprintf('Extracted numeric matrix with dimensions: [%d electrodes × %d time points]\n', size(X, 1), size(X, 2));

    disp(size(X)); % Outputs: [number_of_electrodes × total_time_points]

end