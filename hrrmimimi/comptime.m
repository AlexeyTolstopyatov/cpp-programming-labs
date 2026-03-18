clc;
printf("*** Reinterpretation of floatings in the x86 ***\n");
% Computers uses binary splitting instead of 
% decimal floatings reinterpretation. 
% Time to see it
%
% Decimal (human approved) way to interpret floatings
format long;
printf("decimal: %f\n", 0.125);
printf("decimal: %f\n", 0.1);
% Binary way to interpret floatings
format bit;
disp('binary: ');
disp(0.125); disp(2);
disp('\n');

disp('binary: ');
disp(0.1); disp(2);
disp('\n')
format long
disp('Press return to continue...');
pause

printf("** Arithmetic magic **\n");
eps_d = eps('double');
eps_s = eps('single');
printf("eps: %f\n", eps);
printf("double: %f\n", eps_d);
printf("single: %f\n", eps_s);

pause
