function [agents] = create_fish(nf)
%CREATE_FISH Summary of this function goes here
%   Detailed explanation goes here

global ENVIRONMENT

s=ENVIRONMENT.size;
%positions= round((s-1)*rand(nf,2)+1);  
 
    for f=1:nf
        pos = round((s-1)*rand(1, 2)+1);
        while ~(ENVIRONMENT.space(pos(1, 1), pos(1,2)) < MAX_DENSITY)
            pos = round((s-1)*rand(1, 2)+1);
            %will be a 1x2 matrix like [1,2]
        end
        agents{f} = fish(pos);
        %perhaps use populate function to populate environment using code
        %below so like
        %populate(pos);
        ENVIRONMENT.space(pos(1, 1), pos(1, 2)) = ENVIRONMENT.space(pos(1, 1), pos(1, 2)) + 1;
        %like array value calling another array value
    end

    %for f=1:nf
    %    agents{f}=fish(positions(f, :));
    %end
    
% for f=1:nf
%      agents{f} = fish(round((s-1)*rand(1, 2)+1));
% end
end

