function ica_data = ica_decomposition(eeg_data)
    % Perform ICA decomposition
    % Input: eeg_data - Preprocessed EEG data
    % Output: ica_data - EEG data with ICA components
    
    eeg_data = pop_runica(eeg_data, 'extended', 1, 'interupt', 'on');
    fprintf('ICA decomposition completed.\n');
    ica_data = eeg_data;
end
