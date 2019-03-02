classdef fish
    %not sure if pereception should be a parameter however if it is then
    %call construction with fish(pos, PARAM.Perception), making perception,
    %but all the parameter are hard coded into the programme and not given
    %by user input.
    properties
        position;
        perception;
    end
    
    methods
        function f = fish(varargin)
            switch nargin
                case 0
                    f.position = [];
                    f.perception = P_LENGTH;
                case 1 
                    f.position = varargin{1};
                    f.perception = P_LENGTH;
                otherwise
                    error('Invalid no. of input arguments for fish');
            end
        end
    end
end

