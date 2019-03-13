function [fish] = initialise(size,nf)
createEnvironment(size);
[fish]=create_fish(nf);
%populate([fish]);
end

