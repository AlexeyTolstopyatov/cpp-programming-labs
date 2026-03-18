% define matrix components 
coeff = [2 6 -1; 5 -1 2; -3 -4 1];
free = [-12; 29; 5]
%
% invertor method implementation
%
vec = coeff \ free;
vec

coefi = inv(coeff);
coefi
% First solution method resulting vector
x1 = coefi * free;

condition = cond(coeff, 1);
delta = det(coeff);
printf("det(coeff) = %f\n", delta);

% Gaussian (Second) solution method resulting vector
x2 = linsolve(coeff, free);

norm(coeff * vec - free);

