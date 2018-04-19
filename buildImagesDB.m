function db = buildImagesDB(dir, prefix, ext, maxN, namesFile, imgSizeX, imgSizeY)
    db = initDB(maxN); % Init empty db
    names = readImgInfo([dir namesFile]);
    for i=1:1:maxN
        imgFileName = [dir, prefix, num2str(i), '.', ext];
        db(i).name = names{i};
        db(i).rgb = imread(imgFileName);  
        % check whether the image is RGB
        if ( length(size(db(i).rgb)) == 3)
            db(i).gray = rgb2gray(db(i).rgb);        
        else
            db(i).gray = db(i).rgb;        
        end
        db(i).grayCrop = cropHead(db(i).gray);
        db(i).grayResize = imresize(db(i).grayCrop, [imgSizeX imgSizeY]);        
        db(i).dataVect = db(i).grayResize(:);
    end
end

    % imagefiles = dir('*.bmp');