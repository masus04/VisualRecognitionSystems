%imgSizeX = 40;
%imgSizeY = 30;
imgSizeX = 80;
imgSizeY = 60;

% || - 1. Building training Model - ||
% Added X and Y sizes for image rescaling to buildImagesDB
dbNormal = buildImagesDB('Training\', 'subject', 'normal.jpg', 10, 'names.txt', imgSizeX, imgSizeY);
dbHappy= buildImagesDB('Training\', 'subject', 'happy.jpg', 10, 'names.txt', imgSizeX, imgSizeY);
dbSad = buildImagesDB('Training\', 'subject', 'sad.jpg', 10, 'names.txt', imgSizeX, imgSizeY);

trainDB = [dbNormal, dbHappy, dbSad];

dbSleepy = buildImagesDB('Testing\', 'subject', 'sleepy.jpg', 10, 'names.txt', imgSizeX, imgSizeY);
dbSurprised = buildImagesDB('Testing\', 'subject', 'surprised.jpg', 10, 'names.txt', imgSizeX, imgSizeY);

testDB = [dbSleepy, dbSurprised];

% || - 2. Generate top K eigenfaces - ||
K1 = buildFacesModel(trainDB, 0.85);
plotEigenfaces(K1.keigfaces, K1.meanFace, 5, imgSizeX, imgSizeY);

K2 = buildFacesModel(trainDB, 0.95);
plotEigenfaces(K2.keigfaces(:, 1:10), K2.meanFace, 5, imgSizeX, imgSizeY);

% || - 3. Recognise Faces using 1,3,5 KNN - ||
% Also computed MEAN neighbour
labelledDB = recognizeFacesKnn(testDB, K1, 1);
plotDBImagesWithLabels(labelledDB, 'grayCrop', 5, '1NN, K1');
labelledDB = recognizeFacesKnn(testDB, K1, 3);
plotDBImagesWithLabels(labelledDB, 'grayCrop', 5, '3NN,  K1');
labelledDB = recognizeFacesKnn(testDB, K1, 5);
plotDBImagesWithLabels(labelledDB, 'grayCrop', 5, '5NN,  K1');
labelledDB = recognizeFacesAvg(testDB, K1, 10, 3);
plotDBImagesWithLabels(labelledDB, 'grayCrop', 5, 'AVG,  K1');

labelledDB = recognizeFacesKnn(testDB, K2, 1);
plotDBImagesWithLabels(labelledDB, 'grayCrop', 5, '1NN,  K2');
labelledDB = recognizeFacesKnn(testDB, K2, 3);
plotDBImagesWithLabels(labelledDB, 'grayCrop', 5, '3NN,  K2');
labelledDB = recognizeFacesKnn(testDB, K2, 5);
plotDBImagesWithLabels(labelledDB, 'grayCrop', 5, '5NN,  K2');
labelledDB = recognizeFacesAvg(testDB, K2, 10, 3);
plotDBImagesWithLabels(labelledDB, 'grayCrop', 5, 'AVG,  K2');

% || - 4. Recognise Faces using 1,3,5 KNN - ||
