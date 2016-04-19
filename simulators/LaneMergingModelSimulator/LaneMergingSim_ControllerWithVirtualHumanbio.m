function bio=LaneMergingSim_ControllerWithVirtualHumanbio
bio = [];
bio(1).blkName='Gain';
bio(1).sigName='Enable';
bio(1).portIdx=0;
bio(1).dim=[1,1];
bio(1).sigWidth=1;
bio(1).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Enable';
bio(1).ndims=2;
bio(1).size=[];
bio(1).isStruct=false;
bio(getlenBIO) = bio(1);

bio(2).blkName='Rate Transition2';
bio(2).sigName='';
bio(2).portIdx=0;
bio(2).dim=[1,1];
bio(2).sigWidth=1;
bio(2).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RateTransition2';
bio(2).ndims=2;
bio(2).size=[];
bio(2).isStruct=false;

bio(3).blkName='Rate Transition3';
bio(3).sigName='';
bio(3).portIdx=0;
bio(3).dim=[1,1];
bio(3).sigWidth=1;
bio(3).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RateTransition3';
bio(3).ndims=2;
bio(3).size=[];
bio(3).isStruct=false;

bio(4).blkName='Rate Transition4';
bio(4).sigName='';
bio(4).portIdx=0;
bio(4).dim=[1,1];
bio(4).sigWidth=1;
bio(4).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RateTransition4';
bio(4).ndims=2;
bio(4).size=[];
bio(4).isStruct=false;

bio(5).blkName='Rate Transition5';
bio(5).sigName='';
bio(5).portIdx=0;
bio(5).dim=[1,1];
bio(5).sigWidth=1;
bio(5).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RateTransition5';
bio(5).ndims=2;
bio(5).size=[];
bio(5).isStruct=false;

bio(6).blkName='AutonomousVehicleSimulator/MATLAB Function1/p1';
bio(6).sigName='';
bio(6).portIdx=0;
bio(6).dim=[1,1];
bio(6).sigWidth=1;
bio(6).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.x_r_c';
bio(6).ndims=2;
bio(6).size=[];
bio(6).isStruct=false;

bio(7).blkName='AutonomousVehicleSimulator/MATLAB Function1/p2';
bio(7).sigName='';
bio(7).portIdx=1;
bio(7).dim=[1,1];
bio(7).sigWidth=1;
bio(7).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.v_r_k';
bio(7).ndims=2;
bio(7).size=[];
bio(7).isStruct=false;

bio(8).blkName='AutonomousVehicleSimulator/MATLAB Function3/p1';
bio(8).sigName='x_g';
bio(8).portIdx=0;
bio(8).dim=[1,1];
bio(8).sigWidth=1;
bio(8).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.x_g';
bio(8).ndims=2;
bio(8).size=[];
bio(8).isStruct=false;

bio(9).blkName='AutonomousVehicleSimulator/MATLAB Function3/p2';
bio(9).sigName='y_g';
bio(9).portIdx=1;
bio(9).dim=[1,1];
bio(9).sigWidth=1;
bio(9).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.y_g';
bio(9).ndims=2;
bio(9).size=[];
bio(9).isStruct=false;

bio(10).blkName='AutonomousVehicleSimulator/MATLAB Function3/p3';
bio(10).sigName='theta_g';
bio(10).portIdx=2;
bio(10).dim=[1,1];
bio(10).sigWidth=1;
bio(10).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.theta_g';
bio(10).ndims=2;
bio(10).size=[];
bio(10).isStruct=false;

bio(11).blkName='AutonomousVehicleSimulator/MATLAB Function3/p4';
bio(11).sigName='v_g';
bio(11).portIdx=3;
bio(11).dim=[1,1];
bio(11).sigWidth=1;
bio(11).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.v_g';
bio(11).ndims=2;
bio(11).size=[];
bio(11).isStruct=false;

bio(12).blkName='AutonomousVehicleSimulator/Memory';
bio(12).sigName='';
bio(12).portIdx=0;
bio(12).dim=[1,1];
bio(12).sigWidth=1;
bio(12).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Memory';
bio(12).ndims=2;
bio(12).size=[];
bio(12).isStruct=false;

