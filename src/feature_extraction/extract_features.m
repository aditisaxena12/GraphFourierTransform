addpath('/Users/aditisaxena/Documents/coursework/Digital Signal Processing/Project/GFT/GraphFourierTransform/data_preprocessing')
addpath('/Users/aditisaxena/Documents/coursework/Digital Signal Processing/Project/GFT/GraphFourierTransform/graph_construction')
file = '/Users/aditisaxena/Documents/coursework/Digital Signal Processing/Project/GFT/GraphFourierTransform/data/ProcessedMATFiles/sub-001_task-eyesclosed_eeg.mat';
k = 5;


[X,W,L] = graph_construction(file);
D = diag(sum(W, 2));

% Compute GDFT
[X_GDFT,U] = calculate_gft(L, X);

% Compute Stationary Ratio
stationary_ratio = calculate_stationaryRatio(L, X_GDFT);

% Compute TikNorm
tiknorm = calculate_tikNorm(L, X);

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
gamma = calculate_spectralClusterLabels(L,k);

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




