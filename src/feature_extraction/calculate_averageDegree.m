function Avg_Degree  = calculate_avgDegree(D)
    % Average Degree of Graph (mu_D)
    % Inputs:
    %   D - Diagonal Degree Matrix
    % Output:
    %   mu_D - Average Degree of Graph

    % Compute mean/average of the diagonal elements of the degree matrix
    mu_D = mean(diag(D));
    %disp(['Average Degree (mu_D) = ',num2str(mu_D)]);
end
%calculate_avgDegree([1, 2, 3; 4, 5, 6; 7, 8, 9]); %Example to check