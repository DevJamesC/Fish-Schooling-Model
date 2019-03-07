function [outputArg1] = test(inputArg1)
%M = [1, 2, 3; 4, 5,6;7, 8, 9]
%a = round(2*rand(1, 2)+1); 
%disp(a);
%disp(a(1, 1));
%disp(a(1, 2));

%disp(M(a(1,1), a(1, 2)));
%M(a(1,1), a(1, 2)) = M(a(1,1), a(1, 2)) + 1;
%disp(M)



M = round(9*rand(5, 5) + 1);
L = zeros(3, 3);
disp(M)
%change the -2 and 2 to -(perception_length) and perception_length
%use switch and case to chose direction with random function, then use
%another switch and case to do directions with find(X) on matrix of
%direction weights
%will be better if works but at moment display tons of crap to console
%work out why prints s and t loads of times
%{
direction = 0;
b = [[-2:-1], [2:1]]
  for t = 0:1
      for s = 0:1
        for i = b[t]
            for j = b[s]
                %disp(M(3+j, 3+i));
                direction = direction + M(3 + j, 3 + i)./max(abs(i), abs(j));
            end
        end
        disp(direction);
      end
  end
end
%}

L(2, 2) = M(3, 3);
%upper left
direction = 0;
 for i = [-2, -1]
     for j = [-2, -1]
         %disp(M(3+j, 3+i));
         direction = direction + M(3 + j, 3 + i)./max(abs(i), abs(j));
     end
 end
 L(1,1) = direction;
 disp("upper left");
 disp(direction);
 
% upper right
direction1 =0;
 for i = [2, 1]
     for j = [-2, -1]
         %disp(M(3+j, 3+i));
          direction1 = direction1 + M(3 + j, 3 + i)./max(abs(i), abs(j));
     end
 end
 L(1, 3) = direction1;
 disp("upper right");
 disp(direction1);
 
 %lower left
 direction2 = 0;
 for i = [-2, -1]
      for j = [2, 1]
          %disp(M(3+j, 3+i));
          direction2 = direction2 + M(3 + j, 3 + i)./max(abs(i), abs(j));
      end
 end
 L(3, 1) = direction2;
 disp("lower left");
 disp(direction2);
 
 % lower right 
 direction3 = 0;
 for i = [2, 1]
      for j = [2, 1]
          %disp(M(3+j, 3+i));
          direction3 = direction3 + M(3 + j, 3 + i)./max(abs(i), abs(j));
      end
 end
 L(3, 3) = direction3;
 disp("lower right");
 disp(direction3);
 
 %right
 direction4 = 0;
 for i = 1:2
     direction4 = direction4 + M(3, 3+i)./abs(i);    
 end 
 disp("right");
 disp(direction4);
 L(2, 3) = direction4;
 
 %left
 direction5 = 0;
 for i = 1:2
     direction5 = direction5 + M(3, 3-i)./abs(i);    
 end  
 disp("left");
 disp(direction5);
 L(2, 1) = direction5;
 
 %up
 direction6 = 0;
 for j = 1:2
     direction6 = direction6 + M(3-j, 3)./abs(j);    
 end 
 disp("up");
 disp(direction6);
 L(1, 2) = direction6;
 
 %down
 direction7 = 0;
 for j = 1:2
     direction7 = direction7 + M(3+j, 3)./abs(j);    
 end 
 disp("down");
 disp(direction7);
 L(3, 2) = direction7;
 
 disp(L);
 
%not sure why this reshapes into weird order it does
%this reshapes the matrix into a vector then sorts the top 5
Q = reshape(L,1,[]);
Q = sort(Q,'descend');
Q = Q(1:5);
disp("Q");
disp(Q);

%this doesnt work dont know why 
%[row, column] = find(M == Q(1));



%does not produce 0, 1 is open interval not sure if 0,1 are needed 
%i = rand;
%{
this code doesnt work 
switch i = rand
    case 0<=i<0.75
        find(M == Q(1));
    case 0.75<=i<0.87
        Q(2);
    case 0.87<=i<0.93
        Q(3);
    case 0.93<=i<0.97
        Q(4);
    case 0.97<=i<1.00
        Q(5);
end
%}





        




        
    


 
 
 
 
 
 
     
     
     

