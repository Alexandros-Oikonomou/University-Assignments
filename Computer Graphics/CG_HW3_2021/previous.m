% Author: 
%   Konstantinos Chatzis
%   kachatzis <at> ece.auth.gr
%
%   Computer Graphics
%   Project 1
%   24/3/2021

%% previous
% finds previous integer in a circle of integers
% Starting from 1
% i: input
% max: maximum integer
function value = previous(i, max)
    value = i - 1;
    if value < 1 
        value = max;
    end
end