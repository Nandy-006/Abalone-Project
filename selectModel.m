function [alpha, lambda, niter] = selectModel(X, y, Theta0)
    %%Calculates error for various values of alpha, lambda and niter and
    %%returns those values where error is minimum
    
    alphaarr = [0.001, 0.003, 0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
    lambdaarr = [0.001, 0.003, 0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
    niterarr = 100:100:2500;
    
    Jmin = Inf;
    m = size(X,1);
    
    for i = 1:length(alphaarr)
       for j = 1:length(lambdaarr)
            for k = 1:length(niterarr)
                [Theta, ~] = gradientDescent(X, y, Theta0, alphaarr(i), lambdaarr(j), niterarr(k));
                J = (1/(2*m))*((X*Theta - y)'*(X*Theta - y));
                if J < Jmin
                    Jmin = J;
                    alpha = alphaarr(i);
                    lambda = lambdaarr(j);
                    niter = niterarr(k);
                end
            end
       end
    end
end
            