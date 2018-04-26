function predFaces = findClosestAvgFace(testW, trainW, klambda, distMetric, noTrainPersons, noConditions)
noTest = size(testW, 2);
noTrain = size(trainW, 2);
predFaces = ones(1, noTest) * -1;
distances = zeros(1, noTrainPersons);

for i=1:noTest
    for k=1:noTrainPersons
    avgDistance = 0;
        for j=k:noTrainPersons:noTrain
            if (strcmp(distMetric ,'euc'))
                dist = sum((testW(:,i) - trainW(:, j)).^2);
            elseif (strcmp(distMetric ,'mah'))
                dist = sum(((testW(:,i) - trainW(:, j)).^2)./klambda);
            end
        avgDistance = avgDistance + dist;
        end
    distances(k) = avgDistance / noConditions;
    end
[~, idx] = min(distances);
predFaces(i) = idx;
end
end
