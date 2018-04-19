function plotEigenfaces(eigfaces, meanFace, cols)
    plotMean = 1;
    shift = 0;
    if (nargin <= 2)
        cols = 5;
    end
    if (nargin == 1)
        plotMean = 0;
    end
    
    maxN = size(eigfaces, 2) + plotMean;
    m = ceil(maxN / cols) + plotMean;
    figure('name','Computed Eigenfaces');    
    if (plotMean == 1)
        subplot(m, cols, round(cols/2))
        subimage(mat2gray(reshape(meanFace, 84, 64)))
        title('Mean Face')
        axis off
        maxN = maxN-1;
        shift = cols;
    end
    for i=1:maxN
       subplot(m, cols, shift+i)
       subimage(mat2gray(reshape(eigfaces(:,i), 84, 64)))
       title(['Eigenface ', num2str(i)])
       axis off
    end
end
