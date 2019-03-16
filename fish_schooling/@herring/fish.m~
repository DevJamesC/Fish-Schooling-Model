classdef herring %declares herring object
    properties %define herring properties (parameters)
        position;
        perception;
    end
    methods
        function h = herring(varargin) %constructor method for herring - assigns values to herring properties 
            % f = herring(position,perception)
            % position - vector containing x,y coordinates
            % perception - integer value representing how many squares
            % herring
            % can see
            switch nargin 
                case 0 %create default object 
                    h.position = [];
                    h.perception = [];
                case 1 % input is already a herring so return
                    if(isa(varargin{1},'herring'))
                        h=varargin{1};
                    else
                        error('Input argument is not a herring')
                    end
                case 2 %create a new fish 
                    h.position = varargin{1};
                    h.perception = varargin{2};
                otherwise
                    error('Invalid no. of input arguments for herring');
            end
        end
    end
end

