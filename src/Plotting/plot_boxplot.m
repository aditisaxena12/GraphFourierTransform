data = load('/Users/aditisaxena/Documents/coursework/Digital Signal Processing/Project/GFT/GraphFourierTransform/data/features_struct.mat');

% Extract the stationary ratio values and group labels
%stationary_ratio_values = arrayfun(@(x) x.stationary_ratio, features_struct);
%tiknorm_values = arrayfun(@(x) x.tiknorm, features_struct);
%tv_values = arrayfun(@(x) x.total_variation, features_struct);
%genergy_values = arrayfun(@(x) x.graph_energy, features_struct);
%specentropy_values = arrayfun(@(x) x.spectral_entropy, features_struct);
%sigenergy_values = arrayfun(@(x) x.signal_energy, features_struct);
%sigpower_values = arrayfun(@(x) x.signal_power, features_struct);
%avgdeg_values = arrayfun(@(x) x.average_degree, features_struct);
diffdist_values = arrayfun(@(x) x.diffusion_distance, features_struct);
group_labels = {features_struct.group};
figure;

% Create the box plot
boxplot(diffdist_values, group_labels);

% Add title and labels
title('Box Plot of Diffusion Distance by Group', 'FontSize', 14);
xlabel('Group','FontSize', 14);
ylabel('Diffusion Distance','FontSize', 14);



% Customize x-tick labels
set(gca, 'XTickLabel', {'A - Alzheimer''s', 'F - Frontal Dementia', 'C - Control'});


