function c=set(c,prop_name,val)

%standard function to allow insertion of memory parameters from fish object

switch prop_name
   
case 'position'
   c.position=val;
case 'perception'
    c.perception=val; 
otherwise 
   error('invalid field name')
end

