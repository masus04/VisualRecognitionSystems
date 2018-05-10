function db = buildImagesDB(dir, prefix, ext, maxN, namesFile, sizeX, sizeY)
    db = initDB(maxN);
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
        db(i).grayCrop = db(i).gray; % cropHead(db(i).gray);
        db(i).grayResize = imresize(db(i).grayCrop, [sizeX sizeY]);
        db(i).dataVect = db(i).grayResize(:);
    end
end

    % imagefiles = dir('*.bmp');