function val=get(c,prop_name)

%standard function to allow extraction of memory parameters from fish object

switch prop_name
   
case 'position'
   val=c.position;
case 'perception'
   val=c.perception; 
otherwise 
   error('invalid field name')
end

