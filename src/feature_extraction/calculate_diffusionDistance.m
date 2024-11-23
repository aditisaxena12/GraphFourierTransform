function DiffusionDistance = calculate_Diffusion_Distance(L)
    % Diffusion Distance (h')
    % Inputs:
    %   L - Laplacian Matrix
    % Output:
    %   h_prime - extent of diffusion in a graph
    
    % Modified Laplacian Matrix
    L_modified = exp(-L);

    % Heat Trace 
    h_prime = sum(L_modified,'all');

    %disp(['Diffusion Distance (h_prime) =', num2str(h_prime)]);
end
%calculate_Diffusion_Distance([1, 2, 3; 4, 5, 6; 7, 8, 9]); %Example to check