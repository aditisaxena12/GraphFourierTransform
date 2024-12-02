% Path to the PARTICIPANTS.TSV file
participants_file = '/Users/aditisaxena/Documents/coursework/Digital Signal Processing/Project/GFT/GraphFourierTransform/data/Data-OpenNeuro/ds004504-1.0.8/participants.tsv';

% Add required paths
addpath(fullfile(base_dir, 'data_preprocessing'));
addpath(fullfile(base_dir, 'graph_construction'));

% Read the file into a table
participants = readtable(participants_file, 'FileType', 'text', 'Delimiter', '\t');

disp(participants);

% Create figure for plots
figure;

% Box plot for Age by Group
subplot(1, 2, 1);
boxplot(participants.Age, participants.Group);
title('Age Distribution by Group');
xlabel('Group');
ylabel('Age');

% Box plot for MMSE by Group
subplot(1, 2, 2);
boxplot(participants.MMSE, participants.Group);
title('MMSE Distribution by Group');
xlabel('Group');
ylabel('MMSE');

% Create bar plot

% Count the number of participants in each group
[group_counts, group_labels] = histcounts(categorical(participants.Group));

% Create bar plot
figure;
bar(group_counts);
set(gca, 'XTickLabel', group_labels); % Set x-axis labels to group names
title('Number of Participants in Each Group');
xlabel('Group');
ylabel('Number of Participants');



