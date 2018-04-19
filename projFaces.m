function [w A] = projFaces(faces, keigfaces, meanFace)
% faces: is n x M matrix where M is number of faces
% keigfaces: is n x k matrix where k is the number of top eigenfaces
% meanface: is n X 1 vector
    A = faces - repmat(meanFace, 1, size(faces, 2));
    w = keigfaces' * A;
    for i=1:size(w, 2)
       w(:, i) = w(:, i) / norm(w(:, i));
    end
% w is k x M matrix where each face coefficients is represented in columns
end