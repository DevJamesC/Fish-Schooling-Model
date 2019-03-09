function [updatedFish] = move(fish)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

global ENVIRONMENT 

upperLeft=0;
upperRight=0;
left=0;
right=0;
up=0;
down=0;
lowerLeft=0;
lowerRight=0;
changes=[0,0,0,0,0,0,0,0];
% vector with changing size depending on perception 
perception = 1:1:(fish.perception-1);
perceptionReverse = sort(perception,'descend');

%     %calculates weights for upper left and upper right, depending on input
%     function [weight] = uppers(direction)
%         if(direction=='upperLeft')           
%             for i = perception*-1
%                 for j = perception*-1
%                     if (((fish.position(1)+j<=0) || fish.position(2)+i<=0)==1)
%                          upperLeft = dens(fish.position(1), fish.position(2))./max(abs(i), abs(j));
%                     else      
%                          upperLeft = dens(fish.position(1) + j, fish.position(2) + i)./max(abs(i), abs(j));
%                          changes(1)=1;
%                     end
%                 end
%             end
%         else
%             for i = perception
%                 for j = perception*-1
%                     if ((fish.position(1)+j<=0) || (fish.position(2)+i>ENVIRONMENT.size))
%                          upperRight = dens(fish.position(1), fish.position(2));
%                     else
%                          upperRight = dens(fish.position(1) + j, fish.position(2) + i)./max(abs(i), abs(j));
%                          changes(2)=1;
%                     end
%                 end
%             end                           
%         end
%     end
% 
%         


% environment densities
dens = ENVIRONMENT.space;

 for i = perceptionReverse*-1
     for j = perceptionReverse*-1
         if (((fish.position(1)+j<=0) || fish.position(2)+i<=0)==1)
             upperLeft = dens(fish.position(1), fish.position(2))./max(abs(i), abs(j));
         else      
             upperLeft = dens(fish.position(1) + j, fish.position(2) + i)./max(abs(i), abs(j));
             changes(1)=1;
         end
     end
 end
% upper right
 for i = perceptionReverse
     for j = perceptionReverse*-1
         if ((fish.position(1)+j<=0) || (fish.position(2)+i>ENVIRONMENT.size))
             upperRight = dens(fish.position(1), fish.position(2));
         else
             upperRight = dens(fish.position(1) + j, fish.position(2) + i)./max(abs(i), abs(j));
             changes(2)=1;
         end
     end
 end
 %disp("upper right");
 %disp(upperRight);
 
 %lower left
 for i = perceptionReverse*-1
      for j = perceptionReverse
          if((fish.position(1)+j>ENVIRONMENT.size) || (fish.position(2)+i<=0))
             lowerLeft = dens(fish.position(1),fish.position(2));
          else
             lowerLeft = dens(fish.position(1) + j, fish.position(2) + i)./max(abs(i), abs(j));
             changes(3)=1;
          end
      end
 end
 %disp("lower left");
 %disp(lowerLeft);
 
 %lower right
 for i = perceptionReverse
      for j = perceptionReverse
          if((fish.position(1)+j>ENVIRONMENT.size) || (fish.position(2)+i>ENVIRONMENT.size))
             lowerRight = dens(fish.position(1),fish.position(2));
          else
             lowerRight = dens(fish.position(1) + j, fish.position(2) + i)./max(abs(i), abs(j));
             changes(4)=1;
          end
      end
 end
 %disp("lower right");
 %disp(lowerRight);
 
 %right
 for i = perception
     if((fish.position(2)+i>ENVIRONMENT.size))
         right = right + dens(fish.position(1), fish.position(2));
     else
         right = right + dens(fish.position(1), fish.position(2)+i)./abs(i);
         changes(5)=1;
     end
 end 
 %disp("right");
 %disp(right);
 
 %left
 for i = perception
     if((fish.position(2)-i<=0))
         left = dens(fish.position(1), fish.position(2));
     else
         left = dens(fish.position(1), fish.position(2)-i)./abs(i);   
         changes(6)=1;
     end
 end  
% disp("left");
 %disp(left);
 
 %up
 for j = perception
     if((fish.position(1)-j<=0))
         up = dens(fish.position(1), fish.position(2));
     else
         up = dens(fish.position(1)-j, fish.position(2))./abs(j);    
         changes(7)=1;
     end
 end 
% disp("up");
% disp(up);
 
 %down
 for j = perception
     if((fish.position(1)+j>ENVIRONMENT.size))
         down = dens(fish.position(1), fish.position(2));
     else
         down = dens(fish.position(1)+j, fish.position(2))./abs(j);  
         changes(8)=1;
     end
 end 
% disp("down");
% disp(down);
 
% sort weights from highest to lowest 
Q = sort([up,down,left,right,upperLeft,lowerLeft,upperRight,lowerRight],'descend');
Q = Q(1:5);
%disp("Q");
%disp(Q);

i = rand;

% choose a weight based on % chances
switch true
    case ((0<=i)&&(i<0.75))
        weight = Q(1);
    case ((0.75<=i)&&(i<0.87))
        weight = Q(2);
    case ((0.87<=i)&&(i<0.93))
        weight = Q(3);
    case ((0.93<=i)&&(i<0.97))
        weight = Q(4);
    case ((0.97<=i)&&(i<=1.00))
        weight = Q(5);

end

row = fish.position(1);
col = fish.position(2);


switch true
    case (weight == upperLeft)
        if(changes(1)==1)    
            dens(row-1,col-1)=dens(row-1,col-1)+1;
            dens(row,col)= dens(row,col)-1;
            pos = [row-1,col-1];
        else
            pos = [row,col];
        end
    case(weight == upperRight)
        if(changes(2)==1)  
            dens(row-1,col+1)=dens(row-1,col+1)+1;
            dens(row,col)= dens(row,col)-1;

            pos = [row-1,col+1];
        else
            pos = [row,col];
        end
     case(weight == right)
         if(changes(5)==1)  
            dens(row,col+1)=dens(row,col+1)+1;
            dens(row,col)= dens(row,col)-1;

            pos = [row,col+1];
         else
            pos = [row,col];
         end
     case(weight == left) 
         if(changes(6)==1)
            dens(row,col-1)=dens(row,col-1)+1;
            dens(row,col)= dens(row,col)-1;

            pos = [row,col-1];
         else
            pos = [row,col];
         end
     case(weight == up)
         if(changes(7)==1)        
            dens(row-1,col)=dens(row-1,col)+1;
            dens(row,col)= dens(row,col)-1;

            pos = [row-1,col];
         else
            pos = [row,col];

         end
     case(weight == down)
         if(changes(8)==1)             
            dens(row+1,col)=dens(row+1,col)+1;
            dens(row,col)= dens(row,col)-1;

            pos = [row+1,col];
         else
            pos = [row,col];

         end
     case(weight == lowerLeft)
         if(changes(3)==1)
            dens(row+1,col-1)=dens(row+1,col-1)+1;
            dens(row,col)= dens(row,col)-1;

            pos = [row+1,col-1];
         else
            pos = [row,col];

         end
     case(weight == lowerRight)
         if(changes(4)==1)
            dens(row+1,col+1)=dens(row+1,col+1)+1;
            dens(row,col)= dens(row,col)-1;

            pos = [row+1,col+1];
         else
            pos = [row,col];
         end
end
ENVIRONMENT.space = dens;
fish.position = pos;
updatedFish = fish();
end

