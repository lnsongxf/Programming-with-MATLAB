% Write a function called day_counter that returns the number of Mondays 
%   that fell on the first day of the month in a given year between 1776 
%   and 2016 inclusive where the requested year is the only input to your 
%   function and it is a positive integer scalar. Note that a leap year 
%   occurs on any year evenly divisible by 4, but not on a century unless 
%   it is divisible by 400. In a leap year, February has 29 days. You are
%   not allowed to use the datenum built-in function.
%
% input: year, years between 1776-2016
% output: first_monday, the number of mondays on the first day of the month

function [first_monday] = day_counter(year)

% Check for valid input:
if ~isscalar(year) || year < 1776 || year > 2016 || year ~= floor(year)
    fprintf('year needs to be a positive integer between 1776 and 2016')
    return
    
% Count the number of first days of the month that are equal to 2, i.e.
% Monday:
else
    first_monday = sum(weekday(datetime(year,1:12,1)) == 2)
end