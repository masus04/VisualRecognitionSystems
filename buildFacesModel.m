function trainModel = buildFacesModel(trainDB, topKThresh)
    % Build Model from training set
    
    % Compute eigenspace values
    [eigfaces, lambda, meanFace] = computeEigenfaces(trainDB);
    % Reduce complexity by selecting k eigenfaces
    [keigfaces, klambda, k] = topKeigfaces(eigfaces, lambda, topKThresh);
    
    % plotEigenfaces(keigfaces, meanFace);
    
    % Project training set images
    trainW = projFaces(obtainDataVects(trainDB), keigfaces, meanFace);
    
    % plotEigenCoeffs(trainW, 5);
    
    % Construct trainModel Structure Array
    trainModel.keigfaces = keigfaces;
    trainModel.meanFace = meanFace;
    trainModel.topKThresh = topKThresh;
    trainModel.k = k;
    trainModel.trainW = trainW;
    trainModel.klambda = klambda;
    trainModel.trainDB = trainDB;
end