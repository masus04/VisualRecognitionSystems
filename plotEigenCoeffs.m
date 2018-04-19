function plotEigenCoeffs(w, cols)
    if (nargin == 1)
        cols = 5;
    end
    maxN = size(w, 2);
    m = ceil(maxN / cols);
    figure('name','Linear Coefficients of Eigenfaces');       
    for i=1:maxN
       subplot(m, cols, i)
       bar(w(:,i))
       title(['Face ', num2str(i)])
       xlabel('Eigenfaces')
       ylabel('Coefficients');
       axis([0, size(w,1)+1, -inf, +inf])
    end
end