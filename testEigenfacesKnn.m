imgSizeX = 84;
imgSizeY = 60;

trainDB = buildTrainDB(84, 60);
trainModel = buildFacesModel(trainDB, 0.9);

dbSleepy = buildImagesDB('testing_images\', 'subject', 'sleepy.gif', 10, 'names.txt', imgSizeX, imgSizeY);
labelledDB = recognizeFacesKnn(dbSleepy, trainModel, 5);
plotDBImagesWithLabels(labelledDB,'grayCrop', 5, 'Testing Sleepy');
disp('Press Enter to continue ...');
pause

dbSurprised = buildImagesDB('testing_images\', 'subject', 'surprised.gif', 10, 'names.txt', imgSizeX, imgSizeY);
labelledDB = recognizeFacesKnn(dbSurprised, trainModel, 5);
plotDBImagesWithLabels(labelledDB,'grayCrop', 5, 'Testing Surprised');
disp('Press Enter to continue ...');
pause

dbWink = buildImagesDB('testing_images\', 'subject', 'wink.gif', 10, 'names.txt', imgSizeX, imgSizeY);
labelledDB = recognizeFacesKnn(dbWink, trainModel, 5);
plotDBImagesWithLabels(labelledDB,'grayCrop', 5, 'Testing Wink');