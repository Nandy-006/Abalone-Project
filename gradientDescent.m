function [Theta, J] = gradientDescent(X, y, Theta0, alpha, lambda, niter)
    %%Calculates Theta value to minimize cost function J by running niter times
    %%given features(X), response(y), learning rate(alpha), regularization
    %%constant(lambda) and initial weight value(Theta0)
    
    Theta = Theta0;
    tempTheta = zeros(size(Theta));
    J = zeros(niter);
    m = size(X, 1);
    
    for i = 1:niter
        J(i+1) = (1/(2*m))*((X*Theta - y)'*(X*Theta-y) + lambda*sum(Theta(2:end).*Theta(2:end)));
        tempTheta = Theta - (alpha/m)*(X'*(X*Theta - y));
        tempTheta(2:end) = tempTheta(2:end) + (lambda/m)*Theta(2:end);
        Theta = tempTheta;
    end
end

    