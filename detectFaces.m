function labelledDB = detectFaces(testDB, trainModel, detectThresh)
    normTestImages = obtainDataVects(testDB);
    [n, noTestFaces] = size(normTestImages);
    normTestImages = normTestImages - repmat(trainModel.meanFace, 1, noTestFaces);  % Normalize bz subtracting mean face
    testW = trainModel.keigfaces' * normTestImages;                                 % Project into eigen space
    reconstTestImages = trainModel.keigfaces * testW;                               % Reconstruct from eigen space
    % plotEigenfaces(normTestImages);
    % plotEigenfaces(reconstTestImages);
    labelledDB = testDB;
    for i=1:noTestFaces
        dist = sum((normTestImages(:,i) - reconstTestImages(:, i)).^2);             % Calculate distance
        dist = dist / n^2;
        if (dist < detectThresh)
            labelledDB(i).label = ['Face (', sprintf('%.2f', dist), ')'];
        else
            labelledDB(i).label = ['Not Face (', sprintf('%.2f', dist), ')'];
        end
    end
end