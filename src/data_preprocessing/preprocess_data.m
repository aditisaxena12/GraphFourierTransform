%% Loading and saving all data from the OpenNeuro dataset (ds004504). The data will be saved in .mat format for further processing in MATLAB.
dataFolder = '/Users/aditisaxena/Documents/coursework/Digital Signal Processing/Project/GFT/GraphFourierTransform/data/Data-OpenNeuro/ds004504-1.0.8'; % Folder to store the dataset
outputFolder = '/Users/aditisaxena/Documents/coursework/Digital Signal Processing/Project/GFT/GraphFourierTransform/data'; % Folder to store the processed dataset


% Locate all .set files in the extracted dataset
disp('Searching for .set files...');
setFiles = dir(fullfile(dataFolder, 'sub-*', 'eeg', '*.set'));
disp(['Found ', num2str(length(setFiles) ), ' .set files.']); % should be 88 

%% Initialize EEGLAB
eeglab;

% Load each .set file and save its content in .mat format after
% preprocessing
matSaveFolder = fullfile(outputFolder, 'ProcessedMATFiles'); % Folder for .mat files
if ~exist(matSaveFolder, 'dir')
    mkdir(matSaveFolder);
end

% Load the preprocessing parameters
params = preprocessing_params();

disp('Processing and saving .set files...');
for i = 1:length(setFiles)
    % Get full path to the .set file
    setFilePath = fullfile(setFiles(i).folder, setFiles(i).name);
    
    % Step 1: Load data
    eeg_data = load_data(setFilePath);
    
    % Step 2: Filter data
    eeg_data = butterworth_filter(eeg_data, params.low_cutoff, ...
                                  params.high_cutoff, params.sampling_rate);
    
    % Step 3: Remove artifacts
    eeg_data = artifact_removal(eeg_data, params.asr_threshold);
    
    % Step 4: ICA
    eeg_data = ica_decomposition(eeg_data);
    
    % Step 5: Re-reference
    eeg_data = re_reference(eeg_data, params.ref_channels);
    
    % Save the EEG data and metadata in a .mat file
    matFileName = fullfile(matSaveFolder, [setFiles(i).name(1:end-4), '.mat']); % Replace .set with .mat
    save(matFileName, 'eeg_data', '-v7.3'); % Save in MATLAB format (supports large files)
    disp(['  Saved as: ', matFileName]);
end

disp('All .set files processed and saved as .mat files.');
