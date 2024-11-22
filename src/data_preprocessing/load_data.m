function eeg_data = load_data(filepath)
    % Load EEG data in .set format
    % Input: filepath - Path to the .set file
    % Output: eeg_data - Loaded EEG data structure
    
    % Load EEGLAB data
    eeglab; % Initialize EEGLAB
    eeg_data = pop_loadset(filepath);
    fprintf('Data loaded from %s\n', filepath);
end
