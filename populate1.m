function populate1(arrfish)
%think this is nolonger needed 
for i=1:length(arrfish)
    position = arrfish{i}.getPosition();
    %confused between matlab or java syntax maybe this instead 
    %position = get(arrfish{i}, position);
    ENVIRONMENT.space(position(1, 1), position(1, 2)) = ENVIRONMENT.space(position(1, 1), position(1, 2)) + 1;
end
end

