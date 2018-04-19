function labelledDB = recognizeFacesKnn(testDB, trainModel, k)
    % Outputs a list of labels, one for each input image

    % Project test set Images to Eigenspace
    testW = projFaces(obtainDataVects(testDB), trainModel.keigfaces, trainModel.meanFace);
    
    % Make predictions based on KNN
    predFaces = findClosestKFaces(testW, trainModel.trainW, trainModel.klambda, 'mah', k); % use euc or 'mah'
    
    maxN = length(testDB);
    labelledDB = testDB;
    for i=1:maxN % For each test image
        labelsCounts = struct();
        for j=1:k
            label = trainModel.trainDB(predFaces(j, i)).name;
            if (isfield(labelsCounts, label))
                labelsCounts.(label) = labelsCounts.(label) + 1;
            else
                labelsCounts.(label) = 1;
            end
        end
        labelledDB(i).label = findMajorityLabel(labelsCounts);
    end
end