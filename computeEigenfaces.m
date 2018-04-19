function [eigfaces, lambda, meanFace] = computeEigenfaces(db)
    X = obtainDataVects(db);
    % get number of examples and features
    [n M] = size(X);
    % compute mean
    Xm = mean(X, 2);
    % compute deviation matrix
    A = X - repmat(Xm, 1, M);
    % compute covariance matrix
    C = 1 / (M - 1) * A * A';
    % compute the eigenvectors v of A' * A since A * A' is too large
    [v, mu] = eig(A' * A);
    mu = diag(mu);
    % now, compute the eigenvalues and eigenvectors of A * A'
    lambda = mu;
    u = A * v;
     % sort eigenvalues and eigenvectors
    [none i] = sort(-1 * lambda);
    lambda = lambda(i);
    eigfaces = u(:, i);    
    for i=1:size(eigfaces, 2)
       eigfaces(:, i) = eigfaces(:, i) / norm(eigfaces(:, i));
    end
    meanFace = Xm;
end