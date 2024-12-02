# Graph Fourier Transform Project

This repository demonstrates a workflow for analyzing EEG data using Graph Fourier Transform (GFT). Below are the steps to reproduce the results.

---

## Step 1 - Downloading the Dataset

1. Download the dataset from **[OpenNeuro](https://openneuro.org/datasets/ds004504/versions/1.0.8)**.
   - Dataset used: EEG dataset for brain activity analysis.
   - Save the dataset in the folder: `data/Data-OpenNeuro`.

---

## Step 2 - Data Preprocessing

1. Run the preprocessing script to convert raw EEG data into a usable format:
   ```matlab
   run src/data_preprocessing/load_save_data.m

2. This script processes the data and saves the output in the folder: `data/ProcessedMATFiles`

---

## Step 3 - Constructing the Graph

1. If you wish to corroborate, construct a graph representation of the EEG data using the following script:
  ```matlab
  run src/graph_construction/graph_construction.m
```
2. Pass the .mat file from data/ProcessedMATFiles as the parameter to generate the graph adjacency matrix and Laplacian.

---

## Step 4 - Feature Extraction

1. Extract relevant features from the constructed graph using:
 ```matlab
  run src/feature_extraction/extract_features.m
```
This script processes all the files in `data/ProcessedMATFiles` and generates a feature matrix containing the computed features for all EEG samples.

2. It also generates a labels array categorizing each sample into groups such as Alzheimer’s, Frontal Dementia, or Healthy controls.

---
## Step 5 - Classification

1. Run machine learning classification models using:
   ```matlab
    run src/model/run_classification.m
   ```
   
This script:
 - Splits the data into training and testing sets.
-  Evaluates classifiers including k-NN, Random Forest, Logistic Regression, SVM, Naive Bayes, Neural Networks, and more.
- Computes performance metrics such as accuracy, precision, recall, and F1-score for each model.
- Prints the results in the MATLAB console.

---
## Step 6 - Plotting the Results

1. Generate visualizations to interpret the results using the plotting scripts:
```matlab
run src/Plotting/<script_name>.m
```

2. Plots are saved in a designated folder, such as:
```matlab
results/plots
```

---
## Folder Structure
```
project/
├── data/
│   ├── Data-OpenNeuro/           % Raw EEG data
│   ├── ProcessedMATFiles/        % Preprocessed EEG data
├── src/
│   ├── data_preprocessing/       % Scripts for preprocessing
│   ├── graph_construction/       % Scripts for graph construction
│   ├── feature_extraction/       % Scripts for extracting features
│   ├── model/                    % Scripts for training classifiers
│   ├── Plotting/                 % Scripts for generating plots
├── results/
│   ├── plots/                    % Folder to save generated plots
├── README.md                     % This file
```
This structured workflow allows for seamless analysis of EEG data using GFT. For any issues, please consult the respective scripts and their comments.
