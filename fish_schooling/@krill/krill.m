classdef krill %declares fish object
    properties %define fish properties (parameters)
        position;
        perception;
    end
    methods
        function k = krill(varargin) %constructor method for fish - assigns values to fish properties 
            % f = rabbit(position,perception)
            % position - vector containing x,y coordinates
            % perception - integer value representing how many squares fish
            % can migrate
            switch nargin 
                case 0 %create default object 
                    k.position = [];
                    k.perception = [];
                case 1 % input is already a fish so return
                    if(isa(varargin{1},'krill'))
                        k=varargin{1};
                    else
                        error('Input argument is not a krill')
                    end
                case 2 %create a new fish 
                    k.position = varargin{1};
                    k.perception = varargin{2};
                otherwise
                    error('Invalid no. of input arguments for krill');
            end
        end
    end
end

