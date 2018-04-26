imgSizeX = 40;
imgSizeY = 30;
% imgSizeX = 80;
% imgSizeY = 60;

% Building training Model
dbCenterLight = buildImagesDB('training_images\', 'subject', 'centerlight.gif', 10, 'names.txt', imgSizeX, imgSizeY);
dbGlasses = buildImagesDB('training_images\', 'subject', 'glasses.gif', 10, 'names.txt', imgSizeX, imgSizeY);
dbNoGlasses = buildImagesDB('training_images\', 'subject', 'noglasses.gif', 10, 'names.txt', imgSizeX, imgSizeY);
dbHappy = buildImagesDB('training_images\', 'subject', 'happy.gif', 10, 'names.txt', imgSizeX, imgSizeY);
dbNormal = buildImagesDB('training_images\', 'subject', 'normal.gif', 10, 'names.txt', imgSizeX, imgSizeY);
dbSad = buildImagesDB('training_images\', 'subject', 'sad.gif', 10, 'names.txt', imgSizeX, imgSizeY);
dbSleepy = buildImagesDB('testing_images\', 'subject', 'sleepy.gif', 10, 'names.txt', imgSizeX, imgSizeY);
dbSurprised = buildImagesDB('testing_images\', 'subject', 'surprised.gif', 10, 'names.txt', imgSizeX, imgSizeY);
dbWink = buildImagesDB('testing_images\', 'subject', 'wink.gif', 10, 'names.txt', imgSizeX, imgSizeY);

trainDB = [dbCenterLight, dbGlasses, dbNoGlasses, dbHappy, dbNormal, dbSad, dbSleepy, dbSurprised, dbWink];
trainModel = buildFacesModel(trainDB, 0.95);
clear dbCenterLight dbGlasses dbNoGlasses dbHappy dbNormal dbSad dbSleepy dbSurprised dbWink
disp(['A Train Model of ',num2str(length(trainDB)) , ' faces has been created.'])

% Load testing images for face detection and run face detection
testDB = buildImagesDB('detection_images\', 'image', 'jpg', 25, 'names.txt', imgSizeX, imgSizeY);
plotDBImages(testDB, 'rgb', 5, 'Original Testing Images');
disp('Testing images have been loaded.')

labelledDB = detectFaces(testDB, trainModel, 0.3); % 1.2, 0.2, 0.3, 0.4
plotDBImagesWithLabels(labelledDB,'grayCrop', 5, 'Labelled Testing Images');
noFaces = 0;
for i=1:length(labelledDB)    
   if (isempty(strfind(labelledDB(i).label, 'Not')))
      noFaces = noFaces + 1; 
   end
end
disp([num2str(noFaces) , ' faces have been detected in the ', ... 
    num2str(length(labelledDB)), ' input images.'])