bio(13).blkName='AutonomousVehicleSimulator/v_r_old1';
bio(13).sigName='';
bio(13).portIdx=0;
bio(13).dim=[1,1];
bio(13).sigWidth=1;
bio(13).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.v_r_old1';
bio(13).ndims=2;
bio(13).size=[];
bio(13).isStruct=false;

bio(14).blkName='AutonomousVehicleSimulator/x_r_old';
bio(14).sigName='';
bio(14).portIdx=0;
bio(14).dim=[1,1];
bio(14).sigWidth=1;
bio(14).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.x_r_old';
bio(14).ndims=2;
bio(14).size=[];
bio(14).isStruct=false;

bio(15).blkName='Controller/MATLAB Function/p1';
bio(15).sigName='';
bio(15).portIdx=0;
bio(15).dim=[1,1];
bio(15).sigWidth=1;
bio(15).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.d_out';
bio(15).ndims=2;
bio(15).size=[];
bio(15).isStruct=false;

bio(16).blkName='Controller/MATLAB Function/p2';
bio(16).sigName='';
bio(16).portIdx=1;
bio(16).dim=[1,1];
bio(16).sigWidth=1;
bio(16).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.v_out';
bio(16).ndims=2;
bio(16).size=[];
bio(16).isStruct=false;

bio(17).blkName='Controller/MATLAB Function2/p1';
bio(17).sigName='';
bio(17).portIdx=0;
bio(17).dim=[1,1];
bio(17).sigWidth=1;
bio(17).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.control_discrete';
bio(17).ndims=2;
bio(17).size=[];
bio(17).isStruct=false;

bio(18).blkName='Controller/MATLAB Function2/p2';
bio(18).sigName='u';
bio(18).portIdx=1;
bio(18).dim=[1,1];
bio(18).sigWidth=1;
bio(18).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.u';
bio(18).ndims=2;
bio(18).size=[];
bio(18).isStruct=false;

bio(19).blkName='Controller/MATLAB Function4/p1';
bio(19).sigName='';
bio(19).portIdx=0;
bio(19).dim=[1,1];
bio(19).sigWidth=1;
bio(19).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.x_h';
bio(19).ndims=2;
bio(19).size=[];
bio(19).isStruct=false;

bio(20).blkName='Controller/MATLAB Function4/p2';
bio(20).sigName='';
bio(20).portIdx=1;
bio(20).dim=[1,1];
bio(20).sigWidth=1;
bio(20).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.v_h';
bio(20).ndims=2;
bio(20).size=[];
bio(20).isStruct=false;

bio(21).blkName='Controller/MATLAB Function5';
bio(21).sigName='';
bio(21).portIdx=0;
bio(21).dim=[1,1];
bio(21).sigWidth=1;
bio(21).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.q';
bio(21).ndims=2;
bio(21).size=[];
bio(21).isStruct=false;

bio(22).blkName='Controller/From File';
bio(22).sigName='';
bio(22).portIdx=0;
bio(22).dim=[1,1];
bio(22).sigWidth=1;
bio(22).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.FromFile';
bio(22).ndims=2;
bio(22).size=[];
bio(22).isStruct=false;

bio(23).blkName='Controller/From File1';
bio(23).sigName='';
bio(23).portIdx=0;
bio(23).dim=[1022,1];
bio(23).sigWidth=1022;
bio(23).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.FromFile1[0]';
bio(23).ndims=2;
bio(23).size=[];
bio(23).isStruct=false;

bio(24).blkName='Controller/From File2';
bio(24).sigName='';
bio(24).portIdx=0;
bio(24).dim=[4088,1];
bio(24).sigWidth=4088;
bio(24).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.FromFile2[0]';
bio(24).ndims=2;
bio(24).size=[];
bio(24).isStruct=false;

bio(25).blkName='Controller/From File3';
bio(25).sigName='';
bio(25).portIdx=0;
bio(25).dim=[257544,1];
bio(25).sigWidth=257544;
bio(25).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.FromFile3[0]';
bio(25).ndims=2;
bio(25).size=[];
bio(25).isStruct=false;

bio(26).blkName='Controller/Gain';
bio(26).sigName='x_r';
bio(26).portIdx=0;
bio(26).dim=[1,1];
bio(26).sigWidth=1;
bio(26).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.x_r';
bio(26).ndims=2;
bio(26).size=[];
bio(26).isStruct=false;

