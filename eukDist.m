function dist = eukDist(X, Y)
    m2 = size(Y, 1);
    dist = zeros(m2, 1);
    for i=1:m2
        dist(i, 1) = sum((X - Y(i, :)).^2);
    end
end