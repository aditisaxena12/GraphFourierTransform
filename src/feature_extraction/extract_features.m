addpath('/Users/aditisaxena/Documents/coursework/Digital Signal Processing/Project/GFT/GraphFourierTransform/data_preprocessing')
addpath('/Users/aditisaxena/Documents/coursework/Digital Signal Processing/Project/GFT/GraphFourierTransform/graph_construction')

X,W,L = graph_construction();

% Compute GDFT
X_GDFT,U = calclate_gft(L, X);

% Compute Stationary Ratio
stationary_ratio = calculate_stationary_ratio(L, X_GDFT);

% Compute TikNorm
tiknorm = calculate_tiknorm(L, X);

% Compute Total Variation
tv = calculate_totalVariation(X, W);

% Compute Graph Energy
energy = calculate_graphEnergy(L);

% Compute Spectral Entropy
H = calculate_spectralEntropy(U);

% Compute Signal Energy
beta = calculate_signalEnergy(X);

% Compute Signal Power
sigma_square = calculate_SignalPower(X);

% Compute Unique Spectral Cluster Labels
gamma = calculate_unique_spectral_cluster_labels(L,k);

% Compute Average Degree
mu_D = calculate_averageDegree(D);

% Compute Heat Trace 
h = calculate_heatTrace(L);

% Compute Diffusion Distance
h_prime = calculate_diffusionDistance(L);

% Display results
disp('GDFT:');
disp(X_GDFT);
disp('Stationary Ratio:');
disp(stationary_ratio);
disp('TikNorm:');
disp(tiknorm);
disp('Graph Energy:');
disp(energy);
disp('Total Variation:');
disp(tv);
disp('Spectral Entropy:');
disp(H);
disp('Signal Energy:');
disp(beta);
disp('Signal Power:');
disp(sigma_square);
disp('Unique Spectral Cluster Labels:');
disp(gamma);
disp('Average Degree:');
disp(mu_D);
disp('Heat Trace');
disp(h);
disp('Diffusion Distance:');
disp(h_prime);




