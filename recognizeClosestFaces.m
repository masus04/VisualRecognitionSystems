function myTop5imgsDB = recognizeClosestFaces(testDB, trainModel, k)
    testW = projFaces(obtainDataVects(testDB), trainModel.keigfaces, trainModel.meanFace);
    predFaces = findClosestKFaces(testW, trainModel.trainW, trainModel.klambda, 'euc', k);
    myTop5imgsDB = trainModel.trainDB(predFaces(:));
end