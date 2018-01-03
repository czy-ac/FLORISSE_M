function [] = test_dependencies(functionsPath)
    fileNames = dir(functionsPath);

    % Functions folder
    for j = 1:length(fileNames)-2
        inputFile = fileNames(j+2).name;

        % Check dependencies
        [names{j}, folders{j}] = dependencies.toolboxDependencyAnalysis({inputFile});
        disp(['Filename: ' inputFile '. Dependencies: ' names{j}])
    end

    % Make a compatibility report (only for newest MATLAB 2017b)
    if exist('codeCompatibilityReport') ~= 0
        codeCompatibilityReport(functionsPath);
    end