imgSizeX = 40;
imgSizeY = 30;
% imgSizeX = 80;
% imgSizeY = 60;

dbCenterLight = buildImagesDB('training_images\', 'subject', 'centerlight.gif', 10, 'names.txt', imgSizeX, imgSizeY);
dbGlasses = buildImagesDB('training_images\', 'subject', 'glasses.gif', 10, 'names.txt, imgSizeX, imgSizeY', imgSizeX, imgSizeY);
dbNoGlasses = buildImagesDB('training_images\', 'subject', 'noglasses.gif', 10, 'names.txt', imgSizeX, imgSizeY);
dbHappy = buildImagesDB('training_images\', 'subject', 'happy.gif', 10, 'names.txt', imgSizeX, imgSizeY);
dbNormal = buildImagesDB('training_images\', 'subject', 'normal.gif', 10, 'names.txt', imgSizeX, imgSizeY);
dbSad = buildImagesDB('training_images\', 'subject', 'sad.gif', 10, 'names.txt', imgSizeX, imgSizeY);

trainDB = [dbCenterLight, dbGlasses, dbNoGlasses, dbHappy, dbNormal, dbSad];
trainModel = buildFacesModel(trainDB, 0.9);
noTrainPersons =10;
noConditions = 6;

dbSleepy = buildImagesDB('testing_images\', 'subject', 'sleepy.gif', 10, 'names.txt', imgSizeX, imgSizeY);
labelledDB = recognizeFacesAvg(dbSleepy, trainModel, noTrainPersons, noConditions);
plotDBImagesWithLabels(labelledDB,'grayCrop', 5, 'Testing Sleepy');

dbSurprised = buildImagesDB('testing_images\', 'subject', 'surprised.gif', 10, 'names.txt', imgSizeX, imgSizeY);
labelledDB = recognizeFacesAvg(dbSurprised, trainModel, noTrainPersons, noConditions);
plotDBImagesWithLabels(labelledDB,'grayCrop', 5, 'Testing Surprised');

dbWink = buildImagesDB('testing_images\', 'subject', 'wink.gif', 10, 'names.txt', imgSizeX, imgSizeY);
labelledDB = recognizeFacesAvg(dbWink, trainModel, noTrainPersons, noConditions);
plotDBImagesWithLabels(labelledDB,'grayCrop', 5, 'Testing Wink');