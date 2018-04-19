function labelledDB = recognizeFaces(testDB, trainModel, recogThresh)
    % Outputs a list of labels, one for each input image

    % Project test set Images to Eigenspace
    testW = projFaces(obtainDataVects(testDB), trainModel.keigfaces, trainModel.meanFace);
    
    % plotEigenCoeffs(testW, 5);
    
    % Make predictions based on 1NN
    predFaces = findClosestFace(testW, trainModel.trainW, trainModel.klambda, recogThresh, 'mah');
    maxN = length(testDB);
    labelledDB = testDB;
    
    % Replace predictions without candidate with 'unknown'
    for i=1:maxN
        if (predFaces(i) ~= -1)
            labelledDB(i).label = trainModel.trainDB(predFaces(i)).name;
        else
            labelledDB(i).label = 'Unknown';
        end
    end
end