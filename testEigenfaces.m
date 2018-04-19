imgSizeX = 84;
imgSizeY = 60;

trainDB = buildTrainDB();
trainModel = buildFacesModel(trainDB, 0.9);

dbSleepy = buildImagesDB('testing_images\', 'subject', 'sleepy.gif', 10, 'names.txt', imgSizeX, imgSizeY);
labelledDB = recognizeFaces(dbSleepy, trainModel, 0.1);
plotDBImagesWithLabels(labelledDB,'grayCrop', 5, 'Testing Sleepy');
disp('Press Enter to continue ...');
pause

dbSurprised = buildImagesDB('testing_images\', 'subject', 'surprised.gif', 10, 'names.txt', imgSizeX, imgSizeY);
labelledDB = recognizeFaces(dbSurprised, trainModel, 0.2);
plotDBImagesWithLabels(labelledDB,'grayCrop', 5, 'Testing Surprised');
disp('Press Enter to continue ...');
pause

dbWink = buildImagesDB('testing_images\', 'subject', 'wink.gif', 10, 'names.txt', imgSizeX, imgSizeY);
labelledDB = recognizeFaces(dbWink, trainModel, 0.1);
plotDBImagesWithLabels(labelledDB,'grayCrop', 5, 'Testing Wink');