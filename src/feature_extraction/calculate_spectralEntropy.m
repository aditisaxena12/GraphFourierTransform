function H = calculate_spectralEntropy(U)
    % Spectral Entropy (H(U))
    % Inputs:
    %   U - Matrix whose spectral entropy is to be computed
    % Output:
    %   H - Spectral entropy value

    % Square the elements of U to get power values
    U_squared = U.^2;

    % Normalize the squared values to form a probability distribution
    P = U_squared / sum(U_squared(:));

    % Avoid log(0) by replacing zeros in P with a small value
    P(P == 0) = eps;

    % Compute spectral entropy
    H = -sum(P(:) .* log(P(:)));

    fprintf('Spectral Entropy (H): %.4f\n', H);
end
