data = load('/Users/aditisaxena/Documents/coursework/Digital Signal Processing/Project/GFT/GraphFourierTransform/data/features_struct.mat');

% Extract tiknorm, stationary_ratio, and group labels
tiknorm_values = arrayfun(@(x) x.tiknorm, data.features_struct);
stationary_ratio_values = arrayfun(@(x) x.stationary_ratio, data.features_struct);
group_labels = {data.features_struct.group};

% Define unique groups and assign colors
unique_groups = unique(group_labels);
colors = lines(numel(unique_groups)); % Use distinct colors for each group

% Create scatter plot
figure;
hold on;
for i = 1:numel(unique_groups)
    group_idx = strcmp(group_labels, unique_groups{i});
    scatter(stationary_ratio_values(group_idx),tiknorm_values(group_idx), ...
        50, colors(i, :), 'filled', 'DisplayName', unique_groups{i});
end

% Add labels, legend, and title
ylabel('TikNorm');
xlabel('Stationary Ratio');
legend('show', 'Location', 'best');
title('TikNorm vs Stationary Ratio by Group');
grid on;
hold off;
