function [agents] = create_fish(nf)
%CREATE_FISH Summary of this function goes here
%   Detailed explanation goes here
% creates the objects representing each fish

global ENVIRONMENT PARAM

s=ENVIRONMENT.size;

    for f=1:nf
        pos = round((s-1)*rand(1, 2)+1);
        % if the position is full, keep looping until a position is found
        % that has space available 
        while ~(ENVIRONMENT.space(pos(1, 1), pos(1,2)) < MAX_DENSITY)
            pos = round((s-1)*rand(1, 2)+1);
            %will be a 1x2 matrix like [1,2]
        end
        agents{f} = fish(pos,PARAM.MAX_DENSITY);
        %perhaps use populate function to populate environment using code
        %below so like
        %populate(pos);
        ENVIRONMENT.space(pos(1, 1), pos(1, 2)) = ENVIRONMENT.space(pos(1, 1), pos(1, 2)) + 1;
        %like array value calling another array value
    end
end

