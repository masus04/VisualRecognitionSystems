function labelledDB = recognizeFacesKnn(testDB, trainModel, k)
    testW = projFaces(obtainDataVects(testDB), trainModel.keigfaces, trainModel.meanFace);
    predFaces = findClosestKFaces(testW, trainModel.trainW, trainModel.klambda, 'euc', k);
    maxN = length(testDB);
    labelledDB = testDB;
    for i=1:maxN      
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



function label = findMajorityLabel(labelsCounts)
    labels = fieldnames(labelsCounts);
    counts = zeros(1, length(labels));
    for i=1:length(labels)
        counts(i) = labelsCounts.(labels{i});
    end
    [~, index] = max(counts);
    label = labels{index};
end