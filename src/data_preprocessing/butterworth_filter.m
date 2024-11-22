function filtered_data = butterworth_filter(eeg_data, low_cutoff, high_cutoff, sampling_rate)
    % Band-pass Butterworth filter
    % Inputs: eeg_data - Raw EEG data
    %         low_cutoff - Low cutoff frequency (Hz)
    %         high_cutoff - High cutoff frequency (Hz)
    %         sampling_rate - Sampling rate (Hz)
    % Output: filtered_data - Filtered EEG data
    
    [b, a] = butter(4, [low_cutoff, high_cutoff] / (sampling_rate / 2), 'bandpass');
    filtered_data = filtfilt(b, a, double(eeg_data.data)');
    eeg_data.data = filtered_data';
    fprintf('Butterworth filter applied: %.1f-%.1f Hz\n', low_cutoff, high_cutoff);
end
