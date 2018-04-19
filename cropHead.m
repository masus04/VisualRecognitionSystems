function imgc = cropHead(gray)    
    cs = corner(gray);
    imgc = gray(min(cs(:,2)): max(cs(:,2)), min(cs(:,1)): max(cs(:,1)));
end
    
    
    %imbw = im2bw(gray, graythresh(gray));
    % ask students to write their code to do this functionality without
    % using the function corner