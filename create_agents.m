function [agents] = create_agents(nf,nk)
%CREATE_FISH Summary of this function goes here
%   Detailed explanation goes here
% creates the objects representing each fish

global ENVIRONMENT PARAM
HERRING_DENSITY = PARAM.HERRING_DENSITY;
KRILL_DENSITY = PARAM.KRILL_DENSITY;
agents = cell(nf+nk);
agents = agents(1,:);

s=ENVIRONMENT.size;

    for f=1:nf
        pos = round((s-1)*rand(1, 2)+1);
        % if the position is full, keep looping until a position is found
        % that has space available 
        while ~(ENVIRONMENT.herring(pos(1, 1), pos(1,2)) < HERRING_DENSITY)
            pos = round((s-1)*rand(1, 2)+1);
            %will be a 1x2 matrix like [1,2]
        end
        agents{f} = fish(pos,PARAM.PERCEPTION);
        % add the fish to the environment space
        ENVIRONMENT.herring(pos(1, 1), pos(1, 2)) = ENVIRONMENT.herring(pos(1, 1), pos(1, 2)) + 1;
        %like array value calling another array value
    end
    for k=(nf+1):(nk+nf)
         pos = round((s-1)*rand(1, 2)+1);
        % if the position is full, keep looping until a position is found
        % that has space available 
        while ~(ENVIRONMENT.krill(pos(1, 1), pos(1,2)) < KRILL_DENSITY)
            pos = round((s-1)*rand(1, 2)+1);
            %will be a 1x2 matrix like [1,2]
        end
        agents{k} = krill(pos,PARAM.PERCEPTION);
        % add the fish to the environment space
        ENVIRONMENT.krill(pos(1, 1), pos(1, 2)) = ENVIRONMENT.krill(pos(1, 1), pos(1, 2)) + 1;
        %like array value calling another array value
    end
        x = length(agents);
end

