function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%
t = theta;
t(1) = 0; %Note that you should not regularize the theta 0 term
h = X*theta;
error = h - y;
error_sqr = sum(error.^2);
J = 1/(2*m)*error_sqr + lambda/(2*m)*sum(t.^2);




%%%Regularized linear regression gradient
%% the partial derivative of regularized linear regression’s cost for ?j is de?ned as

grad = 1/m*(X'*(error)+(lambda.*t));






% =========================================================================

grad = grad(:);

end
