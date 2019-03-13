function fish_schooling(size, nf,nk, nsteps)
%FISH_SCHOOLING Summary of this function goes here
%   Detailed explanation goes here
% FISH_SCHOOLING agent-based herring schooling model
% COM3001

%ecolab(size,nf,perception_length,nsteps)
%size = size of model environment in m
%nf - number of fish agents
%nsteps - number of iterations required

%clear any global variables/ close figures from previous simulations
clear global
close all
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%MODEL INITIALISATION
initialise_params;                      %sets the parameters for this simulation
create_environment(size);           %creates environment data structure, given an environment size
create_control();
%random_selection(1);                %randomises random number sequence (NOT agent order). If input=0, then simulation should be identical to previous for same initial values
[agents]=create_agents(nf,nk);       %creates nf fish agents and places them in a cell array called 'agents'
create_messages(nf,nk,agents);
initialise_results(nf,nk,nsteps);   %initilaises structure for storing results
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global N_IT ENVIRONMENT PARAM 
% definition of global variables
% N_IT - current iteration number 
% PARAM - contains the max density 
% ENVIRONMENT - data structure representing the environment

%MODEL EXECUTION
%execute for number of iterations
N_IT=0;
plot_results(agents,nsteps,true,true); %updates results figures and structures
for n_it=1:nsteps
    N_IT=n_it;
    % update agents for number of agents 
    for i=1:length(agents)
    	agents{i}=move(agents{i});     %the function which calls the rules
    end
    
       
end
plot_results(agents,nsteps,true,true); %updates results figures and structures
%disp(ENVIRONMENT.herring);

clear global
end



