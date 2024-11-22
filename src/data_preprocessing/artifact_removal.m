function cleaned_data = artifact_removal(eeg_data, asr_threshold)
    % Artifact Subspace Reconstruction (ASR) for artifact removal
    % Inputs: eeg_data - Raw EEG data (EEGLAB structure)
    %         asr_threshold - Threshold for artifact removal (default = 5)
    % Output: cleaned_data - Cleaned EEG data (EEGLAB structure)

    % Parameters for clean_artifacts
    flatline_crit = 5;          % Max flatline duration in seconds
    highpass = [0.25 0.75];     % High-pass filter transition band
    channel_crit = 0.85;        % Minimum channel correlation threshold
    noisy_crit = 4;             % Threshold for detecting noisy channels
    burst_crit = asr_threshold; % Threshold for ASR burst removal
    window_crit = 0.25;         % Max fraction of bad channels in a window

    % Apply artifact cleaning using clean_artifacts
    eeg_clean = clean_artifacts(eeg_data, ...
        'FlatlineCriterion', flatline_crit, ...
        'Highpass', highpass, ...
        'ChannelCriterion', channel_crit, ...
        'LineNoiseCriterion', noisy_crit, ...
        'BurstCriterion', burst_crit, ...
        'WindowCriterion', window_crit);

    fprintf('Artifact removal completed using ASR with threshold %.2f\n', asr_threshold);
    cleaned_data = eeg_clean;
end
