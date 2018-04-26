function labelledDB = recognizeFaces(testDB, trainModel, recogThresh)
    testW = projFaces(obtainDataVects(testDB), trainModel.keigfaces, trainModel.meanFace);
%     plotEigenCoeffs(testW, 5);
    predFaces = findClosestFace(testW, trainModel.trainW, trainModel.klambda, recogThresh, 'euc');
    maxN = length(testDB);
    labelledDB = testDB;
    for i=1:maxN
       if (predFaces(i) ~= -1) 
          labelledDB(i).label = trainModel.trainDB(predFaces(i)).name; 
       else
           labelledDB(i).label = 'Unknown';
       end
    end
end