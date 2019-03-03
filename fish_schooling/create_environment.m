function create_environment(size)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
global ENVIRONMENT

ENVIRONMENT.shape='square';
ENVIRONMENT.units='metres_cubed';
ENVIRONMENT.size=size;
ENVIRONMENT.space=zeros(size, size);

end

