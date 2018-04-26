imgSizeX = 40;
imgSizeY = 30;
% imgSizeX = 80;
% imgSizeY = 60;

% Building training Model
dbNormal = buildImagesDB('Training\', 'subject', 'normal.jpg', 10, 'names.txt', imgSizeX, imgSizeY);
dbHappy= buildImagesDB('Training\', 'subject', 'happy.jpg', 10, 'names.txt', imgSizeX, imgSizeY);
dbSad = buildImagesDB('Training\', 'subject', 'sad.jpg', 10, 'names.txt', imgSizeX, imgSizeY);

trainDB = [dbNormal, dbHappy, dbSad];

dbSleepy = buildImagesDB('Testing\', 'subject', 'sleepy.jpg', 10, 'names.txt', imgSizeX, imgSizeY);
dbSurprised = buildImagesDB('Testing\', 'subject', 'surprised.jpg', 10, 'names.txt', imgSizeX, imgSizeY);

testDB = [dbSleepy, dbSurprised];