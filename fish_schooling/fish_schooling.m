function fish_schooling(size, nf, perception_length, nsteps)
%FISH_SCHOOLING Summary of this function goes here
%   Detailed explanation goes here

global ENVIRONMENT P_LENGTH N_IT MAX_DENSITY

P_LENGTH = perception_length;

for i=1:nsteps
    if i == 0
        initialise(size, nf);
    else
        update
    end
end
 


end

