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