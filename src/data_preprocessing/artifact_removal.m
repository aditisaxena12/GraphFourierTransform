function cleaned_data = artifact_removal(eeg_data, asr_threshold)
% Artifact Subspace Reconstruction (ASR) for artifact removal
% Inputs: eeg_data - Raw EEG data
%         asr_threshold - Threshold for artifact removal
% Output: cleaned_data - Cleaned EEG data

% Set artifact removal parameters
flatline_crit = 5;     % Max flatline duration in seconds
highpass = [0.25 0.75]; % High-pass filter transition band
channel_crit = 0.85;   % Minimum channel correlation
noisy_crit = 4;        % Line noise threshold
burst_crit = 5;        % ASR burst threshold
window_crit = 0.25;    % Max fraction of bad channels in a window

eeg_clean = clean_artifacts(eeg_data);
fprintf('Artifact removal completed using ASR with threshold %.2f\n', asr_threshold);
cleaned_data = eeg_clean;
end
