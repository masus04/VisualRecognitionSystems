function [keigfaces, klambda, k] = topKeigfaces(eigfaces, lambda, threshold)
    k = 1;
    criteria = true;
    totalVar = sum(lambda);
    while (criteria)
       partialVar  = 0;
       for i = 1: k
           partialVar = partialVar + lambda(i);
       end
       if (partialVar / totalVar > threshold)
           break;
       end
       k = k + 1;
    end
    keigfaces = eigfaces(:, 1:k);
    klambda = lambda(1:k);
end