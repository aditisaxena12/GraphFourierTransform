function Heat_trace = calculate_HeatTrace(L)
    % Heat_trace (h)
    % Inputs:
    %   L - Laplacian Matrix
    % Output:
    %   h - heat(information) spread across the graph
    
    % Modified Laplacian Matrix
    L_modified = exp(-L);

    % Heat Trace 
    h = trace(L_modified)

    %disp(['Heat Trace (h) =',num2str(h)]);
end
calculate_HeatTrace([1, 2, 3; 4, 5, 6; 7, 8, 9]); %Example to check