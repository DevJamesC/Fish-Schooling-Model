function create_environment(size)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
global ENVIRONMENT PARAM

ENVIRONMENT.shape='square';
ENVIRONMENT.units='metres_cubed';
ENVIRONMENT.size=size;
ENVIRONMENT.herring=zeros(size, size);
ENVIRONMENT.krill=zeros(size,size);

end

