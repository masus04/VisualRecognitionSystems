function trainModel = buildFacesModel(trainDB, topKThresh)
    [eigfaces, lambda, meanFace] = computeEigenfaces(trainDB);    
    [keigfaces, klambda, k] = topKeigfaces(eigfaces, lambda, topKThresh);
    % plotEigenfaces(keigfaces, meanFace, imgX, imgY);
    trainW = projFaces(obtainDataVects(trainDB), keigfaces, meanFace);
    % plotEigenCoeffs(trainW, 5);
    trainModel.keigfaces = keigfaces;
    trainModel.meanFace = meanFace;
    trainModel.topKThresh = topKThresh;
    trainModel.k = k;
    trainModel.trainW = trainW;
    trainModel.klambda = klambda;
    trainModel.trainDB = trainDB;
end