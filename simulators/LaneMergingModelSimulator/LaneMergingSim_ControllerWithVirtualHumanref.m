function sys=LaneMergingSim_ControllerWithVirtualHumanref
sys = [];
sys.child = [];
sys.NumDataTypes = 1; 
sys.DataTypes = [];
temp.EnumNames='';
temp.EnumValues = [];
temp.Name = '';
sys.DataTypes = repmat(temp,1,1);
sys.DataTypes(1).Name = 'real_T';
