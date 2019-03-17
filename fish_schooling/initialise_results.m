function initialise_results(nh,nk,nsteps)

 global  IT_STATS ENV_DATA CONTROL_DATA 
 
%set up data structure to record statistics for each model iteration
%IT_STATS  -  is data structure containing statistics on model at each
%iteration (number of agents etc)
%ENV_DATA - data structure representing the environment 
 
 IT_STATS=struct('tot',[zeros(1,nsteps+1)],...				%total no. agents in model per iteration
                'tot_k',[zeros(1,nsteps+1)],...             % total no. rabbits
                'tot_h',[zeros(1,nsteps+1)]);          % total no. foxes
 IT_STATS.tot(1)=nk+nh;
 IT_STATS.tot_k(1)=nk;
 IT_STATS.tot_h(1)=nh;
