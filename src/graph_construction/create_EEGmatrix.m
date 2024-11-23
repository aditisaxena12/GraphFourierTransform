function X = create_EEGmatrix(Preprocessed_SignalPath)
    % function to load data files and construct matrix X of size (electrodes x discrete time series)
    % Inputs -
    % Preprocessed_SignalPath - The path of the EEG file of the participant
    % Outputs -
    % X - Matrix containing time signal corresponding to each electrode

    %Loading the .mat file as EEG
    load(Preprocessed_SignalPath , 'EEG');

    %Extracting Data from the EEG file
    X = EEG.data(:,:,1); %Using for the first trial
end