function [agt,eaten]=eat(agt,cn)

%eating function for class HERRING
%agt=herring object
%cn - current agent number
%eaten = 1 if herring successfully finds a krill, =0 otherwise

%SUMMARY OF HERRING EAT RULE
%Herring calculates distance to all rabbits
%Herring identifies nearest rabbits(s)
%If more than one equidistant within search radius, one is randomly picked
%Probability of fox killing rabbit =1 - distance of rabbit/speed of fox
%If probability > rand, fox moves to rabbit location and rabbit is
%killed

%GLOBAL VARIABLES
%MESSAGES is a data structure containing information that agents need to
%broadcast to each other
   %    MESSAGES.atype - n x 1 array listing the type of each agent in the model
   %    (1=rabbit, 2-fox, 3=dead agent)
   %    MESSAGES.pos - list of every agent position in [x y]
   %    MESSAGE.dead - n x1 array containing ones for agents that have died

global MESSAGES
   
pos=agt.position;                        %extract current position 
spd=agt.perception;                    
eaten=0;

typ=MESSAGES.atype;                                         %extract types of all agents
rb=find(typ==1);                                            %indices of all krill
rpos=MESSAGES.pos(rb,:);                                     %extract positions of all krill
csep=sqrt((rpos(:,1)-pos(:,1)).^2+(rpos(:,2)-pos(:,2)).^2);  %calculate distance to all krill
[d,ind]=min(csep);                                            %d is distance to closest krill, ind is index of that krill
nrst=rb(ind);                                                %index of nearest rabbit(s)

if d<=spd&length(nrst)>0    %if there is at least one  rabbit within the search radius        
    if length(nrst)>1       %if more than one rabbit located at same distance then randomly pick one to head towards
        s=round(rand*(length(nrst)-1))+1;
        nrst=nrst(s);
    end
    pk=1-(d/spd);                       %probability that herring will kill krill is ratio of speed to distance
    if pk>rand
        nx=MESSAGES.pos(nrst,1);    %extract exact location of this krill
        ny=MESSAGES.pos(nrst,2);
        npos=[nx ny];    
        eaten=1;
        MESSAGES.dead(nrst)=1;       %send message to krill so it knows it's dead!
    end
end