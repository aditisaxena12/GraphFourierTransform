function tv = calculate_totalVariation(X, W)
    % Total Variation (TV)
    % Inputs:
    %   X - Data matrix (rows: nodes, columns: features)
    %   W - Adjacency matrix of the graph
    % Output:
    %   tv - Total variation

    [num_nodes, ~] = size(X);
    tv = 0;

    % Compute total variation
    for i = 1:num_nodes
        for j = 1:num_nodes
            tv = tv + W(i, j) * norm(X(i, :) - X(j, :), 2)^2;
        end
    end

    fprintf('Total Variation (TV): %.4f\n', tv);
end
