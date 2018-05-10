imgSizeX = 40;
imgSizeY = 30;
% imgSizeX = 80;
% imgSizeY = 60;

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
model85 = buildFacesModel(trainDB, 0.85);
plotEigenfaces(model85.keigfaces, model85.meanFace, 5, imgSizeX, imgSizeY);

model95 = buildFacesModel(trainDB, 0.95);
plotEigenfaces(model95.keigfaces(:, 1:10), model95.meanFace, 5, imgSizeX, imgSizeY);

% || - 3. Recognise Faces using 1,3,5 KNN - ||
% Also computed MEAN neighbour
labelledDB = recognizeFacesKnn(testDB, model85, 1);
plotDBImagesWithLabels(labelledDB, 'grayCrop', 5, '1NN, Accuraccy: 0.85');
labelledDB = recognizeFacesKnn(testDB, model85, 3);
plotDBImagesWithLabels(labelledDB, 'grayCrop', 5, '3NN, Accuraccy: 0.85');
labelledDB = recognizeFacesKnn(testDB, model85, 5);
plotDBImagesWithLabels(labelledDB, 'grayCrop', 5, '5NN, Accuraccy: 0.85');
labelledDB = recognizeFacesAvg(testDB, model85, 10, 3);
plotDBImagesWithLabels(labelledDB, 'grayCrop', 5, 'AVG, Accuraccy: 0.85');

labelledDB = recognizeFacesKnn(testDB, model95, 1);
plotDBImagesWithLabels(labelledDB, 'grayCrop', 5, '1NN, Accuraccy: 0.95');
labelledDB = recognizeFacesKnn(testDB, model95, 3);
plotDBImagesWithLabels(labelledDB, 'grayCrop', 5, '3NN, Accuraccy: 0.95');
labelledDB = recognizeFacesKnn(testDB, model95, 5);
plotDBImagesWithLabels(labelledDB, 'grayCrop', 5, '5NN, Accuraccy: 0.95');
labelledDB = recognizeFacesAvg(testDB, model95, 10, 3);
plotDBImagesWithLabels(labelledDB, 'grayCrop', 5, 'AVG, Accuraccy: 0.95');

% || - 4. Recognise Faces using 1,3,5 KNN - ||
