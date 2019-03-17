function [agents] = create_agents(nh,nk)
%   creates the objects representing each agent     

%agents - cell array containing list of objects representing agents
%nh - number of herring
%nk - number of krill 

%global parameters 
%ENVIRONMENT - data structure representing the environment 
%PARAM - data structure containing parameters for agents

global ENVIRONMENT PARAM
HERRING_DENSITY = PARAM.HERRING_DENSITY;
KRILL_DENSITY = PARAM.KRILL_DENSITY;
KRILL_PERCEPTION = PARAM.KRILL_PERCEPTION;
HERRING_PERCEPTION=PARAM.HERRING_PERCEPTION;
agents = cell(nh+nk);
agents = agents(1,:);

s=ENVIRONMENT.size;

    for h=1:nh
        % spawn herring on 1 side of the grid 
        pos = [round((s/2-1)*rand+1),round(((s-1)*rand+1))];
        % if the position is full, keep looping until a position is found
        % that has space available 
        while ~(ENVIRONMENT.herring(pos(1, 1), pos(1,2)) < HERRING_DENSITY)
            pos = [round((s/2-1)*rand+1),round(((s-1)*rand+1))];
        end
        agents{h} = herring(pos,HERRING_PERCEPTION);
        % add the herring to the environment space
        ENVIRONMENT.herring(pos(1, 1), pos(1, 2)) = ENVIRONMENT.herring(pos(1, 1), pos(1, 2)) + 1;
    end
    for k=(nh+1):(nk+nh)
        % spawn krill on other side of grid
        pos = [round((s/2-1)*rand+1)+(s/2),round(((s-1)*rand+1))]; 
        % if the position is full, keep looping until a position is found
        % that has space available 
        while ~(ENVIRONMENT.krill(pos(1, 1), pos(1,2)) < KRILL_DENSITY)
            pos = [round((s/2-1)*rand+1)+(s/2),round(((s-1)*rand+1))]; 
        end
        agents{k} = krill(pos,KRILL_PERCEPTION);
        % add the krill to the environment space
        ENVIRONMENT.krill(pos(1, 1), pos(1, 2)) = ENVIRONMENT.krill(pos(1, 1), pos(1, 2)) + 1;
    end
end

