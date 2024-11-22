function params = preprocessing_params()
    % Define preprocessing parameters
    params.low_cutoff = 0.5;               % Low cutoff frequency (Hz)
    params.high_cutoff = 45;               % High cutoff frequency (Hz)
    params.sampling_rate = 256;            % Sampling rate (Hz)
    params.asr_threshold = 5;              % ASR artifact rejection threshold
    params.ref_channels = [1, 2];          % Reference channels (e.g., A1 and A2)
end