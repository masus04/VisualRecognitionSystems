function plotDBImages(db, type, cols, dbType)
    if (nargin == 3)
        dbType = 'Unspecified';
    end
    maxN = length(db);
    m = ceil(maxN / cols);
    figure('name',['Images in a Database (' ,dbType ,')' ]);        
    for i=1:maxN
       subplot(m, cols, i)
       subimage(getImageFromDBRecord(db(i), type))
       title(db(i).name)
       axis off
    end
end