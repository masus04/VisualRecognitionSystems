function labelledDB = recognizeFacesAvg(testDB, trainModel, noTrainPersons, noConditions)
    testW = projFaces(obtainDataVects(testDB), trainModel.keigfaces, trainModel.meanFace);
    predFaces = findClosestAvgFace(testW, trainModel.trainW, trainModel.klambda, 'euc', noTrainPersons, noConditions);
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