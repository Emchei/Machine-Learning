function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

x1=0;
x2=0;
for i =1:m
    z=theta'*X(i,:)';
    h=sigmoid(z);
    var1 = -y(i)*log(h);
    var2 = -((1-y(i))*log(1-h));
    x1 = x1 + var1 + var2;
end;

for i = 2:size(theta,1)
    x2 =x2 +theta(i)*theta(i);
end
J = (x1 +lambda/2*x2)/m;

for j=1:size(theta,1),
    x1=0;
  grad(j) = 0;
  for i=1:m,
	z = theta'*X(i, :)';
	hx = sigmoid(z);
	v = (hx - y(i)) * X(i,j);
% 	grad(j) = grad(j) + v;
x1 = x1+v;
  end;
  if j >=2
  grad(j) = (x1 +lambda*theta(j)) / m;
  else
      grad(j) = x1/m;
  end;
end;






% =============================================================

end
