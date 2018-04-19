function trainDB = buildTrainDB(imgSizeX, imgSizeY)
    dbCenterLight = buildImagesDB('training_images\', 'subject', 'centerlight.gif', 10, 'names.txt', imgSizeX, imgSizeY);
    dbGlasses = buildImagesDB('training_images\', 'subject', 'glasses.gif', 10, 'names.txt', imgSizeX, imgSizeY);
    dbNoGlasses = buildImagesDB('training_images\', 'subject', 'noglasses.gif', 10, 'names.txt', imgSizeX, imgSizeY);
    dbHappy = buildImagesDB('training_images\', 'subject', 'happy.gif', 10, 'names.txt', imgSizeX, imgSizeY);
    dbNormal = buildImagesDB('training_images\', 'subject', 'normal.gif', 10, 'names.txt', imgSizeX, imgSizeY);
    dbSad = buildImagesDB('training_images\', 'subject', 'sad.gif', 10, 'names.txt', imgSizeX, imgSizeY);
    
    trainDB = [dbCenterLight, dbGlasses, dbNoGlasses, dbHappy, dbNormal, dbSad];
end

