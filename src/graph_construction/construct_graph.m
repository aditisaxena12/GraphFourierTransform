function adj_matrix = construct_graph(EEGdata_matrix)
    % Constructs the adjacency matrix using a Gaussian kernel.
    % Inputs:
    %   EEGdata_matrix - EEG signal data matrix (channels x time)
    % Outputs:
    %   adj_matrix - Adjacency matrix representing graph connections

   
    % No. of Channels(Electrodes)
    [nbchan,~] = size(EEGdata_matrix);


    %% Gaussian Kernel Parameters
    %Calculation of threshold value (k)
    % Pairwise distances between nodes(channels) refers to voltage difference between them

    % Initialize pairwise distances matrix
    PairwiseDistances = zeros(nbchan,nbchan); 
    for i = 1:nbchan 
        for j = (i+1):nbchan
            PairwiseDistances(i,j) = norm(EEGdata_matrix(i,:)-EEGdata_matrix(j,:)); %Euclidean distance
            PairwiseDistances(j,i) = PairwiseDistances(i,j);
        end
    end

    % Flatten the distance matrix and remove zeros
    allDistances = PairwiseDistances(:);
    allDistances = allDistances(allDistances > 0);
    
    % Define k(threshold value) as the 90th percentile of distances
    k = prctile(allDistances, 90);
    %disp(['Threshold distance (k): ', num2str(k)]);

    % standard deviation
    sigma = std(allDistances);

    %% Construct Weight Matrix
    adj_matrix = exp(-(PairwiseDistances.^2)/(2*sigma^2));

    % Apply threshold k (set weights to 0 for distances greater than k)
    adj_matrix(PairwiseDistances > k) = 0;
    
end    

