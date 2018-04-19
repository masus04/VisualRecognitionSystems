function vects = obtainDataVects(db)
    vects = [];
    for i=1:length(db)
        vects(:,i) = db(i).dataVect;
    end
end
