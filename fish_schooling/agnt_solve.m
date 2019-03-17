function [nagent,nn]=agnt_solve(agent)

%sequence of functions called to apply agent rules to current agent population.
%%%%%%%%%%%%
%[nagent,nn]=agnt_solve(agent)
%%%%%%%%%%%
%agent - list of existing agent structures
%nagent - list of updated agent structures
%nn - total number of live agents at end of update

global MESSAGES

n=length(agent);    %current no. of agents
prev_n=n;   %remember current agent number at the start of this iteration
eaten=0;
%execute existing agent update loop
for cn=1:n
	curr=agent{cn};
     if isa(curr,'herring')
         [curr,eaten]=eat(curr,cn);               %eating rules (rabbits eat food, foxes eat rabbits)
         if eaten==0
            curr=move(curr);              %if no food was eaten, then migrate in search of some
         end
     end
     if isa(curr,'krill')
         curr=move(curr);
         MESSAGES.pos(cn,:)=curr.position;
     end
     agent{cn}=curr;                          %up date cell array with modified agent data structure
end
 
[nagent,nn]=update_messages(agent,prev_n,prev_n);   %function which update message list and 'kills off' dead agents.

