function fileNames = LoadData(folderName)
    % Define the base path (adjust as needed)
    basePath = '/Users/aditisaxena/Documents/coursework/Digital Signal Processing/Project/GFT/GraphFourierTransform/data/DataBase';
    
    % Construct the full path by appending the folder name to the base path
    folderPath = fullfile(basePath, folderName);
    
    % Check if the folder exists
    if ~isfolder(folderPath)
        error('Folder does not exist: %s', folderPath);
    end

    % Get a list of all files in the folder
    fileList = dir(folderPath);
    
    % Extract only the names of the files, ignoring directories
    fileNames = {fileList(~[fileList.isdir]).name};
    
    % Display the file names
    disp(fileNames);
end