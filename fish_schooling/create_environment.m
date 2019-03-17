function create_environment(size)
%function that populates the global data structure representing
%environmental information
global ENVIRONMENT PARAM

ENVIRONMENT.shape='square';
ENVIRONMENT.units='metres_cubed';
ENVIRONMENT.size=size;
ENVIRONMENT.ground=floor(50*ones(size,size));
ENVIRONMENT.herring=zeros(size, size);
ENVIRONMENT.krill=zeros(size,size);

end

