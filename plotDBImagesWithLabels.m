function plotDBImagesWithLabels(db, Imgtype, cols, dbType)
    if (nargin == 3)
        dbType = 'Unspecified';
    end
    maxN = length(db);
    m = ceil(maxN / cols);
    figure('name',['Images in a Database (' ,dbType ,')' ]);        
    for i=1:maxN
       subplot(m, cols, i)
       subimage(getImageFromDBRecord(db(i), Imgtype))
       title([db(i).name, '->', db(i).label])
       axis off
    end

end