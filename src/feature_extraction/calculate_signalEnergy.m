function beta = calculate_signalEnergy(X)
    % Signal Energy (β)
    % Inputs:
    %   X - Data matrix
    % Output:
    %   beta - Signal energy value

    % Compute the sum of squared elements
    beta = sum(X(:).^2);

    fprintf('Signal Energy (β): %.4f\n', beta);
end
