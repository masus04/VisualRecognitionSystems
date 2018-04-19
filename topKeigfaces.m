function [keigfaces, klambda, k] = topKeigfaces(eigfaces, lambda, threshold)
    totalVar = sum(lambda);
    partialVar  = 0;
    [~, m] = size(eigfaces);
    for i = 1: m
        partialVar = partialVar + lambda(i);
        if (partialVar / totalVar > threshold)
            break;
        end
    end
    
    k = i;
    keigfaces = eigfaces(:, 1:k);
    klambda = lambda(1:k);
end