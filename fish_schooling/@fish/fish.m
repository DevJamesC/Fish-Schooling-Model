classdef fish %declares fish object
    properties %define fish properties (parameters)
        position;
        perception;
    end
    methods
        function f = fish(varargin) %constructor method for fish - assigns values to fish properties 
            % f = rabbit(position,perception)
            % position - vector containing x,y coordinates
            % perception - integer value representing how many squares fish
            % can migrate
            switch nargin 
                case 0 %create default object 
                    f.position = [];
                    f.perception = [];
                case 1 % input is already a fish so return
                    if(isa(varargin{1},'fish'))
                        f=varargin{1};
                    else
                        error('Input argument is not a fish')
                    end
                case 2 %create a new fish 
                    f.position = varargin{1};
                    f.perception = varargin{2};
                otherwise
                    error('Invalid no. of input arguments for fish');
            end
        end
    end
end

