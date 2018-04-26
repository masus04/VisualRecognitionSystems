function predFaces = findClosestKFaces(testW, trainW, klambda, distMetric, k)
    if (strcmp(distMetric, 'mah'))
        X = trainW';
        Y = testW';
        sqrtL = 1 ./ sqrt(klambda);
        X = bsxfun(@times, X, sqrtL);
        Y = bsxfun(@times, Y, sqrtL);
    else 
        X = trainW';
        Y = testW';
    end
    [n,d]=knnsearch(X, Y, 'k', k, 'distance', @eukDist);
    predFaces = n';
end