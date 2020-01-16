function [Xtrain, ytrain, Xval, yval, Xtest, ytest] = dataDivide(X, y, a, b)
%%Divides the given dataset into training (a%), cross validation (b%) and
%%test (100-a-b)% randomly

m = size(X, 1);
idx = randperm(length(X));

count1 = round((a*m)/100);
count2 = round(count1 + (b*m)/100);


Xtrain = X(idx(1:count1), :);
ytrain = y(idx(1:count1), :);

Xval = X(idx(count1+1:count2), :);
yval = y(idx(count1+1:count2), :);


Xtest = X(idx(count2+1:end), :);
ytest = y(idx(count2+1:end), :);

end