function [agents] = create_fish(nf)
%CREATE_FISH Summary of this function goes here
%   Detailed explanation goes here
% creates the objects representing each fish

global ENVIRONMENT PARAM
MAX_DENSITY = PARAM.MAX_DENSITY;
s=ENVIRONMENT.size;

    for f=1:nf
        pos = round((s-1)*rand(1, 2)+1);
        % if the position is full, keep looping until a position is found
        % that has space available 
        while ~(ENVIRONMENT.space(pos(1, 1), pos(1,2)) < MAX_DENSITY)
            pos = round((s-1)*rand(1, 2)+1);
            %will be a 1x2 matrix like [1,2]
        end
        agents{f} = fish(pos,MAX_DENSITY);
        % add the fish to the environment space
        ENVIRONMENT.space(pos(1, 1), pos(1, 2)) = ENVIRONMENT.space(pos(1, 1), pos(1, 2)) + 1;
        %like array value calling another array value
    end
end

