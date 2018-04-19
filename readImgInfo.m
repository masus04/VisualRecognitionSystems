function imgInfo = readImgInfo(filename)
    imgInfo = {};
    fid = fopen(filename);
    tline = fgetl(fid);
    i=1;
    while ischar(tline)
        imgInfo{i} = tline;
        tline = fgetl(fid);
        i = i +1;
    end
    fclose(fid);
end