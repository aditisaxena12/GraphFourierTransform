function reref_data = re_reference(eeg_data, ref_channels)
    % Re-reference EEG data to specified electrodes
    % Inputs: eeg_data - EEG data
    %         ref_channels - Channels to use as reference
    % Output: reref_data - Re-referenced EEG data
    
    eeg_data = pop_reref(eeg_data, ref_channels);
    fprintf('Data re-referenced to channels: %s\n', mat2str(ref_channels));
    reref_data = eeg_data;
end
