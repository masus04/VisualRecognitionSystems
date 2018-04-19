function img = getImageFromDBRecord(dbRecord, type)
    switch lower(type)
        case 'rgb'
            img = dbRecord.rgb;
        case 'gray'
            img = dbRecord.gray;
        case 'graycrop'
            img = dbRecord.grayCrop;
        case 'grayresize'
            img = dbRecord.grayResize;
        otherwise
    end
end
    