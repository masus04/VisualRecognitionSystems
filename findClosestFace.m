function predFaces = findClosestFace(testW, trainW, klambda, recogThresh, distMetric)
    noTest = size(testW, 2);
    noTrain = size(trainW, 2);
    predFaces = ones(1, noTest) * -1;
    dist = -1;
    for i=1:noTest
        minDist = inf;
        minTrain = -1;
       for j=1:noTrain
           if (strcmp(distMetric ,'euc'))
            dist = sum((testW(:,i) - trainW(:, j)).^2);
           elseif (strcmp(distMetric ,'mah'))
               dist = sum(((testW(:,i) - trainW(:, j)).^2)./klambda);
           end
           if (dist < minDist)
              minTrain = j;
              minDist = dist;
           end
       end
       if (minDist < recogThresh && minDist >= 0)
           predFaces(i) = minTrain;
       end
    end
end