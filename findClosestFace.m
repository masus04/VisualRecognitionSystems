function predFaces = findClosestFace(testW, trainW, klambda, recogThresh, distMetric)
    noTest = size(testW, 2);
    noTrain = size(trainW, 2);
    predFaces = ones(1, noTest) * -1;
    dist = -1;
    for i=1:noTest
        minDist = inf;  % Distance to closest neighbour
        minTrain = -1;  % Index of closest neighbour
        for j=1:noTrain
            % Calculate distance 
            if (strcmp(distMetric ,'euc'))
                dist = sum((testW(:, i) - trainW(:, j)).^2);
            elseif (strcmp(distMetric ,'mah'))
                dist = sum(((testW(:, i) - trainW(:, j)).^2)./klambda);
            end
            % Update candidate
            if (dist < minDist)
                minTrain = j;
                minDist = dist;
            end
        end
        % Check if candidate distance is in bounds of threshold
        if (minDist < recogThresh && minDist >= 0)
            predFaces(i) = minTrain;
        end
    end
end