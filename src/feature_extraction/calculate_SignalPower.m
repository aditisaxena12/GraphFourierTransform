function Power  = calculate_signalPower(X)
    % Signal Power (Sigma^2) = Var(X)
    % Inputs:
    %   X - EEG Signal Matrix of a participant
    % Output:
    %   Power of the signal
    
    % Number of data points
    N = size(X,1);

    % Compute Mean Vector of the dataset X 
    mu = mean(X); %computing mean along column
    %disp(['Mean Matrix : ',num2str(mu)])

    % Compute Signal Power
    Power = (1/N)*sum(sum((X-mu).^2));

    %disp(['Signal Power (Sigma^2 =Var(X)) =',num2str(Power)]);
end
%calculate_signalpower([1, 2, 3; 4, 5, 6; 7, 8, 9]); %Example to check