%% Loading and saving all data from the OpenNeuro dataset (ds004504). The data will be saved in .mat format for further processing in MATLAB.
outputFolder = '/Users/aditisaxena/Documents/coursework/Digital Signal Processing/Project/GFT/GraphFourierTransform/data/Data-OpenNeuro/ds004504-1.0.8/derivatives'; % Folder to store the dataset


% Locate all .set files in the extracted dataset
disp('Searching for .set files...');
setFiles = dir(fullfile(outputFolder, '**', '*.set'));
disp(['Found ', num2str(length(setFiles)), ' .set files.']); % should be 88 

%% Initialize EEGLAB
eeglab;

% Load each .set file and save its content in .mat format
matSaveFolder = fullfile(outputFolder, 'ProcessedMATFiles'); % Folder for .mat files
if ~exist(matSaveFolder, 'dir')
    mkdir(matSaveFolder);
end

disp('Processing and saving .set files...');
for i = 1:length(setFiles)
    % Get full path to the .set file
    setFilePath = fullfile(setFiles(i).folder, setFiles(i).name);
    
    % Load the .set file
    EEG = pop_loadset('filename', setFiles(i).name, 'filepath', setFiles(i).folder);
    
    % Display basic information about the dataset
    disp(['Processing: ', setFiles(i).name]);
    disp(['  Number of Channels: ', num2str(EEG.nbchan)]);
    disp(['  Sampling Rate: ', num2str(EEG.srate), ' Hz']);
    disp(['  Number of Data Points: ', num2str(EEG.pnts)]);
    disp(['  Duration: ', num2str(EEG.xmax), ' seconds']);
    disp(['  Number of Trials: ', num2str(EEG.trials)]);
    
    % Save the EEG data and metadata in a .mat file
    matFileName = fullfile(matSaveFolder, [setFiles(i).name(1:end-4), '.mat']); % Replace .set with .mat
    save(matFileName, 'EEG', '-v7.3'); % Save in MATLAB format (supports large files)
    disp(['  Saved as: ', matFileName]);
end

disp('All .set files processed and saved as .mat files.');