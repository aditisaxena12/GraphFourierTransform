function filtered_data = butterworth_filter(eeg_data, low_cutoff, high_cutoff, sampling_rate)
    % Band-pass Butterworth filter
    % Inputs: eeg_data - Raw EEG data
    %         low_cutoff - Low cutoff frequency (Hz)
    %         high_cutoff - High cutoff frequency (Hz)
    %         sampling_rate - Sampling rate (Hz)
    % Output: filtered_data - Filtered EEG data
    
     % Set the cutoff frequencies
    if ~isempty(low_cutoff) && ~isempty(high_cutoff)
        % Band-pass filter
        filtered_data = pop_eegfiltnew(eeg_data, low_cutoff, high_cutoff);
        fprintf('Butterworth filter applied: %.1f-%.1f Hz\n', low_cutoff, high_cutoff);
    elseif ~isempty(low_cutoff)
        % High-pass filter only
        filtered_data = pop_eegfiltnew(eeg_data, low_cutoff, []);
        fprintf('High-pass filter applied: %.1f Hz\n', low_cutoff);
    elseif ~isempty(high_cutoff)
        % Low-pass filter only
        filtered_data = pop_eegfiltnew(eeg_data, [], high_cutoff);
        fprintf('Low-pass filter applied: %.1f Hz\n', high_cutoff);
    else
        error('No cutoff frequencies specified. Cannot apply filter.');
    end
end