bio(27).blkName='Controller/Gain1';
bio(27).sigName='y_r';
bio(27).portIdx=0;
bio(27).dim=[1,1];
bio(27).sigWidth=1;
bio(27).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.y_r';
bio(27).ndims=2;
bio(27).size=[];
bio(27).isStruct=false;

bio(28).blkName='Controller/Gain2';
bio(28).sigName='theta_r';
bio(28).portIdx=0;
bio(28).dim=[1,1];
bio(28).sigWidth=1;
bio(28).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.theta_r';
bio(28).ndims=2;
bio(28).size=[];
bio(28).isStruct=false;

bio(29).blkName='Controller/Gain3';
bio(29).sigName='v_r';
bio(29).portIdx=0;
bio(29).dim=[1,1];
bio(29).sigWidth=1;
bio(29).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.v_r';
bio(29).ndims=2;
bio(29).size=[];
bio(29).isStruct=false;

bio(30).blkName='Controller/belief';
bio(30).sigName='';
bio(30).portIdx=0;
bio(30).dim=[12,1];
bio(30).sigWidth=12;
bio(30).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.belief[0]';
bio(30).ndims=2;
bio(30).size=[];
bio(30).isStruct=false;

bio(31).blkName='Controller/d_h_mem';
bio(31).sigName='';
bio(31).portIdx=0;
bio(31).dim=[1,1];
bio(31).sigWidth=1;
bio(31).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.d_h_mem';
bio(31).ndims=2;
bio(31).size=[];
bio(31).isStruct=false;

bio(32).blkName='Controller/d_r_mem';
bio(32).sigName='';
bio(32).portIdx=0;
bio(32).dim=[1,1];
bio(32).sigWidth=1;
bio(32).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.d_r_mem';
bio(32).ndims=2;
bio(32).size=[];
bio(32).isStruct=false;

bio(33).blkName='Controller/sigma';
bio(33).sigName='';
bio(33).portIdx=0;
bio(33).dim=[1,1];
bio(33).sigWidth=1;
bio(33).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.sigma';
bio(33).ndims=2;
bio(33).size=[];
bio(33).isStruct=false;

bio(34).blkName='Controller/u_mem';
bio(34).sigName='';
bio(34).portIdx=0;
bio(34).dim=[1,1];
bio(34).sigWidth=1;
bio(34).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.u_mem';
bio(34).ndims=2;
bio(34).size=[];
bio(34).isStruct=false;

bio(35).blkName='Controller/v_h_mem';
bio(35).sigName='';
bio(35).portIdx=0;
bio(35).dim=[1,1];
bio(35).sigWidth=1;
bio(35).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.v_h_mem';
bio(35).ndims=2;
bio(35).size=[];
bio(35).isStruct=false;

bio(36).blkName='Controller/v_r_mem';
bio(36).sigName='';
bio(36).portIdx=0;
bio(36).dim=[1,1];
bio(36).sigWidth=1;
bio(36).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.v_r_mem';
bio(36).ndims=2;
bio(36).size=[];
bio(36).isStruct=false;

bio(37).blkName='Controller/Divide';
bio(37).sigName='';
bio(37).portIdx=0;
bio(37).dim=[1,1];
bio(37).sigWidth=1;
bio(37).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Divide';
bio(37).ndims=2;
bio(37).size=[];
bio(37).isStruct=false;

bio(38).blkName='Controller/Discrete FIR Filter';
bio(38).sigName='';
bio(38).portIdx=0;
bio(38).dim=[1,1];
bio(38).sigWidth=1;
bio(38).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.DiscreteFIRFilter';
bio(38).ndims=2;
bio(38).size=[];
bio(38).isStruct=false;

bio(39).blkName='Controller/CalBelief Subsystem/MATLAB Function1/p1';
bio(39).sigName='';
bio(39).portIdx=0;
bio(39).dim=[12,1];
bio(39).sigWidth=12;
bio(39).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.b_q_next[0]';
bio(39).ndims=2;
bio(39).size=[];
bio(39).isStruct=false;

bio(40).blkName='Controller/CalBelief Subsystem/MATLAB Function1/p2';
bio(40).sigName='';
bio(40).portIdx=1;
bio(40).dim=[4,1];
bio(40).sigWidth=4;
bio(40).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.b_x_next[0]';
bio(40).ndims=2;
bio(40).size=[];
bio(40).isStruct=false;

function len = getlenBIO
len = 40;

