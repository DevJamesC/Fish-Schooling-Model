function fish_schooling(size, nf, nsteps)
%FISH_SCHOOLING Summary of this function goes here
%   Detailed explanation goes here
% FISH_SCHOOLING agent-based herring schooling model
% COM3001

%ecolab(size,nf,perception_length,nsteps)
%size = size of model environment in m
%nf - number of fish agents
%nsteps - number of iterations required

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%MODEL INITIALISATION
initialise_params;                      %sets the parameters for this simulation
create_environment(size);           %creates environment data structure, given an environment size
%random_selection(1);                %randomises random number sequence (NOT agent order). If input=0, then simulation should be identical to previous for same initial values
[agent]=create_fish(nf);       %creates nf fish agents and places them in a cell array called 'agents'
%initialise_results(nr,nf,nsteps);   %initilaises structure for storing results
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global N_IT ENVIRONMENT PARAM
% definition of global variables
% N_IT - current iteration number 
% PARAM - contains the max density 
% ENVIRONMENT - data structure representing the environment


%MODEL EXECUTION
for i=1:nsteps
    if i == 0
        initialise(size, nf);
    else
        update
    end
end
 


end

