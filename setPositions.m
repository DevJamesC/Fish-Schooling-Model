function [agents] = setPositions(arrfish)
%SETPOSITIONS Summary of this function goes here
%   Detailed explanation goes here
for i=1:length(arrfish)
    agent{i}.position = agent{i}.move();
end

