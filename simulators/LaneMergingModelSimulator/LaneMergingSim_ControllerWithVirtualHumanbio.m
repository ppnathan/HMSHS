function bio=LaneMergingSim_ControllerWithVirtualHumanbio
bio = [];
bio(1).blkName='SPAS_Ctrl';
bio(1).sigName='';
bio(1).portIdx=0;
bio(1).dim=[1,1];
bio(1).sigWidth=1;
bio(1).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.SPAS_Ctrl';
bio(1).ndims=2;
bio(1).size=[];
bio(1).isStruct=false;
bio(getlenBIO) = bio(1);

bio(2).blkName='Gain';
bio(2).sigName='Enable';
bio(2).portIdx=0;
bio(2).dim=[1,1];
bio(2).sigWidth=1;
bio(2).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Enable';
bio(2).ndims=2;
bio(2).size=[];
bio(2).isStruct=false;

bio(3).blkName='Rate Transition1';
bio(3).sigName='';
bio(3).portIdx=0;
bio(3).dim=[1,1];
bio(3).sigWidth=1;
bio(3).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RateTransition1_m';
bio(3).ndims=2;
bio(3).size=[];
bio(3).isStruct=false;

bio(4).blkName='Rate Transition2';
bio(4).sigName='';
bio(4).portIdx=0;
bio(4).dim=[1,1];
bio(4).sigWidth=1;
bio(4).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RateTransition2_g';
bio(4).ndims=2;
bio(4).size=[];
bio(4).isStruct=false;

bio(5).blkName='Rate Transition3';
bio(5).sigName='';
bio(5).portIdx=0;
bio(5).dim=[1,1];
bio(5).sigWidth=1;
bio(5).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RateTransition3_m';
bio(5).ndims=2;
bio(5).size=[];
bio(5).isStruct=false;

bio(6).blkName='Rate Transition4';
bio(6).sigName='';
bio(6).portIdx=0;
bio(6).dim=[1,1];
bio(6).sigWidth=1;
bio(6).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RateTransition4_n';
bio(6).ndims=2;
bio(6).size=[];
bio(6).isStruct=false;

bio(7).blkName='Rate Transition5';
bio(7).sigName='';
bio(7).portIdx=0;
bio(7).dim=[1,1];
bio(7).sigWidth=1;
bio(7).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RateTransition5_k';
bio(7).ndims=2;
bio(7).size=[];
bio(7).isStruct=false;

bio(8).blkName='AutonomousVehicleSimulator/MATLAB Function1/p1';
bio(8).sigName='';
bio(8).portIdx=0;
bio(8).dim=[1,1];
bio(8).sigWidth=1;
bio(8).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.x_r_c';
bio(8).ndims=2;
bio(8).size=[];
bio(8).isStruct=false;

bio(9).blkName='AutonomousVehicleSimulator/MATLAB Function1/p2';
bio(9).sigName='';
bio(9).portIdx=1;
bio(9).dim=[1,1];
bio(9).sigWidth=1;
bio(9).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.v_r_k';
bio(9).ndims=2;
bio(9).size=[];
bio(9).isStruct=false;

bio(10).blkName='AutonomousVehicleSimulator/MATLAB Function3/p1';
bio(10).sigName='x_g';
bio(10).portIdx=0;
bio(10).dim=[1,1];
bio(10).sigWidth=1;
bio(10).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.x_g';
bio(10).ndims=2;
bio(10).size=[];
bio(10).isStruct=false;

bio(11).blkName='AutonomousVehicleSimulator/MATLAB Function3/p2';
bio(11).sigName='y_g';
bio(11).portIdx=1;
bio(11).dim=[1,1];
bio(11).sigWidth=1;
bio(11).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.y_g';
bio(11).ndims=2;
bio(11).size=[];
bio(11).isStruct=false;

bio(12).blkName='AutonomousVehicleSimulator/MATLAB Function3/p3';
bio(12).sigName='theta_g';
bio(12).portIdx=2;
bio(12).dim=[1,1];
bio(12).sigWidth=1;
bio(12).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.theta_g';
bio(12).ndims=2;
bio(12).size=[];
bio(12).isStruct=false;

bio(13).blkName='AutonomousVehicleSimulator/MATLAB Function3/p4';
bio(13).sigName='v_g';
bio(13).portIdx=3;
bio(13).dim=[1,1];
bio(13).sigWidth=1;
bio(13).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.v_g';
bio(13).ndims=2;
bio(13).size=[];
bio(13).isStruct=false;

bio(14).blkName='AutonomousVehicleSimulator/Memory';
bio(14).sigName='';
bio(14).portIdx=0;
bio(14).dim=[1,1];
bio(14).sigWidth=1;
bio(14).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Memory_h';
bio(14).ndims=2;
bio(14).size=[];
bio(14).isStruct=false;

bio(15).blkName='AutonomousVehicleSimulator/v_r_old1';
bio(15).sigName='';
bio(15).portIdx=0;
bio(15).dim=[1,1];
bio(15).sigWidth=1;
bio(15).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.v_r_old1';
bio(15).ndims=2;
bio(15).size=[];
bio(15).isStruct=false;

bio(16).blkName='AutonomousVehicleSimulator/x_r_old';
bio(16).sigName='';
bio(16).portIdx=0;
bio(16).dim=[1,1];
bio(16).sigWidth=1;
bio(16).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.x_r_old';
bio(16).ndims=2;
bio(16).size=[];
bio(16).isStruct=false;

bio(17).blkName='Controller/MATLAB Function/p1';
bio(17).sigName='';
bio(17).portIdx=0;
bio(17).dim=[1,1];
bio(17).sigWidth=1;
bio(17).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.d_out';
bio(17).ndims=2;
bio(17).size=[];
bio(17).isStruct=false;

bio(18).blkName='Controller/MATLAB Function/p2';
bio(18).sigName='';
bio(18).portIdx=1;
bio(18).dim=[1,1];
bio(18).sigWidth=1;
bio(18).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.v_out';
bio(18).ndims=2;
bio(18).size=[];
bio(18).isStruct=false;

bio(19).blkName='Controller/MATLAB Function2/p1';
bio(19).sigName='';
bio(19).portIdx=0;
bio(19).dim=[1,1];
bio(19).sigWidth=1;
bio(19).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.control_discrete';
bio(19).ndims=2;
bio(19).size=[];
bio(19).isStruct=false;

bio(20).blkName='Controller/MATLAB Function2/p2';
bio(20).sigName='u';
bio(20).portIdx=1;
bio(20).dim=[1,1];
bio(20).sigWidth=1;
bio(20).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.u';
bio(20).ndims=2;
bio(20).size=[];
bio(20).isStruct=false;

bio(21).blkName='Controller/MATLAB Function4/p1';
bio(21).sigName='';
bio(21).portIdx=0;
bio(21).dim=[1,1];
bio(21).sigWidth=1;
bio(21).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.x_h';
bio(21).ndims=2;
bio(21).size=[];
bio(21).isStruct=false;

bio(22).blkName='Controller/MATLAB Function4/p2';
bio(22).sigName='';
bio(22).portIdx=1;
bio(22).dim=[1,1];
bio(22).sigWidth=1;
bio(22).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.v_h';
bio(22).ndims=2;
bio(22).size=[];
bio(22).isStruct=false;

bio(23).blkName='Controller/MATLAB Function5';
bio(23).sigName='';
bio(23).portIdx=0;
bio(23).dim=[1,1];
bio(23).sigWidth=1;
bio(23).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.q';
bio(23).ndims=2;
bio(23).size=[];
bio(23).isStruct=false;

bio(24).blkName='Controller/From File';
bio(24).sigName='';
bio(24).portIdx=0;
bio(24).dim=[1,1];
bio(24).sigWidth=1;
bio(24).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.FromFile';
bio(24).ndims=2;
bio(24).size=[];
bio(24).isStruct=false;

bio(25).blkName='Controller/From File1';
bio(25).sigName='';
bio(25).portIdx=0;
bio(25).dim=[1022,1];
bio(25).sigWidth=1022;
bio(25).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.FromFile1[0]';
bio(25).ndims=2;
bio(25).size=[];
bio(25).isStruct=false;

bio(26).blkName='Controller/From File2';
bio(26).sigName='';
bio(26).portIdx=0;
bio(26).dim=[4088,1];
bio(26).sigWidth=4088;
bio(26).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.FromFile2[0]';
bio(26).ndims=2;
bio(26).size=[];
bio(26).isStruct=false;

bio(27).blkName='Controller/From File3';
bio(27).sigName='';
bio(27).portIdx=0;
bio(27).dim=[257544,1];
bio(27).sigWidth=257544;
bio(27).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.FromFile3[0]';
bio(27).ndims=2;
bio(27).size=[];
bio(27).isStruct=false;

bio(28).blkName='Controller/Gain';
bio(28).sigName='x_r';
bio(28).portIdx=0;
bio(28).dim=[1,1];
bio(28).sigWidth=1;
bio(28).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.x_r';
bio(28).ndims=2;
bio(28).size=[];
bio(28).isStruct=false;

bio(29).blkName='Controller/Gain1';
bio(29).sigName='y_r';
bio(29).portIdx=0;
bio(29).dim=[1,1];
bio(29).sigWidth=1;
bio(29).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.y_r';
bio(29).ndims=2;
bio(29).size=[];
bio(29).isStruct=false;

bio(30).blkName='Controller/Gain2';
bio(30).sigName='theta_r';
bio(30).portIdx=0;
bio(30).dim=[1,1];
bio(30).sigWidth=1;
bio(30).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.theta_r';
bio(30).ndims=2;
bio(30).size=[];
bio(30).isStruct=false;

bio(31).blkName='Controller/Gain3';
bio(31).sigName='v_r';
bio(31).portIdx=0;
bio(31).dim=[1,1];
bio(31).sigWidth=1;
bio(31).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.v_r';
bio(31).ndims=2;
bio(31).size=[];
bio(31).isStruct=false;

bio(32).blkName='Controller/belief';
bio(32).sigName='';
bio(32).portIdx=0;
bio(32).dim=[12,1];
bio(32).sigWidth=12;
bio(32).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.belief[0]';
bio(32).ndims=2;
bio(32).size=[];
bio(32).isStruct=false;

bio(33).blkName='Controller/d_h_mem';
bio(33).sigName='';
bio(33).portIdx=0;
bio(33).dim=[1,1];
bio(33).sigWidth=1;
bio(33).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.d_h_mem';
bio(33).ndims=2;
bio(33).size=[];
bio(33).isStruct=false;

bio(34).blkName='Controller/d_r_mem';
bio(34).sigName='';
bio(34).portIdx=0;
bio(34).dim=[1,1];
bio(34).sigWidth=1;
bio(34).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.d_r_mem';
bio(34).ndims=2;
bio(34).size=[];
bio(34).isStruct=false;

bio(35).blkName='Controller/sigma';
bio(35).sigName='';
bio(35).portIdx=0;
bio(35).dim=[1,1];
bio(35).sigWidth=1;
bio(35).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.sigma';
bio(35).ndims=2;
bio(35).size=[];
bio(35).isStruct=false;

bio(36).blkName='Controller/u_mem';
bio(36).sigName='';
bio(36).portIdx=0;
bio(36).dim=[1,1];
bio(36).sigWidth=1;
bio(36).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.u_mem';
bio(36).ndims=2;
bio(36).size=[];
bio(36).isStruct=false;

bio(37).blkName='Controller/v_h_mem';
bio(37).sigName='';
bio(37).portIdx=0;
bio(37).dim=[1,1];
bio(37).sigWidth=1;
bio(37).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.v_h_mem';
bio(37).ndims=2;
bio(37).size=[];
bio(37).isStruct=false;

bio(38).blkName='Controller/v_r_mem';
bio(38).sigName='';
bio(38).portIdx=0;
bio(38).dim=[1,1];
bio(38).sigWidth=1;
bio(38).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.v_r_mem';
bio(38).ndims=2;
bio(38).size=[];
bio(38).isStruct=false;

bio(39).blkName='Controller/Divide';
bio(39).sigName='';
bio(39).portIdx=0;
bio(39).dim=[1,1];
bio(39).sigWidth=1;
bio(39).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Divide_p';
bio(39).ndims=2;
bio(39).size=[];
bio(39).isStruct=false;

bio(40).blkName='Controller/Discrete FIR Filter';
bio(40).sigName='';
bio(40).portIdx=0;
bio(40).dim=[1,1];
bio(40).sigWidth=1;
bio(40).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.DiscreteFIRFilter';
bio(40).ndims=2;
bio(40).size=[];
bio(40).isStruct=false;

bio(41).blkName='DriverOverride/Driver Override Logic';
bio(41).sigName='';
bio(41).portIdx=0;
bio(41).dim=[1,1];
bio(41).sigWidth=1;
bio(41).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.y_f';
bio(41).ndims=2;
bio(41).size=[];
bio(41).isStruct=false;

bio(42).blkName='DriverOverride/Rate Transition1';
bio(42).sigName='';
bio(42).portIdx=0;
bio(42).dim=[1,1];
bio(42).sigWidth=1;
bio(42).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RateTransition1';
bio(42).ndims=2;
bio(42).size=[];
bio(42).isStruct=false;

bio(43).blkName='DriverOverride/Rate Transition2';
bio(43).sigName='';
bio(43).portIdx=0;
bio(43).dim=[1,1];
bio(43).sigWidth=1;
bio(43).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RateTransition2_i';
bio(43).ndims=2;
bio(43).size=[];
bio(43).isStruct=false;

bio(44).blkName='DriverOverride/Rate Transition4';
bio(44).sigName='';
bio(44).portIdx=0;
bio(44).dim=[1,1];
bio(44).sigWidth=1;
bio(44).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RateTransition4_k';
bio(44).ndims=2;
bio(44).size=[];
bio(44).isStruct=false;

bio(45).blkName='DriverOverride/Rate Transition5';
bio(45).sigName='';
bio(45).portIdx=0;
bio(45).dim=[1,1];
bio(45).sigWidth=1;
bio(45).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RateTransition5_d';
bio(45).ndims=2;
bio(45).size=[];
bio(45).isStruct=false;

bio(46).blkName='DriverOverride/Rate Transition6';
bio(46).sigName='';
bio(46).portIdx=0;
bio(46).dim=[1,1];
bio(46).sigWidth=1;
bio(46).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RateTransition6';
bio(46).ndims=2;
bio(46).size=[];
bio(46).isStruct=false;

bio(47).blkName='DriverOverride/Rate Transition7';
bio(47).sigName='';
bio(47).portIdx=0;
bio(47).dim=[1,1];
bio(47).sigWidth=1;
bio(47).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RateTransition7';
bio(47).ndims=2;
bio(47).size=[];
bio(47).isStruct=false;

bio(48).blkName='DriverOverride/Saturation';
bio(48).sigName='DriverOverrideFlag';
bio(48).portIdx=0;
bio(48).dim=[1,1];
bio(48).sigWidth=1;
bio(48).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.DriverOverrideFlag';
bio(48).ndims=2;
bio(48).size=[];
bio(48).isStruct=false;

bio(49).blkName='DriverOverride/Sum1';
bio(49).sigName='';
bio(49).portIdx=0;
bio(49).dim=[1,1];
bio(49).sigWidth=1;
bio(49).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Sum1';
bio(49).ndims=2;
bio(49).size=[];
bio(49).isStruct=false;

bio(50).blkName='DriverOverride/Switch';
bio(50).sigName='';
bio(50).portIdx=0;
bio(50).dim=[1,1];
bio(50).sigWidth=1;
bio(50).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Switch';
bio(50).ndims=2;
bio(50).size=[];
bio(50).isStruct=false;

bio(51).blkName='DriverOverride/Unit Delay2';
bio(51).sigName='';
bio(51).portIdx=0;
bio(51).dim=[1,1];
bio(51).sigWidth=1;
bio(51).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.UnitDelay2';
bio(51).ndims=2;
bio(51).size=[];
bio(51).isStruct=false;

bio(52).blkName='InputProcessing/Read_CAN/p1';
bio(52).sigName='';
bio(52).portIdx=0;
bio(52).dim=[50,1];
bio(52).sigWidth=50;
bio(52).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Read_CAN_o1[0]';
bio(52).ndims=2;
bio(52).size=[];
bio(52).isStruct=false;

bio(53).blkName='InputProcessing/Read_CAN/p2';
bio(53).sigName='';
bio(53).portIdx=1;
bio(53).dim=[1,1];
bio(53).sigWidth=1;
bio(53).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Read_CAN_o2';
bio(53).ndims=2;
bio(53).size=[];
bio(53).isStruct=false;

bio(54).blkName='InputProcessing/Read_CAN_2/p1';
bio(54).sigName='';
bio(54).portIdx=0;
bio(54).dim=[50,1];
bio(54).sigWidth=50;
bio(54).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Read_CAN_2_o1[0]';
bio(54).ndims=2;
bio(54).size=[];
bio(54).isStruct=false;

bio(55).blkName='InputProcessing/Read_CAN_2/p2';
bio(55).sigName='';
bio(55).portIdx=1;
bio(55).dim=[1,1];
bio(55).sigWidth=1;
bio(55).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Read_CAN_2_o2';
bio(55).ndims=2;
bio(55).size=[];
bio(55).isStruct=false;

bio(56).blkName='InputProcessing/Read_CAN_3/p1';
bio(56).sigName='';
bio(56).portIdx=0;
bio(56).dim=[50,1];
bio(56).sigWidth=50;
bio(56).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Read_CAN_3_o1[0]';
bio(56).ndims=2;
bio(56).size=[];
bio(56).isStruct=false;

bio(57).blkName='InputProcessing/Read_CAN_3/p2';
bio(57).sigName='';
bio(57).portIdx=1;
bio(57).dim=[1,1];
bio(57).sigWidth=1;
bio(57).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Read_CAN_3_o2';
bio(57).ndims=2;
bio(57).size=[];
bio(57).isStruct=false;

bio(58).blkName='OutputProcessing/TM_StateMachine';
bio(58).sigName='';
bio(58).portIdx=0;
bio(58).dim=[1,1];
bio(58).sigWidth=1;
bio(58).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.T_Spas_Stat';
bio(58).ndims=2;
bio(58).size=[];
bio(58).isStruct=false;

bio(59).blkName='OutputProcessing/100ms';
bio(59).sigName='';
bio(59).portIdx=0;
bio(59).dim=[1,1];
bio(59).sigWidth=1;
bio(59).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.u00ms';
bio(59).ndims=2;
bio(59).size=[];
bio(59).isStruct=false;

bio(60).blkName='OutputProcessing/Rate Transition1';
bio(60).sigName='';
bio(60).portIdx=0;
bio(60).dim=[1,1];
bio(60).sigWidth=1;
bio(60).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RateTransition1_h';
bio(60).ndims=2;
bio(60).size=[];
bio(60).isStruct=false;

bio(61).blkName='OutputProcessing/Rate Transition11';
bio(61).sigName='';
bio(61).portIdx=0;
bio(61).dim=[1,1];
bio(61).sigWidth=1;
bio(61).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RateTransition11_h';
bio(61).ndims=2;
bio(61).size=[];
bio(61).isStruct=false;

bio(62).blkName='OutputProcessing/Rate Transition2';
bio(62).sigName='';
bio(62).portIdx=0;
bio(62).dim=[1,1];
bio(62).sigWidth=1;
bio(62).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RateTransition2';
bio(62).ndims=2;
bio(62).size=[];
bio(62).isStruct=false;

bio(63).blkName='OutputProcessing/Rate Transition3';
bio(63).sigName='';
bio(63).portIdx=0;
bio(63).dim=[1,1];
bio(63).sigWidth=1;
bio(63).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RateTransition3';
bio(63).ndims=2;
bio(63).size=[];
bio(63).isStruct=false;

bio(64).blkName='OutputProcessing/Rate Transition4';
bio(64).sigName='';
bio(64).portIdx=0;
bio(64).dim=[1,1];
bio(64).sigWidth=1;
bio(64).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RateTransition4';
bio(64).ndims=2;
bio(64).size=[];
bio(64).isStruct=false;

bio(65).blkName='OutputProcessing/Rate Transition5';
bio(65).sigName='';
bio(65).portIdx=0;
bio(65).dim=[1,1];
bio(65).sigWidth=1;
bio(65).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RateTransition5';
bio(65).ndims=2;
bio(65).size=[];
bio(65).isStruct=false;

bio(66).blkName='OutputProcessing/Switch';
bio(66).sigName='';
bio(66).portIdx=0;
bio(66).dim=[1,1];
bio(66).sigWidth=1;
bio(66).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Switch_n';
bio(66).ndims=2;
bio(66).size=[];
bio(66).isStruct=false;

bio(67).blkName='OutputProcessing/Width';
bio(67).sigName='';
bio(67).portIdx=0;
bio(67).dim=[1,1];
bio(67).sigWidth=1;
bio(67).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_ConstB.Width';
bio(67).ndims=2;
bio(67).size=[];
bio(67).isStruct=false;

bio(68).blkName='Controller/CalBelief Subsystem/MATLAB Function1/p1';
bio(68).sigName='';
bio(68).portIdx=0;
bio(68).dim=[12,1];
bio(68).sigWidth=12;
bio(68).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.b_q_next[0]';
bio(68).ndims=2;
bio(68).size=[];
bio(68).isStruct=false;

bio(69).blkName='Controller/CalBelief Subsystem/MATLAB Function1/p2';
bio(69).sigName='';
bio(69).portIdx=1;
bio(69).dim=[4,1];
bio(69).sigWidth=4;
bio(69).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.b_x_next[0]';
bio(69).ndims=2;
bio(69).size=[];
bio(69).isStruct=false;

bio(70).blkName='InputProcessing/For Iterator Subsystem/For Iterator';
bio(70).sigName='';
bio(70).portIdx=0;
bio(70).dim=[1,1];
bio(70).sigWidth=1;
bio(70).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.ForIterator_l';
bio(70).ndims=2;
bio(70).size=[];
bio(70).isStruct=false;

bio(71).blkName='InputProcessing/For Iterator Subsystem/Index Vector';
bio(71).sigName='';
bio(71).portIdx=0;
bio(71).dim=[1,1];
bio(71).sigWidth=1;
bio(71).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.IndexVector_d';
bio(71).ndims=2;
bio(71).size=[];
bio(71).isStruct=false;

bio(72).blkName='InputProcessing/For Iterator Subsystem1/For Iterator';
bio(72).sigName='';
bio(72).portIdx=0;
bio(72).dim=[1,1];
bio(72).sigWidth=1;
bio(72).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.ForIterator_kk';
bio(72).ndims=2;
bio(72).size=[];
bio(72).isStruct=false;

bio(73).blkName='InputProcessing/For Iterator Subsystem1/Index Vector';
bio(73).sigName='';
bio(73).portIdx=0;
bio(73).dim=[1,1];
bio(73).sigWidth=1;
bio(73).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.IndexVector_k';
bio(73).ndims=2;
bio(73).size=[];
bio(73).isStruct=false;

bio(74).blkName='InputProcessing/For Iterator Subsystem2/For Iterator';
bio(74).sigName='';
bio(74).portIdx=0;
bio(74).dim=[1,1];
bio(74).sigWidth=1;
bio(74).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.ForIterator_k';
bio(74).ndims=2;
bio(74).size=[];
bio(74).isStruct=false;

bio(75).blkName='InputProcessing/For Iterator Subsystem2/Index Vector';
bio(75).sigName='';
bio(75).portIdx=0;
bio(75).dim=[1,1];
bio(75).sigWidth=1;
bio(75).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.IndexVector_j';
bio(75).ndims=2;
bio(75).size=[];
bio(75).isStruct=false;

bio(76).blkName='OutputProcessing/ACC_Interface/CAN Pack';
bio(76).sigName='';
bio(76).portIdx=0;
bio(76).dim=[1,1];
bio(76).sigWidth=1;
bio(76).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.CANPack';
bio(76).ndims=2;
bio(76).size=[];
bio(76).isStruct=false;

bio(77).blkName='OutputProcessing/ACC_Interface/CAN Pack1';
bio(77).sigName='';
bio(77).portIdx=0;
bio(77).dim=[1,1];
bio(77).sigWidth=1;
bio(77).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.CANPack1';
bio(77).ndims=2;
bio(77).size=[];
bio(77).isStruct=false;

bio(78).blkName='OutputProcessing/ACC_Interface/Switch';
bio(78).sigName='';
bio(78).portIdx=0;
bio(78).dim=[1,1];
bio(78).sigWidth=1;
bio(78).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Switch_d';
bio(78).ndims=2;
bio(78).size=[];
bio(78).isStruct=false;

bio(79).blkName='OutputProcessing/SPAS5/Rate Transition1';
bio(79).sigName='';
bio(79).portIdx=0;
bio(79).dim=[1,1];
bio(79).sigWidth=1;
bio(79).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RateTransition1_a';
bio(79).ndims=2;
bio(79).size=[];
bio(79).isStruct=false;

bio(80).blkName='OutputProcessing/SPAS5/Rate Transition2';
bio(80).sigName='';
bio(80).portIdx=0;
bio(80).dim=[1,1];
bio(80).sigWidth=1;
bio(80).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RateTransition2_a';
bio(80).ndims=2;
bio(80).size=[];
bio(80).isStruct=false;

bio(81).blkName='OutputProcessing/SPAS5/Rate Transition3';
bio(81).sigName='';
bio(81).portIdx=0;
bio(81).dim=[1,1];
bio(81).sigWidth=1;
bio(81).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RateTransition3_b';
bio(81).ndims=2;
bio(81).size=[];
bio(81).isStruct=false;

bio(82).blkName='OutputProcessing/SPAS5/Rate Transition4';
bio(82).sigName='';
bio(82).portIdx=0;
bio(82).dim=[1,1];
bio(82).sigWidth=1;
bio(82).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RateTransition4_m';
bio(82).ndims=2;
bio(82).size=[];
bio(82).isStruct=false;

bio(83).blkName='OutputProcessing/SPAS5/CAN Pack';
bio(83).sigName='';
bio(83).portIdx=0;
bio(83).dim=[1,1];
bio(83).sigWidth=1;
bio(83).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.CANPack_m';
bio(83).ndims=2;
bio(83).size=[];
bio(83).isStruct=false;

bio(84).blkName='OutputProcessing/Subsystem/For Iterator';
bio(84).sigName='';
bio(84).portIdx=0;
bio(84).dim=[1,1];
bio(84).sigWidth=1;
bio(84).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.ForIterator';
bio(84).ndims=2;
bio(84).size=[];
bio(84).isStruct=false;

bio(85).blkName='OutputProcessing/Subsystem/Index Vector';
bio(85).sigName='';
bio(85).portIdx=0;
bio(85).dim=[1,1];
bio(85).sigWidth=1;
bio(85).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.IndexVector';
bio(85).ndims=2;
bio(85).size=[];
bio(85).isStruct=false;

bio(86).blkName='OutputProcessing/Subsystem/L_EMS1/p1';
bio(86).sigName='';
bio(86).portIdx=0;
bio(86).dim=[1,1];
bio(86).sigWidth=1;
bio(86).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_EMS1_o1';
bio(86).ndims=2;
bio(86).size=[];
bio(86).isStruct=false;

bio(87).blkName='OutputProcessing/Subsystem/L_EMS1/p2';
bio(87).sigName='';
bio(87).portIdx=1;
bio(87).dim=[1,1];
bio(87).sigWidth=1;
bio(87).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_EMS1_o2';
bio(87).ndims=2;
bio(87).size=[];
bio(87).isStruct=false;

bio(88).blkName='OutputProcessing/Subsystem/L_EMS1/p3';
bio(88).sigName='TM_Stat';
bio(88).portIdx=2;
bio(88).dim=[1,1];
bio(88).sigWidth=1;
bio(88).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.TM_Stat';
bio(88).ndims=2;
bio(88).size=[];
bio(88).isStruct=false;

bio(89).blkName='OutputProcessing/Subsystem/L_EMS1/p4';
bio(89).sigName='';
bio(89).portIdx=3;
bio(89).dim=[1,1];
bio(89).sigWidth=1;
bio(89).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_EMS1_o4_h';
bio(89).ndims=2;
bio(89).size=[];
bio(89).isStruct=false;

bio(90).blkName='OutputProcessing/Subsystem/L_EMS1/p5';
bio(90).sigName='';
bio(90).portIdx=4;
bio(90).dim=[1,1];
bio(90).sigWidth=1;
bio(90).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_EMS1_o5_l';
bio(90).ndims=2;
bio(90).size=[];
bio(90).isStruct=false;

bio(91).blkName='OutputProcessing/TM_AliveCnt/Add';
bio(91).sigName='';
bio(91).portIdx=0;
bio(91).dim=[1,1];
bio(91).sigWidth=1;
bio(91).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Add_d';
bio(91).ndims=2;
bio(91).size=[];
bio(91).isStruct=false;

bio(92).blkName='OutputProcessing/TM_AliveCnt/Switch1';
bio(92).sigName='';
bio(92).portIdx=0;
bio(92).dim=[1,1];
bio(92).sigWidth=1;
bio(92).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Switch1_a';
bio(92).ndims=2;
bio(92).size=[];
bio(92).isStruct=false;

bio(93).blkName='OutputProcessing/TM_AliveCnt/Unit Delay';
bio(93).sigName='';
bio(93).portIdx=0;
bio(93).dim=[1,1];
bio(93).sigWidth=1;
bio(93).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.UnitDelay_h';
bio(93).ndims=2;
bio(93).size=[];
bio(93).isStruct=false;

bio(94).blkName='OutputProcessing/VehicleCanProcessing/ ';
bio(94).sigName='in_enable';
bio(94).portIdx=0;
bio(94).dim=[1,1];
bio(94).sigWidth=1;
bio(94).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.in_enable';
bio(94).ndims=2;
bio(94).size=[];
bio(94).isStruct=false;

bio(95).blkName='OutputProcessing/VehicleCanProcessing/ 1';
bio(95).sigName='Req_Steering_Angle_deg';
bio(95).portIdx=0;
bio(95).dim=[1,1];
bio(95).sigWidth=1;
bio(95).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Req_Steering_Angle_deg';
bio(95).ndims=2;
bio(95).size=[];
bio(95).isStruct=false;

bio(96).blkName='OutputProcessing/VehicleCanProcessing/GearRatio';
bio(96).sigName='';
bio(96).portIdx=0;
bio(96).dim=[1,1];
bio(96).sigWidth=1;
bio(96).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.GearRatio';
bio(96).ndims=2;
bio(96).size=[];
bio(96).isStruct=false;

bio(97).blkName='OutputProcessing/VehicleCanProcessing/rad2deg';
bio(97).sigName='';
bio(97).portIdx=0;
bio(97).dim=[1,1];
bio(97).sigWidth=1;
bio(97).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.rad2deg';
bio(97).ndims=2;
bio(97).size=[];
bio(97).isStruct=false;

bio(98).blkName='OutputProcessing/VehicleCanProcessing/Rate Transition1';
bio(98).sigName='';
bio(98).portIdx=0;
bio(98).dim=[1,1];
bio(98).sigWidth=1;
bio(98).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RateTransition1_e';
bio(98).ndims=2;
bio(98).size=[];
bio(98).isStruct=false;

bio(99).blkName='OutputProcessing/VehicleCanProcessing/Saturation';
bio(99).sigName='commanded_steering';
bio(99).portIdx=0;
bio(99).dim=[1,1];
bio(99).sigWidth=1;
bio(99).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.commanded_steering';
bio(99).ndims=2;
bio(99).size=[];
bio(99).isStruct=false;

bio(100).blkName='OutputProcessing/VehicleCanProcessing/Add';
bio(100).sigName='';
bio(100).portIdx=0;
bio(100).dim=[1,1];
bio(100).sigWidth=1;
bio(100).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Add_g';
bio(100).ndims=2;
bio(100).size=[];
bio(100).isStruct=false;

bio(101).blkName='OutputProcessing/VehicleCanProcessing/Sum';
bio(101).sigName='';
bio(101).portIdx=0;
bio(101).dim=[1,1];
bio(101).sigWidth=1;
bio(101).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Sum';
bio(101).ndims=2;
bio(101).size=[];
bio(101).isStruct=false;

bio(102).blkName='OutputProcessing/VehicleCanProcessing/Switch';
bio(102).sigName='';
bio(102).portIdx=0;
bio(102).dim=[1,1];
bio(102).sigWidth=1;
bio(102).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Switch_p';
bio(102).ndims=2;
bio(102).size=[];
bio(102).isStruct=false;

bio(103).blkName='OutputProcessing/VehicleCanProcessing/Switch1';
bio(103).sigName='';
bio(103).portIdx=0;
bio(103).dim=[1,1];
bio(103).sigWidth=1;
bio(103).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Switch1_b';
bio(103).ndims=2;
bio(103).size=[];
bio(103).isStruct=false;

bio(104).blkName='SensorFusion/Map-based Localization/INS Reference Change/p1';
bio(104).sigName='';
bio(104).portIdx=0;
bio(104).dim=[2,1];
bio(104).sigWidth=2;
bio(104).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.GPS_Local_Pos[0]';
bio(104).ndims=2;
bio(104).size=[];
bio(104).isStruct=false;

bio(105).blkName='SensorFusion/Map-based Localization/INS Reference Change/p2';
bio(105).sigName='';
bio(105).portIdx=1;
bio(105).dim=[1,1];
bio(105).sigWidth=1;
bio(105).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.INS_Heading';
bio(105).ndims=2;
bio(105).size=[];
bio(105).isStruct=false;

bio(106).blkName='SensorFusion/Map-based Localization/gain1';
bio(106).sigName='MapOffsetX';
bio(106).portIdx=0;
bio(106).dim=[1,1];
bio(106).sigWidth=1;
bio(106).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.MapOffsetX';
bio(106).ndims=2;
bio(106).size=[];
bio(106).isStruct=false;

bio(107).blkName='SensorFusion/Map-based Localization/gain2';
bio(107).sigName='MapOffsetY';
bio(107).portIdx=0;
bio(107).dim=[1,1];
bio(107).sigWidth=1;
bio(107).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.MapOffsetY';
bio(107).ndims=2;
bio(107).size=[];
bio(107).isStruct=false;

bio(108).blkName='SensorFusion/Map-based Localization/Add';
bio(108).sigName='';
bio(108).portIdx=0;
bio(108).dim=[2,1];
bio(108).sigWidth=2;
bio(108).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Add[0]';
bio(108).ndims=2;
bio(108).size=[];
bio(108).isStruct=false;

bio(109).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/L_EMS1/p1';
bio(109).sigName='ACK_TCS';
bio(109).portIdx=0;
bio(109).dim=[1,1];
bio(109).sigWidth=1;
bio(109).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.ACK_TCS';
bio(109).ndims=2;
bio(109).size=[];
bio(109).isStruct=false;

bio(110).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/L_EMS1/p2';
bio(110).sigName='';
bio(110).portIdx=1;
bio(110).dim=[1,1];
bio(110).sigWidth=1;
bio(110).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_EMS1_o2_c';
bio(110).ndims=2;
bio(110).size=[];
bio(110).isStruct=false;

bio(111).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/L_EMS1/p3';
bio(111).sigName='';
bio(111).portIdx=2;
bio(111).dim=[1,1];
bio(111).sigWidth=1;
bio(111).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_EMS1_o3';
bio(111).ndims=2;
bio(111).size=[];
bio(111).isStruct=false;

bio(112).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/L_EMS1/p4';
bio(112).sigName='';
bio(112).portIdx=3;
bio(112).dim=[1,1];
bio(112).sigWidth=1;
bio(112).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_EMS1_o4';
bio(112).ndims=2;
bio(112).size=[];
bio(112).isStruct=false;

bio(113).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/L_EMS1/p5';
bio(113).sigName='';
bio(113).portIdx=4;
bio(113).dim=[1,1];
bio(113).sigWidth=1;
bio(113).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_EMS1_o5';
bio(113).ndims=2;
bio(113).size=[];
bio(113).isStruct=false;

bio(114).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/L_EMS1/p6';
bio(114).sigName='';
bio(114).portIdx=5;
bio(114).dim=[1,1];
bio(114).sigWidth=1;
bio(114).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_EMS1_o6';
bio(114).ndims=2;
bio(114).size=[];
bio(114).isStruct=false;

bio(115).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/L_EMS1/p7';
bio(115).sigName='';
bio(115).portIdx=6;
bio(115).dim=[1,1];
bio(115).sigWidth=1;
bio(115).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_EMS1_o7';
bio(115).ndims=2;
bio(115).size=[];
bio(115).isStruct=false;

bio(116).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/L_EMS1/p8';
bio(116).sigName='';
bio(116).portIdx=7;
bio(116).dim=[1,1];
bio(116).sigWidth=1;
bio(116).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_EMS1_o8';
bio(116).ndims=2;
bio(116).size=[];
bio(116).isStruct=false;

bio(117).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/L_EMS1/p9';
bio(117).sigName='TQFR';
bio(117).portIdx=8;
bio(117).dim=[1,1];
bio(117).sigWidth=1;
bio(117).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.TQFR';
bio(117).ndims=2;
bio(117).size=[];
bio(117).isStruct=false;

bio(118).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/L_EMS1/p10';
bio(118).sigName='TQI';
bio(118).portIdx=9;
bio(118).dim=[1,1];
bio(118).sigWidth=1;
bio(118).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.TQI';
bio(118).ndims=2;
bio(118).size=[];
bio(118).isStruct=false;

bio(119).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/L_EMS1/p11';
bio(119).sigName='';
bio(119).portIdx=10;
bio(119).dim=[1,1];
bio(119).sigWidth=1;
bio(119).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_EMS1_o11';
bio(119).ndims=2;
bio(119).size=[];
bio(119).isStruct=false;

bio(120).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/L_EMS1/p12';
bio(120).sigName='';
bio(120).portIdx=11;
bio(120).dim=[1,1];
bio(120).sigWidth=1;
bio(120).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_EMS1_o12';
bio(120).ndims=2;
bio(120).size=[];
bio(120).isStruct=false;

bio(121).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/L_EMS1/p13';
bio(121).sigName='VS';
bio(121).portIdx=12;
bio(121).dim=[1,1];
bio(121).sigWidth=1;
bio(121).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.VS';
bio(121).ndims=2;
bio(121).size=[];
bio(121).isStruct=false;

bio(122).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/L_EMS1/p14';
bio(122).sigName='';
bio(122).portIdx=13;
bio(122).dim=[1,1];
bio(122).sigWidth=1;
bio(122).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_EMS1_o14';
bio(122).ndims=2;
bio(122).size=[];
bio(122).isStruct=false;

bio(123).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/L_EMS1/p15';
bio(123).sigName='';
bio(123).portIdx=14;
bio(123).dim=[1,1];
bio(123).sigWidth=1;
bio(123).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_EMS1_o15';
bio(123).ndims=2;
bio(123).size=[];
bio(123).isStruct=false;

bio(124).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/L_EMS2/p1';
bio(124).sigName='';
bio(124).portIdx=0;
bio(124).dim=[1,1];
bio(124).sigWidth=1;
bio(124).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_EMS2_o1';
bio(124).ndims=2;
bio(124).size=[];
bio(124).isStruct=false;

bio(125).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/L_EMS2/p2';
bio(125).sigName='';
bio(125).portIdx=1;
bio(125).dim=[1,1];
bio(125).sigWidth=1;
bio(125).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_EMS2_o2';
bio(125).ndims=2;
bio(125).size=[];
bio(125).isStruct=false;

bio(126).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/L_EMS2/p3';
bio(126).sigName='BRAKE_ACT';
bio(126).portIdx=2;
bio(126).dim=[1,1];
bio(126).sigWidth=1;
bio(126).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.BRAKE_ACT';
bio(126).ndims=2;
bio(126).size=[];
bio(126).isStruct=false;

bio(127).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/L_EMS2/p4';
bio(127).sigName='';
bio(127).portIdx=3;
bio(127).dim=[1,1];
bio(127).sigWidth=1;
bio(127).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_EMS2_o4';
bio(127).ndims=2;
bio(127).size=[];
bio(127).isStruct=false;

bio(128).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/L_EMS2/p5';
bio(128).sigName='';
bio(128).portIdx=4;
bio(128).dim=[1,1];
bio(128).sigWidth=1;
bio(128).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_EMS2_o5';
bio(128).ndims=2;
bio(128).size=[];
bio(128).isStruct=false;

bio(129).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/L_EMS2/p6';
bio(129).sigName='';
bio(129).portIdx=5;
bio(129).dim=[1,1];
bio(129).sigWidth=1;
bio(129).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_EMS2_o6';
bio(129).ndims=2;
bio(129).size=[];
bio(129).isStruct=false;

bio(130).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/L_EMS2/p7';
bio(130).sigName='';
bio(130).portIdx=6;
bio(130).dim=[1,1];
bio(130).sigWidth=1;
bio(130).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_EMS2_o7';
bio(130).ndims=2;
bio(130).size=[];
bio(130).isStruct=false;

bio(131).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/L_EMS2/p8';
bio(131).sigName='';
bio(131).portIdx=7;
bio(131).dim=[1,1];
bio(131).sigWidth=1;
bio(131).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_EMS2_o8';
bio(131).ndims=2;
bio(131).size=[];
bio(131).isStruct=false;

bio(132).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/L_EMS2/p9';
bio(132).sigName='';
bio(132).portIdx=8;
bio(132).dim=[1,1];
bio(132).sigWidth=1;
bio(132).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_EMS2_o9';
bio(132).ndims=2;
bio(132).size=[];
bio(132).isStruct=false;

bio(133).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/L_EMS2/p10';
bio(133).sigName='';
bio(133).portIdx=9;
bio(133).dim=[1,1];
bio(133).sigWidth=1;
bio(133).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_EMS2_o10';
bio(133).ndims=2;
bio(133).size=[];
bio(133).isStruct=false;

bio(134).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/L_EMS2/p11';
bio(134).sigName='';
bio(134).portIdx=10;
bio(134).dim=[1,1];
bio(134).sigWidth=1;
bio(134).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_EMS2_o11';
bio(134).ndims=2;
bio(134).size=[];
bio(134).isStruct=false;

bio(135).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/L_EMS2/p12';
bio(135).sigName='';
bio(135).portIdx=11;
bio(135).dim=[1,1];
bio(135).sigWidth=1;
bio(135).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_EMS2_o12';
bio(135).ndims=2;
bio(135).size=[];
bio(135).isStruct=false;

bio(136).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/L_EMS2/p13';
bio(136).sigName='';
bio(136).portIdx=12;
bio(136).dim=[1,1];
bio(136).sigWidth=1;
bio(136).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_EMS2_o13';
bio(136).ndims=2;
bio(136).size=[];
bio(136).isStruct=false;

bio(137).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/L_EMS2/p14';
bio(137).sigName='';
bio(137).portIdx=13;
bio(137).dim=[1,1];
bio(137).sigWidth=1;
bio(137).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_EMS2_o14';
bio(137).ndims=2;
bio(137).size=[];
bio(137).isStruct=false;

bio(138).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/L_EMS2/p15';
bio(138).sigName='';
bio(138).portIdx=14;
bio(138).dim=[1,1];
bio(138).sigWidth=1;
bio(138).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_EMS2_o15';
bio(138).ndims=2;
bio(138).size=[];
bio(138).isStruct=false;

bio(139).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/L_EMS2/p16';
bio(139).sigName='';
bio(139).portIdx=15;
bio(139).dim=[1,1];
bio(139).sigWidth=1;
bio(139).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_EMS2_o16';
bio(139).ndims=2;
bio(139).size=[];
bio(139).isStruct=false;

bio(140).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/L_EMS2/p17';
bio(140).sigName='';
bio(140).portIdx=16;
bio(140).dim=[1,1];
bio(140).sigWidth=1;
bio(140).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_EMS2_o17';
bio(140).ndims=2;
bio(140).size=[];
bio(140).isStruct=false;

bio(141).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/L_EMS2/p18';
bio(141).sigName='TQ_STND';
bio(141).portIdx=17;
bio(141).dim=[1,1];
bio(141).sigWidth=1;
bio(141).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.TQ_STND';
bio(141).ndims=2;
bio(141).size=[];
bio(141).isStruct=false;

bio(142).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/L_EMS2/p19';
bio(142).sigName='';
bio(142).portIdx=18;
bio(142).dim=[1,1];
bio(142).sigWidth=1;
bio(142).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_EMS2_o19';
bio(142).ndims=2;
bio(142).size=[];
bio(142).isStruct=false;

bio(143).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/L_EMS2/p20';
bio(143).sigName='';
bio(143).portIdx=19;
bio(143).dim=[1,1];
bio(143).sigWidth=1;
bio(143).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_EMS2_o20';
bio(143).ndims=2;
bio(143).size=[];
bio(143).isStruct=false;

bio(144).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/L_EMS2/p21';
bio(144).sigName='';
bio(144).portIdx=20;
bio(144).dim=[1,1];
bio(144).sigWidth=1;
bio(144).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_EMS2_o21';
bio(144).ndims=2;
bio(144).size=[];
bio(144).isStruct=false;

bio(145).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/L_SAS1/p1';
bio(145).sigName='CheckSum';
bio(145).portIdx=0;
bio(145).dim=[1,1];
bio(145).sigWidth=1;
bio(145).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.CheckSum';
bio(145).ndims=2;
bio(145).size=[];
bio(145).isStruct=false;

bio(146).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/L_SAS1/p2';
bio(146).sigName='MsgCount';
bio(146).portIdx=1;
bio(146).dim=[1,1];
bio(146).sigWidth=1;
bio(146).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.MsgCount';
bio(146).ndims=2;
bio(146).size=[];
bio(146).isStruct=false;

bio(147).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/L_SAS1/p3';
bio(147).sigName='SAS_Angle';
bio(147).portIdx=2;
bio(147).dim=[1,1];
bio(147).sigWidth=1;
bio(147).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.SAS_Angle';
bio(147).ndims=2;
bio(147).size=[];
bio(147).isStruct=false;

bio(148).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/L_SAS1/p4';
bio(148).sigName='SAS_Speed';
bio(148).portIdx=3;
bio(148).dim=[1,1];
bio(148).sigWidth=1;
bio(148).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.SAS_Speed';
bio(148).ndims=2;
bio(148).size=[];
bio(148).isStruct=false;

bio(149).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/L_SAS1/p5';
bio(149).sigName='';
bio(149).portIdx=4;
bio(149).dim=[1,1];
bio(149).sigWidth=1;
bio(149).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_SAS1_o5';
bio(149).ndims=2;
bio(149).size=[];
bio(149).isStruct=false;

bio(150).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/L_SAS1/p6';
bio(150).sigName='';
bio(150).portIdx=5;
bio(150).dim=[1,1];
bio(150).sigWidth=1;
bio(150).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_SAS1_o6';
bio(150).ndims=2;
bio(150).size=[];
bio(150).isStruct=false;

bio(151).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/L_SAS1/p7';
bio(151).sigName='';
bio(151).portIdx=6;
bio(151).dim=[1,1];
bio(151).sigWidth=1;
bio(151).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_SAS1_o7';
bio(151).ndims=2;
bio(151).size=[];
bio(151).isStruct=false;

bio(152).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/L_SAS1/p8';
bio(152).sigName='';
bio(152).portIdx=7;
bio(152).dim=[1,1];
bio(152).sigWidth=1;
bio(152).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_SAS1_o8';
bio(152).ndims=2;
bio(152).size=[];
bio(152).isStruct=false;

bio(153).blkName='InputProcessing/For Iterator Subsystem/TCU1Processing/L_TCU1/p1';
bio(153).sigName='';
bio(153).portIdx=0;
bio(153).dim=[1,1];
bio(153).sigWidth=1;
bio(153).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_TCU1_o1';
bio(153).ndims=2;
bio(153).size=[];
bio(153).isStruct=false;

bio(154).blkName='InputProcessing/For Iterator Subsystem/TCU1Processing/L_TCU1/p2';
bio(154).sigName='';
bio(154).portIdx=1;
bio(154).dim=[1,1];
bio(154).sigWidth=1;
bio(154).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_TCU1_o2';
bio(154).ndims=2;
bio(154).size=[];
bio(154).isStruct=false;

bio(155).blkName='InputProcessing/For Iterator Subsystem/TCU1Processing/L_TCU1/p3';
bio(155).sigName='';
bio(155).portIdx=2;
bio(155).dim=[1,1];
bio(155).sigWidth=1;
bio(155).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_TCU1_o3';
bio(155).ndims=2;
bio(155).size=[];
bio(155).isStruct=false;

bio(156).blkName='InputProcessing/For Iterator Subsystem/TCU1Processing/L_TCU1/p4';
bio(156).sigName='G_SEL_DISP';
bio(156).portIdx=3;
bio(156).dim=[1,1];
bio(156).sigWidth=1;
bio(156).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.G_SEL_DISP';
bio(156).ndims=2;
bio(156).size=[];
bio(156).isStruct=false;

bio(157).blkName='InputProcessing/For Iterator Subsystem/TCU1Processing/L_TCU1/p5';
bio(157).sigName='';
bio(157).portIdx=4;
bio(157).dim=[1,1];
bio(157).sigWidth=1;
bio(157).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_TCU1_o5';
bio(157).ndims=2;
bio(157).size=[];
bio(157).isStruct=false;

bio(158).blkName='InputProcessing/For Iterator Subsystem/TCU1Processing/L_TCU1/p6';
bio(158).sigName='';
bio(158).portIdx=5;
bio(158).dim=[1,1];
bio(158).sigWidth=1;
bio(158).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_TCU1_o6';
bio(158).ndims=2;
bio(158).size=[];
bio(158).isStruct=false;

bio(159).blkName='InputProcessing/For Iterator Subsystem/TCU1Processing/L_TCU1/p7';
bio(159).sigName='';
bio(159).portIdx=6;
bio(159).dim=[1,1];
bio(159).sigWidth=1;
bio(159).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_TCU1_o7';
bio(159).ndims=2;
bio(159).size=[];
bio(159).isStruct=false;

bio(160).blkName='InputProcessing/For Iterator Subsystem/TCU1Processing/L_TCU1/p8';
bio(160).sigName='';
bio(160).portIdx=7;
bio(160).dim=[1,1];
bio(160).sigWidth=1;
bio(160).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_TCU1_o8';
bio(160).ndims=2;
bio(160).size=[];
bio(160).isStruct=false;

bio(161).blkName='InputProcessing/For Iterator Subsystem/TCU1Processing/L_TCU1/p9';
bio(161).sigName='';
bio(161).portIdx=8;
bio(161).dim=[1,1];
bio(161).sigWidth=1;
bio(161).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_TCU1_o9';
bio(161).ndims=2;
bio(161).size=[];
bio(161).isStruct=false;

bio(162).blkName='InputProcessing/For Iterator Subsystem/TCU1Processing/L_TCU1/p10';
bio(162).sigName='';
bio(162).portIdx=9;
bio(162).dim=[1,1];
bio(162).sigWidth=1;
bio(162).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_TCU1_o10';
bio(162).ndims=2;
bio(162).size=[];
bio(162).isStruct=false;

bio(163).blkName='InputProcessing/For Iterator Subsystem/TCU1Processing/L_TCU1/p11';
bio(163).sigName='';
bio(163).portIdx=10;
bio(163).dim=[1,1];
bio(163).sigWidth=1;
bio(163).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_TCU1_o11';
bio(163).ndims=2;
bio(163).size=[];
bio(163).isStruct=false;

bio(164).blkName='InputProcessing/For Iterator Subsystem/TCU1Processing/L_TCU1/p12';
bio(164).sigName='';
bio(164).portIdx=11;
bio(164).dim=[1,1];
bio(164).sigWidth=1;
bio(164).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_TCU1_o12';
bio(164).ndims=2;
bio(164).size=[];
bio(164).isStruct=false;

bio(165).blkName='InputProcessing/For Iterator Subsystem/TCU1Processing/L_TCU1/p13';
bio(165).sigName='';
bio(165).portIdx=12;
bio(165).dim=[1,1];
bio(165).sigWidth=1;
bio(165).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_TCU1_o13';
bio(165).ndims=2;
bio(165).size=[];
bio(165).isStruct=false;

bio(166).blkName='InputProcessing/For Iterator Subsystem/TCU1Processing/L_TCU1/p14';
bio(166).sigName='';
bio(166).portIdx=13;
bio(166).dim=[1,1];
bio(166).sigWidth=1;
bio(166).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_TCU1_o14';
bio(166).ndims=2;
bio(166).size=[];
bio(166).isStruct=false;

bio(167).blkName='InputProcessing/For Iterator Subsystem/TCU1Processing/L_TCU1/p15';
bio(167).sigName='CAN ID';
bio(167).portIdx=14;
bio(167).dim=[1,1];
bio(167).sigWidth=1;
bio(167).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.CANID';
bio(167).ndims=2;
bio(167).size=[];
bio(167).isStruct=false;

bio(168).blkName='InputProcessing/For Iterator Subsystem/TCU1Processing/L_TCU1/p16';
bio(168).sigName='';
bio(168).portIdx=15;
bio(168).dim=[1,1];
bio(168).sigWidth=1;
bio(168).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_TCU1_o16';
bio(168).ndims=2;
bio(168).size=[];
bio(168).isStruct=false;

bio(169).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/Signal Conversion';
bio(169).sigName='ipWhlSpdFl[kph]';
bio(169).portIdx=0;
bio(169).dim=[1,1];
bio(169).sigWidth=1;
bio(169).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.ipWhlSpdFlkph';
bio(169).ndims=2;
bio(169).size=[];
bio(169).isStruct=false;

bio(170).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/Signal Conversion';
bio(170).sigName='ipWhlSpdFlEr';
bio(170).portIdx=0;
bio(170).dim=[1,1];
bio(170).sigWidth=1;
bio(170).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.ipWhlSpdFlEr';
bio(170).ndims=2;
bio(170).size=[];
bio(170).isStruct=false;

bio(171).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/Signal Conversion';
bio(171).sigName='ipWhlSpdFr[kph]';
bio(171).portIdx=0;
bio(171).dim=[1,1];
bio(171).sigWidth=1;
bio(171).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.ipWhlSpdFrkph';
bio(171).ndims=2;
bio(171).size=[];
bio(171).isStruct=false;

bio(172).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/Signal Conversion';
bio(172).sigName='ipWhlSpdFrEr';
bio(172).portIdx=0;
bio(172).dim=[1,1];
bio(172).sigWidth=1;
bio(172).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.ipWhlSpdFrEr';
bio(172).ndims=2;
bio(172).size=[];
bio(172).isStruct=false;

bio(173).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/Signal Conversion';
bio(173).sigName='ipWhlSpdRl[kph]';
bio(173).portIdx=0;
bio(173).dim=[1,1];
bio(173).sigWidth=1;
bio(173).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.ipWhlSpdRlkph';
bio(173).ndims=2;
bio(173).size=[];
bio(173).isStruct=false;

bio(174).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/Signal Conversion';
bio(174).sigName='ipWhlSpdRlEr';
bio(174).portIdx=0;
bio(174).dim=[1,1];
bio(174).sigWidth=1;
bio(174).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.ipWhlSpdRlEr';
bio(174).ndims=2;
bio(174).size=[];
bio(174).isStruct=false;

bio(175).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/Signal Conversion';
bio(175).sigName='ipWhlSpdRr[kph]';
bio(175).portIdx=0;
bio(175).dim=[1,1];
bio(175).sigWidth=1;
bio(175).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.ipWhlSpdRrkph';
bio(175).ndims=2;
bio(175).size=[];
bio(175).isStruct=false;

bio(176).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/Signal Conversion';
bio(176).sigName='ipWhlSpdRrEr';
bio(176).portIdx=0;
bio(176).dim=[1,1];
bio(176).sigWidth=1;
bio(176).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.ipWhlSpdRrEr';
bio(176).ndims=2;
bio(176).size=[];
bio(176).isStruct=false;

bio(177).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/Signal Conversion';
bio(177).sigName='ipVehSpdWhl[kph]';
bio(177).portIdx=0;
bio(177).dim=[1,1];
bio(177).sigWidth=1;
bio(177).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.ipVehSpdWhlkph_m';
bio(177).ndims=2;
bio(177).size=[];
bio(177).isStruct=false;

bio(178).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/Signal Conversion';
bio(178).sigName='ipVehSpdWhl[m/s]';
bio(178).portIdx=0;
bio(178).dim=[1,1];
bio(178).sigWidth=1;
bio(178).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.ipVehSpdWhlms_o';
bio(178).ndims=2;
bio(178).size=[];
bio(178).isStruct=false;

bio(179).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/L_WHL_SPD/p1';
bio(179).sigName='WHL_SPD_FL';
bio(179).portIdx=0;
bio(179).dim=[1,1];
bio(179).sigWidth=1;
bio(179).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.WHL_SPD_FL';
bio(179).ndims=2;
bio(179).size=[];
bio(179).isStruct=false;

bio(180).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/L_WHL_SPD/p2';
bio(180).sigName='WHL_SPD_FR';
bio(180).portIdx=1;
bio(180).dim=[1,1];
bio(180).sigWidth=1;
bio(180).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.WHL_SPD_FR';
bio(180).ndims=2;
bio(180).size=[];
bio(180).isStruct=false;

bio(181).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/L_WHL_SPD/p3';
bio(181).sigName='WHL_SPD_RL';
bio(181).portIdx=2;
bio(181).dim=[1,1];
bio(181).sigWidth=1;
bio(181).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.WHL_SPD_RL';
bio(181).ndims=2;
bio(181).size=[];
bio(181).isStruct=false;

bio(182).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/L_WHL_SPD/p4';
bio(182).sigName='WHL_SPD_RR';
bio(182).portIdx=3;
bio(182).dim=[1,1];
bio(182).sigWidth=1;
bio(182).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.WHL_SPD_RR';
bio(182).ndims=2;
bio(182).size=[];
bio(182).isStruct=false;

bio(183).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/L_WHL_SPD/p5';
bio(183).sigName='';
bio(183).portIdx=4;
bio(183).dim=[1,1];
bio(183).sigWidth=1;
bio(183).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_WHL_SPD_o5';
bio(183).ndims=2;
bio(183).size=[];
bio(183).isStruct=false;

bio(184).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/L_WHL_SPD/p6';
bio(184).sigName='';
bio(184).portIdx=5;
bio(184).dim=[1,1];
bio(184).sigWidth=1;
bio(184).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_WHL_SPD_o6';
bio(184).ndims=2;
bio(184).size=[];
bio(184).isStruct=false;

bio(185).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/L_WHL_SPD/p7';
bio(185).sigName='';
bio(185).portIdx=6;
bio(185).dim=[1,1];
bio(185).sigWidth=1;
bio(185).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.L_WHL_SPD_o7';
bio(185).ndims=2;
bio(185).size=[];
bio(185).isStruct=false;

bio(186).blkName='InputProcessing/For Iterator Subsystem1/GPS_Signals/AccelLevel/p1';
bio(186).sigName='';
bio(186).portIdx=0;
bio(186).dim=[1,1];
bio(186).sigWidth=1;
bio(186).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.AccelLevel_o1';
bio(186).ndims=2;
bio(186).size=[];
bio(186).isStruct=false;

bio(187).blkName='InputProcessing/For Iterator Subsystem1/GPS_Signals/AccelLevel/p2';
bio(187).sigName='';
bio(187).portIdx=1;
bio(187).dim=[1,1];
bio(187).sigWidth=1;
bio(187).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.AccelLevel_o2';
bio(187).ndims=2;
bio(187).size=[];
bio(187).isStruct=false;

bio(188).blkName='InputProcessing/For Iterator Subsystem1/GPS_Signals/AccelLevel/p3';
bio(188).sigName='';
bio(188).portIdx=2;
bio(188).dim=[1,1];
bio(188).sigWidth=1;
bio(188).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.AccelLevel_o3';
bio(188).ndims=2;
bio(188).size=[];
bio(188).isStruct=false;

bio(189).blkName='InputProcessing/For Iterator Subsystem1/GPS_Signals/AccelLevel/p4';
bio(189).sigName='';
bio(189).portIdx=3;
bio(189).dim=[1,1];
bio(189).sigWidth=1;
bio(189).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.AccelLevel_o4';
bio(189).ndims=2;
bio(189).size=[];
bio(189).isStruct=false;

bio(190).blkName='InputProcessing/For Iterator Subsystem1/GPS_Signals/AccelLevel/p5';
bio(190).sigName='';
bio(190).portIdx=4;
bio(190).dim=[1,1];
bio(190).sigWidth=1;
bio(190).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.AccelLevel_o5';
bio(190).ndims=2;
bio(190).size=[];
bio(190).isStruct=false;

bio(191).blkName='InputProcessing/For Iterator Subsystem1/GPS_Signals/AccelLevel/p6';
bio(191).sigName='';
bio(191).portIdx=5;
bio(191).dim=[1,1];
bio(191).sigWidth=1;
bio(191).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.AccelLevel_o6';
bio(191).ndims=2;
bio(191).size=[];
bio(191).isStruct=false;

bio(192).blkName='InputProcessing/For Iterator Subsystem1/GPS_Signals/AccelVehicle/p1';
bio(192).sigName='';
bio(192).portIdx=0;
bio(192).dim=[1,1];
bio(192).sigWidth=1;
bio(192).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.AccelVehicle_o1';
bio(192).ndims=2;
bio(192).size=[];
bio(192).isStruct=false;

bio(193).blkName='InputProcessing/For Iterator Subsystem1/GPS_Signals/AccelVehicle/p2';
bio(193).sigName='';
bio(193).portIdx=1;
bio(193).dim=[1,1];
bio(193).sigWidth=1;
bio(193).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.AccelVehicle_o2';
bio(193).ndims=2;
bio(193).size=[];
bio(193).isStruct=false;

bio(194).blkName='InputProcessing/For Iterator Subsystem1/GPS_Signals/AccelVehicle/p3';
bio(194).sigName='';
bio(194).portIdx=2;
bio(194).dim=[1,1];
bio(194).sigWidth=1;
bio(194).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.AccelVehicle_o3';
bio(194).ndims=2;
bio(194).size=[];
bio(194).isStruct=false;

bio(195).blkName='InputProcessing/For Iterator Subsystem1/GPS_Signals/AccelVehicle/p4';
bio(195).sigName='';
bio(195).portIdx=3;
bio(195).dim=[1,1];
bio(195).sigWidth=1;
bio(195).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.AccelVehicle_o4';
bio(195).ndims=2;
bio(195).size=[];
bio(195).isStruct=false;

bio(196).blkName='InputProcessing/For Iterator Subsystem1/GPS_Signals/AccelVehicle/p5';
bio(196).sigName='';
bio(196).portIdx=4;
bio(196).dim=[1,1];
bio(196).sigWidth=1;
bio(196).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.AccelVehicle_o5';
bio(196).ndims=2;
bio(196).size=[];
bio(196).isStruct=false;

bio(197).blkName='InputProcessing/For Iterator Subsystem1/GPS_Signals/AngAccelLevel/p1';
bio(197).sigName='';
bio(197).portIdx=0;
bio(197).dim=[1,1];
bio(197).sigWidth=1;
bio(197).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.AngAccelLevel_o1';
bio(197).ndims=2;
bio(197).size=[];
bio(197).isStruct=false;

bio(198).blkName='InputProcessing/For Iterator Subsystem1/GPS_Signals/AngAccelLevel/p2';
bio(198).sigName='';
bio(198).portIdx=1;
bio(198).dim=[1,1];
bio(198).sigWidth=1;
bio(198).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.AngAccelLevel_o2';
bio(198).ndims=2;
bio(198).size=[];
bio(198).isStruct=false;

bio(199).blkName='InputProcessing/For Iterator Subsystem1/GPS_Signals/AngAccelLevel/p3';
bio(199).sigName='';
bio(199).portIdx=2;
bio(199).dim=[1,1];
bio(199).sigWidth=1;
bio(199).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.AngAccelLevel_o3';
bio(199).ndims=2;
bio(199).size=[];
bio(199).isStruct=false;

bio(200).blkName='InputProcessing/For Iterator Subsystem1/GPS_Signals/AngAccelLevel/p4';
bio(200).sigName='';
bio(200).portIdx=3;
bio(200).dim=[1,1];
bio(200).sigWidth=1;
bio(200).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.AngAccelLevel_o4';
bio(200).ndims=2;
bio(200).size=[];
bio(200).isStruct=false;

bio(201).blkName='InputProcessing/For Iterator Subsystem1/GPS_Signals/AngAccelLevel/p5';
bio(201).sigName='';
bio(201).portIdx=4;
bio(201).dim=[1,1];
bio(201).sigWidth=1;
bio(201).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.AngAccelLevel_o5';
bio(201).ndims=2;
bio(201).size=[];
bio(201).isStruct=false;

bio(202).blkName='InputProcessing/For Iterator Subsystem1/GPS_Signals/AngAccelVehicle/p1';
bio(202).sigName='';
bio(202).portIdx=0;
bio(202).dim=[1,1];
bio(202).sigWidth=1;
bio(202).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.AngAccelVehicle_o1';
bio(202).ndims=2;
bio(202).size=[];
bio(202).isStruct=false;

bio(203).blkName='InputProcessing/For Iterator Subsystem1/GPS_Signals/AngAccelVehicle/p2';
bio(203).sigName='';
bio(203).portIdx=1;
bio(203).dim=[1,1];
bio(203).sigWidth=1;
bio(203).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.AngAccelVehicle_o2';
bio(203).ndims=2;
bio(203).size=[];
bio(203).isStruct=false;

bio(204).blkName='InputProcessing/For Iterator Subsystem1/GPS_Signals/AngAccelVehicle/p3';
bio(204).sigName='';
bio(204).portIdx=2;
bio(204).dim=[1,1];
bio(204).sigWidth=1;
bio(204).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.AngAccelVehicle_o3';
bio(204).ndims=2;
bio(204).size=[];
bio(204).isStruct=false;

bio(205).blkName='InputProcessing/For Iterator Subsystem1/GPS_Signals/AngAccelVehicle/p4';
bio(205).sigName='';
bio(205).portIdx=3;
bio(205).dim=[1,1];
bio(205).sigWidth=1;
bio(205).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.AngAccelVehicle_o4';
bio(205).ndims=2;
bio(205).size=[];
bio(205).isStruct=false;

bio(206).blkName='InputProcessing/For Iterator Subsystem1/GPS_Signals/AngAccelVehicle/p5';
bio(206).sigName='';
bio(206).portIdx=4;
bio(206).dim=[1,1];
bio(206).sigWidth=1;
bio(206).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.AngAccelVehicle_o5';
bio(206).ndims=2;
bio(206).size=[];
bio(206).isStruct=false;

bio(207).blkName='InputProcessing/For Iterator Subsystem1/GPS_Signals/HeadingPitchRoll/p1';
bio(207).sigName='AngleHeading';
bio(207).portIdx=0;
bio(207).dim=[1,1];
bio(207).sigWidth=1;
bio(207).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.AngleHeading';
bio(207).ndims=2;
bio(207).size=[];
bio(207).isStruct=false;

bio(208).blkName='InputProcessing/For Iterator Subsystem1/GPS_Signals/HeadingPitchRoll/p2';
bio(208).sigName='';
bio(208).portIdx=1;
bio(208).dim=[1,1];
bio(208).sigWidth=1;
bio(208).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.HeadingPitchRoll_o2';
bio(208).ndims=2;
bio(208).size=[];
bio(208).isStruct=false;

bio(209).blkName='InputProcessing/For Iterator Subsystem1/GPS_Signals/HeadingPitchRoll/p3';
bio(209).sigName='';
bio(209).portIdx=2;
bio(209).dim=[1,1];
bio(209).sigWidth=1;
bio(209).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.HeadingPitchRoll_o3';
bio(209).ndims=2;
bio(209).size=[];
bio(209).isStruct=false;

bio(210).blkName='InputProcessing/For Iterator Subsystem1/GPS_Signals/HeadingPitchRoll/p4';
bio(210).sigName='';
bio(210).portIdx=3;
bio(210).dim=[1,1];
bio(210).sigWidth=1;
bio(210).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.HeadingPitchRoll_o4';
bio(210).ndims=2;
bio(210).size=[];
bio(210).isStruct=false;

bio(211).blkName='InputProcessing/For Iterator Subsystem1/GPS_Signals/HeadingPitchRoll/p5';
bio(211).sigName='';
bio(211).portIdx=4;
bio(211).dim=[1,1];
bio(211).sigWidth=1;
bio(211).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.HeadingPitchRoll_o5';
bio(211).ndims=2;
bio(211).size=[];
bio(211).isStruct=false;

bio(212).blkName='InputProcessing/For Iterator Subsystem1/GPS_Signals/LatitudeLongitude/p1';
bio(212).sigName='PosLat';
bio(212).portIdx=0;
bio(212).dim=[1,1];
bio(212).sigWidth=1;
bio(212).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.PosLat';
bio(212).ndims=2;
bio(212).size=[];
bio(212).isStruct=false;

bio(213).blkName='InputProcessing/For Iterator Subsystem1/GPS_Signals/LatitudeLongitude/p2';
bio(213).sigName='PosLong';
bio(213).portIdx=1;
bio(213).dim=[1,1];
bio(213).sigWidth=1;
bio(213).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.PosLong';
bio(213).ndims=2;
bio(213).size=[];
bio(213).isStruct=false;

bio(214).blkName='InputProcessing/For Iterator Subsystem1/GPS_Signals/LatitudeLongitude/p3';
bio(214).sigName='';
bio(214).portIdx=2;
bio(214).dim=[1,1];
bio(214).sigWidth=1;
bio(214).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.LatitudeLongitude_o3';
bio(214).ndims=2;
bio(214).size=[];
bio(214).isStruct=false;

bio(215).blkName='InputProcessing/For Iterator Subsystem1/GPS_Signals/LatitudeLongitude/p4';
bio(215).sigName='';
bio(215).portIdx=3;
bio(215).dim=[1,1];
bio(215).sigWidth=1;
bio(215).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.LatitudeLongitude_o4';
bio(215).ndims=2;
bio(215).size=[];
bio(215).isStruct=false;

bio(216).blkName='InputProcessing/For Iterator Subsystem1/GPS_Signals/PosLocal/p1';
bio(216).sigName='';
bio(216).portIdx=0;
bio(216).dim=[1,1];
bio(216).sigWidth=1;
bio(216).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.PosLocal_o1';
bio(216).ndims=2;
bio(216).size=[];
bio(216).isStruct=false;

bio(217).blkName='InputProcessing/For Iterator Subsystem1/GPS_Signals/PosLocal/p2';
bio(217).sigName='';
bio(217).portIdx=1;
bio(217).dim=[1,1];
bio(217).sigWidth=1;
bio(217).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.PosLocal_o2';
bio(217).ndims=2;
bio(217).size=[];
bio(217).isStruct=false;

bio(218).blkName='InputProcessing/For Iterator Subsystem1/GPS_Signals/PosLocal/p3';
bio(218).sigName='';
bio(218).portIdx=2;
bio(218).dim=[1,1];
bio(218).sigWidth=1;
bio(218).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.PosLocal_o3';
bio(218).ndims=2;
bio(218).size=[];
bio(218).isStruct=false;

bio(219).blkName='InputProcessing/For Iterator Subsystem1/GPS_Signals/PosLocal/p4';
bio(219).sigName='';
bio(219).portIdx=3;
bio(219).dim=[1,1];
bio(219).sigWidth=1;
bio(219).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.PosLocal_o4';
bio(219).ndims=2;
bio(219).size=[];
bio(219).isStruct=false;

bio(220).blkName='InputProcessing/For Iterator Subsystem1/GPS_Signals/VelYawLocal/p1';
bio(220).sigName='';
bio(220).portIdx=0;
bio(220).dim=[1,1];
bio(220).sigWidth=1;
bio(220).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.VelYawLocal_o1';
bio(220).ndims=2;
bio(220).size=[];
bio(220).isStruct=false;

bio(221).blkName='InputProcessing/For Iterator Subsystem1/GPS_Signals/VelYawLocal/p2';
bio(221).sigName='';
bio(221).portIdx=1;
bio(221).dim=[1,1];
bio(221).sigWidth=1;
bio(221).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.VelYawLocal_o2';
bio(221).ndims=2;
bio(221).size=[];
bio(221).isStruct=false;

bio(222).blkName='InputProcessing/For Iterator Subsystem1/GPS_Signals/VelYawLocal/p3';
bio(222).sigName='';
bio(222).portIdx=2;
bio(222).dim=[1,1];
bio(222).sigWidth=1;
bio(222).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.VelYawLocal_o3';
bio(222).ndims=2;
bio(222).size=[];
bio(222).isStruct=false;

bio(223).blkName='InputProcessing/For Iterator Subsystem1/GPS_Signals/VelYawLocal/p4';
bio(223).sigName='';
bio(223).portIdx=3;
bio(223).dim=[1,1];
bio(223).sigWidth=1;
bio(223).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.VelYawLocal_o4';
bio(223).ndims=2;
bio(223).size=[];
bio(223).isStruct=false;

bio(224).blkName='InputProcessing/For Iterator Subsystem1/GPS_Signals/VelYawLocal/p5';
bio(224).sigName='';
bio(224).portIdx=4;
bio(224).dim=[1,1];
bio(224).sigWidth=1;
bio(224).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.VelYawLocal_o5';
bio(224).ndims=2;
bio(224).size=[];
bio(224).isStruct=false;

bio(225).blkName='InputProcessing/For Iterator Subsystem1/GPS_Signals/VelYawLocal/p6';
bio(225).sigName='';
bio(225).portIdx=5;
bio(225).dim=[1,1];
bio(225).sigWidth=1;
bio(225).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.VelYawLocal_o6';
bio(225).ndims=2;
bio(225).size=[];
bio(225).isStruct=false;

bio(226).blkName='InputProcessing/For Iterator Subsystem1/GPS_Signals/VelocityLevel/p1';
bio(226).sigName='VelForward';
bio(226).portIdx=0;
bio(226).dim=[1,1];
bio(226).sigWidth=1;
bio(226).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.VelForward';
bio(226).ndims=2;
bio(226).size=[];
bio(226).isStruct=false;

bio(227).blkName='InputProcessing/For Iterator Subsystem1/GPS_Signals/VelocityLevel/p2';
bio(227).sigName='';
bio(227).portIdx=1;
bio(227).dim=[1,1];
bio(227).sigWidth=1;
bio(227).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.VelocityLevel_o2';
bio(227).ndims=2;
bio(227).size=[];
bio(227).isStruct=false;

bio(228).blkName='InputProcessing/For Iterator Subsystem1/GPS_Signals/VelocityLevel/p3';
bio(228).sigName='';
bio(228).portIdx=2;
bio(228).dim=[1,1];
bio(228).sigWidth=1;
bio(228).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.VelocityLevel_o3';
bio(228).ndims=2;
bio(228).size=[];
bio(228).isStruct=false;

bio(229).blkName='InputProcessing/For Iterator Subsystem1/GPS_Signals/VelocityLevel/p4';
bio(229).sigName='';
bio(229).portIdx=3;
bio(229).dim=[1,1];
bio(229).sigWidth=1;
bio(229).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.VelocityLevel_o4';
bio(229).ndims=2;
bio(229).size=[];
bio(229).isStruct=false;

bio(230).blkName='InputProcessing/For Iterator Subsystem2/IBEO_Signals/ClassANDBox/p1';
bio(230).sigName='';
bio(230).portIdx=0;
bio(230).dim=[1,1];
bio(230).sigWidth=1;
bio(230).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.ClassANDBox_o1';
bio(230).ndims=2;
bio(230).size=[];
bio(230).isStruct=false;

bio(231).blkName='InputProcessing/For Iterator Subsystem2/IBEO_Signals/ClassANDBox/p2';
bio(231).sigName='';
bio(231).portIdx=1;
bio(231).dim=[1,1];
bio(231).sigWidth=1;
bio(231).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.ClassANDBox_o2';
bio(231).ndims=2;
bio(231).size=[];
bio(231).isStruct=false;

bio(232).blkName='InputProcessing/For Iterator Subsystem2/IBEO_Signals/ClassANDBox/p3';
bio(232).sigName='Class';
bio(232).portIdx=2;
bio(232).dim=[1,1];
bio(232).sigWidth=1;
bio(232).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Class';
bio(232).ndims=2;
bio(232).size=[];
bio(232).isStruct=false;

bio(233).blkName='InputProcessing/For Iterator Subsystem2/IBEO_Signals/ClassANDBox/p4';
bio(233).sigName='';
bio(233).portIdx=3;
bio(233).dim=[1,1];
bio(233).sigWidth=1;
bio(233).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.ClassANDBox_o4';
bio(233).ndims=2;
bio(233).size=[];
bio(233).isStruct=false;

bio(234).blkName='InputProcessing/For Iterator Subsystem2/IBEO_Signals/ClassANDBox/p5';
bio(234).sigName='';
bio(234).portIdx=4;
bio(234).dim=[1,1];
bio(234).sigWidth=1;
bio(234).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.ClassANDBox_o5';
bio(234).ndims=2;
bio(234).size=[];
bio(234).isStruct=false;

bio(235).blkName='InputProcessing/For Iterator Subsystem2/IBEO_Signals/ClassANDBox/p6';
bio(235).sigName='ObjID';
bio(235).portIdx=5;
bio(235).dim=[1,1];
bio(235).sigWidth=1;
bio(235).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.ObjID';
bio(235).ndims=2;
bio(235).size=[];
bio(235).isStruct=false;

bio(236).blkName='InputProcessing/For Iterator Subsystem2/IBEO_Signals/ClassANDBox/p7';
bio(236).sigName='';
bio(236).portIdx=6;
bio(236).dim=[1,1];
bio(236).sigWidth=1;
bio(236).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.ClassANDBox_o7';
bio(236).ndims=2;
bio(236).size=[];
bio(236).isStruct=false;

bio(237).blkName='InputProcessing/For Iterator Subsystem2/IBEO_Signals/ClassANDBox/p8';
bio(237).sigName='';
bio(237).portIdx=7;
bio(237).dim=[1,1];
bio(237).sigWidth=1;
bio(237).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.ClassANDBox_o8';
bio(237).ndims=2;
bio(237).size=[];
bio(237).isStruct=false;

bio(238).blkName='InputProcessing/For Iterator Subsystem2/IBEO_Signals/DataBox/p1';
bio(238).sigName='Orientation';
bio(238).portIdx=0;
bio(238).dim=[1,1];
bio(238).sigWidth=1;
bio(238).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Orientation';
bio(238).ndims=2;
bio(238).size=[];
bio(238).isStruct=false;

bio(239).blkName='InputProcessing/For Iterator Subsystem2/IBEO_Signals/DataBox/p2';
bio(239).sigName='';
bio(239).portIdx=1;
bio(239).dim=[1,1];
bio(239).sigWidth=1;
bio(239).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.DataBox_o2';
bio(239).ndims=2;
bio(239).size=[];
bio(239).isStruct=false;

bio(240).blkName='InputProcessing/For Iterator Subsystem2/IBEO_Signals/DataBox/p3';
bio(240).sigName='';
bio(240).portIdx=2;
bio(240).dim=[1,1];
bio(240).sigWidth=1;
bio(240).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.DataBox_o3';
bio(240).ndims=2;
bio(240).size=[];
bio(240).isStruct=false;

bio(241).blkName='InputProcessing/For Iterator Subsystem2/IBEO_Signals/DataBox/p4';
bio(241).sigName='ObjID';
bio(241).portIdx=3;
bio(241).dim=[1,1];
bio(241).sigWidth=1;
bio(241).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.ObjID_c';
bio(241).ndims=2;
bio(241).size=[];
bio(241).isStruct=false;

bio(242).blkName='InputProcessing/For Iterator Subsystem2/IBEO_Signals/DataBox/p5';
bio(242).sigName='';
bio(242).portIdx=4;
bio(242).dim=[1,1];
bio(242).sigWidth=1;
bio(242).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.DataBox_o5';
bio(242).ndims=2;
bio(242).size=[];
bio(242).isStruct=false;

bio(243).blkName='InputProcessing/For Iterator Subsystem2/IBEO_Signals/DataBox/p6';
bio(243).sigName='';
bio(243).portIdx=5;
bio(243).dim=[1,1];
bio(243).sigWidth=1;
bio(243).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.DataBox_o6';
bio(243).ndims=2;
bio(243).size=[];
bio(243).isStruct=false;

bio(244).blkName='InputProcessing/For Iterator Subsystem2/IBEO_Signals/Tracking1/p1';
bio(244).sigName='ObjID';
bio(244).portIdx=0;
bio(244).dim=[1,1];
bio(244).sigWidth=1;
bio(244).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.ObjID_n';
bio(244).ndims=2;
bio(244).size=[];
bio(244).isStruct=false;

bio(245).blkName='InputProcessing/For Iterator Subsystem2/IBEO_Signals/Tracking1/p2';
bio(245).sigName='XPos';
bio(245).portIdx=1;
bio(245).dim=[1,1];
bio(245).sigWidth=1;
bio(245).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.XPos';
bio(245).ndims=2;
bio(245).size=[];
bio(245).isStruct=false;

bio(246).blkName='InputProcessing/For Iterator Subsystem2/IBEO_Signals/Tracking1/p3';
bio(246).sigName='YPos';
bio(246).portIdx=2;
bio(246).dim=[1,1];
bio(246).sigWidth=1;
bio(246).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.YPos';
bio(246).ndims=2;
bio(246).size=[];
bio(246).isStruct=false;

bio(247).blkName='InputProcessing/For Iterator Subsystem2/IBEO_Signals/Tracking1/p4';
bio(247).sigName='XVel';
bio(247).portIdx=3;
bio(247).dim=[1,1];
bio(247).sigWidth=1;
bio(247).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.XVel';
bio(247).ndims=2;
bio(247).size=[];
bio(247).isStruct=false;

bio(248).blkName='InputProcessing/For Iterator Subsystem2/IBEO_Signals/Tracking1/p5';
bio(248).sigName='YVel';
bio(248).portIdx=4;
bio(248).dim=[1,1];
bio(248).sigWidth=1;
bio(248).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.YVel';
bio(248).ndims=2;
bio(248).size=[];
bio(248).isStruct=false;

bio(249).blkName='InputProcessing/For Iterator Subsystem2/IBEO_Signals/Tracking1/p6';
bio(249).sigName='';
bio(249).portIdx=5;
bio(249).dim=[1,1];
bio(249).sigWidth=1;
bio(249).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Tracking1_o6';
bio(249).ndims=2;
bio(249).size=[];
bio(249).isStruct=false;

bio(250).blkName='InputProcessing/For Iterator Subsystem2/IBEO_Signals/Tracking1/p7';
bio(250).sigName='';
bio(250).portIdx=6;
bio(250).dim=[1,1];
bio(250).sigWidth=1;
bio(250).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Tracking1_o7';
bio(250).ndims=2;
bio(250).size=[];
bio(250).isStruct=false;

bio(251).blkName='OutputProcessing/ACC_Interface/SCC1 Processing/Memory';
bio(251).sigName='AliveCounterACC_CAN_Old';
bio(251).portIdx=0;
bio(251).dim=[1,1];
bio(251).sigWidth=1;
bio(251).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.AliveCounterACC_CAN_Old';
bio(251).ndims=2;
bio(251).size=[];
bio(251).isStruct=false;

bio(252).blkName='OutputProcessing/ACC_Interface/SCC1 Processing/Multiport Switch';
bio(252).sigName='ACCMode_CAN';
bio(252).portIdx=0;
bio(252).dim=[1,1];
bio(252).sigWidth=1;
bio(252).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.ACCMode_CAN';
bio(252).ndims=2;
bio(252).size=[];
bio(252).isStruct=false;

bio(253).blkName='OutputProcessing/ACC_Interface/SCC1 Processing/Multiport Switch1';
bio(253).sigName='MainModeACC_CAN';
bio(253).portIdx=0;
bio(253).dim=[1,1];
bio(253).sigWidth=1;
bio(253).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.MainModeACC_CAN';
bio(253).ndims=2;
bio(253).size=[];
bio(253).isStruct=false;

bio(254).blkName='OutputProcessing/ACC_Interface/SCC1 Processing/Multiport Switch2';
bio(254).sigName='StopReq_CAN';
bio(254).portIdx=0;
bio(254).dim=[1,1];
bio(254).sigWidth=1;
bio(254).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.StopReq_CAN';
bio(254).ndims=2;
bio(254).size=[];
bio(254).isStruct=false;

bio(255).blkName='OutputProcessing/ACC_Interface/SCC1 Processing/Multiport Switch3';
bio(255).sigName='SCCInfoDisplay';
bio(255).portIdx=0;
bio(255).dim=[1,1];
bio(255).sigWidth=1;
bio(255).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.SCCInfoDisplay';
bio(255).ndims=2;
bio(255).size=[];
bio(255).isStruct=false;

bio(256).blkName='OutputProcessing/ACC_Interface/SCC1 Processing/Multiport Switch4';
bio(256).sigName='ObjValid_CAN';
bio(256).portIdx=0;
bio(256).dim=[1,1];
bio(256).sigWidth=1;
bio(256).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.ObjValid_CAN';
bio(256).ndims=2;
bio(256).size=[];
bio(256).isStruct=false;

bio(257).blkName='OutputProcessing/ACC_Interface/SCC1 Processing/Relational Operator8';
bio(257).sigName='';
bio(257).portIdx=0;
bio(257).dim=[1,1];
bio(257).sigWidth=1;
bio(257).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RelationalOperator8';
bio(257).ndims=2;
bio(257).size=[];
bio(257).isStruct=false;

bio(258).blkName='OutputProcessing/ACC_Interface/SCC1 Processing/Add2';
bio(258).sigName='';
bio(258).portIdx=0;
bio(258).dim=[1,1];
bio(258).sigWidth=1;
bio(258).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Add2';
bio(258).ndims=2;
bio(258).size=[];
bio(258).isStruct=false;

bio(259).blkName='OutputProcessing/ACC_Interface/SCC1 Processing/Switch1';
bio(259).sigName='';
bio(259).portIdx=0;
bio(259).dim=[1,1];
bio(259).sigWidth=1;
bio(259).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Switch1';
bio(259).ndims=2;
bio(259).size=[];
bio(259).isStruct=false;

bio(260).blkName='OutputProcessing/ACC_Interface/SCC1 Processing/Switch9';
bio(260).sigName='AliveCounterACC_CAN';
bio(260).portIdx=0;
bio(260).dim=[1,1];
bio(260).sigWidth=1;
bio(260).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.AliveCounterACC_CAN';
bio(260).ndims=2;
bio(260).size=[];
bio(260).isStruct=false;

bio(261).blkName='OutputProcessing/ACC_Interface/SCC2 Processing/Rate Transition';
bio(261).sigName='';
bio(261).portIdx=0;
bio(261).dim=[1,1];
bio(261).sigWidth=1;
bio(261).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RateTransition';
bio(261).ndims=2;
bio(261).size=[];
bio(261).isStruct=false;

bio(262).blkName='OutputProcessing/ACC_Interface/SCC2 Processing/Rate Transition1';
bio(262).sigName='';
bio(262).portIdx=0;
bio(262).dim=[1,1];
bio(262).sigWidth=1;
bio(262).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RateTransition1_mn';
bio(262).ndims=2;
bio(262).size=[];
bio(262).isStruct=false;

bio(263).blkName='OutputProcessing/ACC_Interface/SCC2 Processing/Rate Transition2';
bio(263).sigName='';
bio(263).portIdx=0;
bio(263).dim=[1,1];
bio(263).sigWidth=1;
bio(263).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RateTransition2_d';
bio(263).ndims=2;
bio(263).size=[];
bio(263).isStruct=false;

bio(264).blkName='OutputProcessing/ACC_Interface/SCC2 Processing/Rate Transition3';
bio(264).sigName='';
bio(264).portIdx=0;
bio(264).dim=[1,1];
bio(264).sigWidth=1;
bio(264).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RateTransition3_p';
bio(264).ndims=2;
bio(264).size=[];
bio(264).isStruct=false;

bio(265).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/steerFilter';
bio(265).sigName='';
bio(265).portIdx=0;
bio(265).dim=[1,1];
bio(265).sigWidth=1;
bio(265).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.y';
bio(265).ndims=2;
bio(265).size=[];
bio(265).isStruct=false;

bio(266).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/PID_Input';
bio(266).sigName='error';
bio(266).portIdx=0;
bio(266).dim=[1,1];
bio(266).sigWidth=1;
bio(266).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.error';
bio(266).ndims=2;
bio(266).size=[];
bio(266).isStruct=false;

bio(267).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/PID_Input1';
bio(267).sigName='Req_Steering_PID';
bio(267).portIdx=0;
bio(267).dim=[1,1];
bio(267).sigWidth=1;
bio(267).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Req_Steering_PID';
bio(267).ndims=2;
bio(267).size=[];
bio(267).isStruct=false;

bio(268).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/PID_Input2';
bio(268).sigName='Act_Steering_PID';
bio(268).portIdx=0;
bio(268).dim=[1,1];
bio(268).sigWidth=1;
bio(268).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Act_Steering_PID';
bio(268).ndims=2;
bio(268).size=[];
bio(268).isStruct=false;

bio(269).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/PID_Output';
bio(269).sigName='';
bio(269).portIdx=0;
bio(269).dim=[1,1];
bio(269).sigWidth=1;
bio(269).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.PID_Output';
bio(269).ndims=2;
bio(269).size=[];
bio(269).isStruct=false;

bio(270).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Rate Transition';
bio(270).sigName='';
bio(270).portIdx=0;
bio(270).dim=[1,1];
bio(270).sigWidth=1;
bio(270).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RateTransition_p';
bio(270).ndims=2;
bio(270).size=[];
bio(270).isStruct=false;

bio(271).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Rate Transition1';
bio(271).sigName='';
bio(271).portIdx=0;
bio(271).dim=[1,1];
bio(271).sigWidth=1;
bio(271).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RateTransition1_hj';
bio(271).ndims=2;
bio(271).size=[];
bio(271).isStruct=false;

bio(272).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Rate Transition10';
bio(272).sigName='';
bio(272).portIdx=0;
bio(272).dim=[1,1];
bio(272).sigWidth=1;
bio(272).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RateTransition10';
bio(272).ndims=2;
bio(272).size=[];
bio(272).isStruct=false;

bio(273).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Rate Transition11';
bio(273).sigName='';
bio(273).portIdx=0;
bio(273).dim=[1,1];
bio(273).sigWidth=1;
bio(273).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RateTransition11';
bio(273).ndims=2;
bio(273).size=[];
bio(273).isStruct=false;

bio(274).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Rate Transition2';
bio(274).sigName='';
bio(274).portIdx=0;
bio(274).dim=[1,1];
bio(274).sigWidth=1;
bio(274).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RateTransition2_dw';
bio(274).ndims=2;
bio(274).size=[];
bio(274).isStruct=false;

bio(275).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Rate Transition3';
bio(275).sigName='';
bio(275).portIdx=0;
bio(275).dim=[1,1];
bio(275).sigWidth=1;
bio(275).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RateTransition3_c';
bio(275).ndims=2;
bio(275).size=[];
bio(275).isStruct=false;

bio(276).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Rate Transition4';
bio(276).sigName='';
bio(276).portIdx=0;
bio(276).dim=[1,1];
bio(276).sigWidth=1;
bio(276).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RateTransition4_j';
bio(276).ndims=2;
bio(276).size=[];
bio(276).isStruct=false;

bio(277).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Rate Transition5';
bio(277).sigName='';
bio(277).portIdx=0;
bio(277).dim=[1,1];
bio(277).sigWidth=1;
bio(277).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RateTransition5_g';
bio(277).ndims=2;
bio(277).size=[];
bio(277).isStruct=false;

bio(278).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Rate Transition6';
bio(278).sigName='';
bio(278).portIdx=0;
bio(278).dim=[1,1];
bio(278).sigWidth=1;
bio(278).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RateTransition6_c';
bio(278).ndims=2;
bio(278).size=[];
bio(278).isStruct=false;

bio(279).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Rate Transition7';
bio(279).sigName='';
bio(279).portIdx=0;
bio(279).dim=[1,1];
bio(279).sigWidth=1;
bio(279).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RateTransition7_i';
bio(279).ndims=2;
bio(279).size=[];
bio(279).isStruct=false;

bio(280).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Rate Transition8';
bio(280).sigName='';
bio(280).portIdx=0;
bio(280).dim=[1,1];
bio(280).sigWidth=1;
bio(280).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RateTransition8';
bio(280).ndims=2;
bio(280).size=[];
bio(280).isStruct=false;

bio(281).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Rate Transition9';
bio(281).sigName='';
bio(281).portIdx=0;
bio(281).dim=[1,1];
bio(281).sigWidth=1;
bio(281).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RateTransition9';
bio(281).ndims=2;
bio(281).size=[];
bio(281).isStruct=false;

bio(282).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Rate Limiter';
bio(282).sigName='';
bio(282).portIdx=0;
bio(282).dim=[1,1];
bio(282).sigWidth=1;
bio(282).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RateLimiter';
bio(282).ndims=2;
bio(282).size=[];
bio(282).isStruct=false;

bio(283).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Saturation';
bio(283).sigName='';
bio(283).portIdx=0;
bio(283).dim=[1,1];
bio(283).sigWidth=1;
bio(283).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Saturation';
bio(283).ndims=2;
bio(283).size=[];
bio(283).isStruct=false;

bio(284).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/CAN Pack';
bio(284).sigName='';
bio(284).portIdx=0;
bio(284).dim=[1,1];
bio(284).sigWidth=1;
bio(284).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.CANPack_b';
bio(284).ndims=2;
bio(284).size=[];
bio(284).isStruct=false;

bio(285).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Add1';
bio(285).sigName='';
bio(285).portIdx=0;
bio(285).dim=[1,1];
bio(285).sigWidth=1;
bio(285).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Add1';
bio(285).ndims=2;
bio(285).size=[];
bio(285).isStruct=false;

bio(286).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Switch';
bio(286).sigName='';
bio(286).portIdx=0;
bio(286).dim=[1,1];
bio(286).sigWidth=1;
bio(286).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Switch_e';
bio(286).ndims=2;
bio(286).size=[];
bio(286).isStruct=false;

bio(287).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Switch1';
bio(287).sigName='';
bio(287).portIdx=0;
bio(287).dim=[1,1];
bio(287).sigWidth=1;
bio(287).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Switch1_g';
bio(287).ndims=2;
bio(287).size=[];
bio(287).isStruct=false;

bio(288).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Unit Delay';
bio(288).sigName='';
bio(288).portIdx=0;
bio(288).dim=[1,1];
bio(288).sigWidth=1;
bio(288).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.UnitDelay';
bio(288).ndims=2;
bio(288).size=[];
bio(288).isStruct=false;

bio(289).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Unit Delay1';
bio(289).sigName='';
bio(289).portIdx=0;
bio(289).dim=[1,1];
bio(289).sigWidth=1;
bio(289).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.UnitDelay1';
bio(289).ndims=2;
bio(289).size=[];
bio(289).isStruct=false;

bio(290).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/EMS1Processing/Gain';
bio(290).sigName='Engine_Torque';
bio(290).portIdx=0;
bio(290).dim=[1,1];
bio(290).sigWidth=1;
bio(290).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Engine_Torque_n';
bio(290).ndims=2;
bio(290).size=[];
bio(290).isStruct=false;

bio(291).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/EMS1Processing/Signal Conversion';
bio(291).sigName='ipEmsVehSpd[kph]';
bio(291).portIdx=0;
bio(291).dim=[1,1];
bio(291).sigWidth=1;
bio(291).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.ipEmsVehSpdkph';
bio(291).ndims=2;
bio(291).size=[];
bio(291).isStruct=false;

bio(292).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/EMS1Processing/Signal Conversion';
bio(292).sigName='TQFR';
bio(292).portIdx=0;
bio(292).dim=[1,1];
bio(292).sigWidth=1;
bio(292).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.TQFR_b';
bio(292).ndims=2;
bio(292).size=[];
bio(292).isStruct=false;

bio(293).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/EMS1Processing/Signal Conversion';
bio(293).sigName='Engine_Torque';
bio(293).portIdx=0;
bio(293).dim=[1,1];
bio(293).sigWidth=1;
bio(293).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Engine_Torque_p';
bio(293).ndims=2;
bio(293).size=[];
bio(293).isStruct=false;

bio(294).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/EMS1Processing/Signal Conversion';
bio(294).sigName='TQ_STND';
bio(294).portIdx=0;
bio(294).dim=[1,1];
bio(294).sigWidth=1;
bio(294).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.TQ_STND_n';
bio(294).ndims=2;
bio(294).size=[];
bio(294).isStruct=false;

bio(295).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/EMS1Processing/Signal Conversion';
bio(295).sigName='BRAKE_ACT';
bio(295).portIdx=0;
bio(295).dim=[1,1];
bio(295).sigWidth=1;
bio(295).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.BRAKE_ACT_n';
bio(295).ndims=2;
bio(295).size=[];
bio(295).isStruct=false;

bio(296).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/EMS1Processing/Product';
bio(296).sigName='Engine_Torque';
bio(296).portIdx=0;
bio(296).dim=[1,1];
bio(296).sigWidth=1;
bio(296).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Engine_Torque';
bio(296).ndims=2;
bio(296).size=[];
bio(296).isStruct=false;

bio(297).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/Signal Conversion';
bio(297).sigName='ipStrAng[deg]';
bio(297).portIdx=0;
bio(297).dim=[1,1];
bio(297).sigWidth=1;
bio(297).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.ipStrAngdeg_a';
bio(297).ndims=2;
bio(297).size=[];
bio(297).isStruct=false;

bio(298).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/Signal Conversion';
bio(298).sigName='ipStrAngEr';
bio(298).portIdx=0;
bio(298).dim=[1,1];
bio(298).sigWidth=1;
bio(298).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.ipStrAngEr';
bio(298).ndims=2;
bio(298).size=[];
bio(298).isStruct=false;

bio(299).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/Signal Conversion';
bio(299).sigName='ipStrSpd[deg/s]';
bio(299).portIdx=0;
bio(299).dim=[1,1];
bio(299).sigWidth=1;
bio(299).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.ipStrSpddegs';
bio(299).ndims=2;
bio(299).size=[];
bio(299).isStruct=false;

bio(300).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/Signal Conversion';
bio(300).sigName='ipStrSpdEr';
bio(300).portIdx=0;
bio(300).dim=[1,1];
bio(300).sigWidth=1;
bio(300).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.ipStrSpdEr';
bio(300).ndims=2;
bio(300).size=[];
bio(300).isStruct=false;

bio(301).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/Signal Conversion';
bio(301).sigName='ipSasCnt';
bio(301).portIdx=0;
bio(301).dim=[1,1];
bio(301).sigWidth=1;
bio(301).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.ipSasCnt';
bio(301).ndims=2;
bio(301).size=[];
bio(301).isStruct=false;

bio(302).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/Signal Conversion';
bio(302).sigName='ipSasCksum';
bio(302).portIdx=0;
bio(302).dim=[1,1];
bio(302).sigWidth=1;
bio(302).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.ipSasCksum';
bio(302).ndims=2;
bio(302).size=[];
bio(302).isStruct=false;

bio(303).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/Gain';
bio(303).sigName='ipVehSpdWhl[m/s]';
bio(303).portIdx=0;
bio(303).dim=[1,1];
bio(303).sigWidth=1;
bio(303).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.ipVehSpdWhlms';
bio(303).ndims=2;
bio(303).size=[];
bio(303).isStruct=false;

bio(304).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/Product5';
bio(304).sigName='ipVehSpdWhl[kph]';
bio(304).portIdx=0;
bio(304).dim=[1,1];
bio(304).sigWidth=1;
bio(304).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.ipVehSpdWhlkph';
bio(304).ndims=2;
bio(304).size=[];
bio(304).isStruct=false;

bio(305).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/Add2';
bio(305).sigName='';
bio(305).portIdx=0;
bio(305).dim=[1,1];
bio(305).sigWidth=1;
bio(305).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Add2_c';
bio(305).ndims=2;
bio(305).size=[];
bio(305).isStruct=false;

bio(306).blkName='OutputProcessing/ACC_Interface/SCC1 Processing/Compare To Constant2/Compare';
bio(306).sigName='';
bio(306).portIdx=0;
bio(306).dim=[1,1];
bio(306).sigWidth=1;
bio(306).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Compare';
bio(306).ndims=2;
bio(306).size=[];
bio(306).isStruct=false;

bio(307).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/IGainSpeed';
bio(307).sigName='';
bio(307).portIdx=0;
bio(307).dim=[1,1];
bio(307).sigWidth=1;
bio(307).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.IGainSpeed';
bio(307).ndims=2;
bio(307).size=[];
bio(307).isStruct=false;

bio(308).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PGainSAS';
bio(308).sigName='PGainSAS';
bio(308).portIdx=0;
bio(308).dim=[1,1];
bio(308).sigWidth=1;
bio(308).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.PGainSAS';
bio(308).ndims=2;
bio(308).size=[];
bio(308).isStruct=false;

bio(309).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PGainSpeed';
bio(309).sigName='PGainSpeed';
bio(309).portIdx=0;
bio(309).dim=[1,1];
bio(309).sigWidth=1;
bio(309).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.PGainSpeed';
bio(309).ndims=2;
bio(309).size=[];
bio(309).isStruct=false;

bio(310).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/P_gain_sas_map';
bio(310).sigName='';
bio(310).portIdx=0;
bio(310).dim=[1,1];
bio(310).sigWidth=1;
bio(310).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.P_gain_sas_map';
bio(310).ndims=2;
bio(310).size=[];
bio(310).isStruct=false;

bio(311).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/P_gain_spd_map';
bio(311).sigName='';
bio(311).portIdx=0;
bio(311).dim=[1,1];
bio(311).sigWidth=1;
bio(311).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.P_gain_spd_map';
bio(311).ndims=2;
bio(311).size=[];
bio(311).isStruct=false;

bio(312).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/Rate Limiter steering';
bio(312).sigName='Control Tq';
bio(312).portIdx=0;
bio(312).dim=[1,1];
bio(312).sigWidth=1;
bio(312).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.ControlTq';
bio(312).ndims=2;
bio(312).size=[];
bio(312).isStruct=false;

bio(313).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/Saturation steering torque';
bio(313).sigName='Tq_after_sat';
bio(313).portIdx=0;
bio(313).dim=[1,1];
bio(313).sigWidth=1;
bio(313).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Tq_after_sat';
bio(313).ndims=2;
bio(313).size=[];
bio(313).isStruct=false;

bio(314).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Discrete PID Controller1/Filter';
bio(314).sigName='';
bio(314).portIdx=0;
bio(314).dim=[1,1];
bio(314).sigWidth=1;
bio(314).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Filter';
bio(314).ndims=2;
bio(314).size=[];
bio(314).isStruct=false;

bio(315).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Discrete PID Controller1/Integrator';
bio(315).sigName='';
bio(315).portIdx=0;
bio(315).dim=[1,1];
bio(315).sigWidth=1;
bio(315).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Integrator';
bio(315).ndims=2;
bio(315).size=[];
bio(315).isStruct=false;

bio(316).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Discrete PID Controller1/Derivative Gain';
bio(316).sigName='';
bio(316).portIdx=0;
bio(316).dim=[1,1];
bio(316).sigWidth=1;
bio(316).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.DerivativeGain';
bio(316).ndims=2;
bio(316).size=[];
bio(316).isStruct=false;

bio(317).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Discrete PID Controller1/Filter Coefficient';
bio(317).sigName='';
bio(317).portIdx=0;
bio(317).dim=[1,1];
bio(317).sigWidth=1;
bio(317).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.FilterCoefficient';
bio(317).ndims=2;
bio(317).size=[];
bio(317).isStruct=false;

bio(318).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Discrete PID Controller1/Integral Gain';
bio(318).sigName='';
bio(318).portIdx=0;
bio(318).dim=[1,1];
bio(318).sigWidth=1;
bio(318).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.IntegralGain';
bio(318).ndims=2;
bio(318).size=[];
bio(318).isStruct=false;

bio(319).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Discrete PID Controller1/Proportional Gain';
bio(319).sigName='';
bio(319).portIdx=0;
bio(319).dim=[1,1];
bio(319).sigWidth=1;
bio(319).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.ProportionalGain';
bio(319).ndims=2;
bio(319).size=[];
bio(319).isStruct=false;

bio(320).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Discrete PID Controller1/Saturate';
bio(320).sigName='';
bio(320).portIdx=0;
bio(320).dim=[1,1];
bio(320).sigWidth=1;
bio(320).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Saturate';
bio(320).ndims=2;
bio(320).size=[];
bio(320).isStruct=false;

bio(321).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Discrete PID Controller1/Sum';
bio(321).sigName='';
bio(321).portIdx=0;
bio(321).dim=[1,1];
bio(321).sigWidth=1;
bio(321).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Sum_i';
bio(321).ndims=2;
bio(321).size=[];
bio(321).isStruct=false;

bio(322).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Discrete PID Controller1/SumD';
bio(322).sigName='';
bio(322).portIdx=0;
bio(322).dim=[1,1];
bio(322).sigWidth=1;
bio(322).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.SumD';
bio(322).ndims=2;
bio(322).size=[];
bio(322).isStruct=false;

bio(323).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Discrete PID Controller1/Switch';
bio(323).sigName='';
bio(323).portIdx=0;
bio(323).dim=[1,1];
bio(323).sigWidth=1;
bio(323).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Switch_k';
bio(323).ndims=2;
bio(323).size=[];
bio(323).isStruct=false;

bio(324).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/Add2';
bio(324).sigName='';
bio(324).portIdx=0;
bio(324).dim=[1,1];
bio(324).sigWidth=1;
bio(324).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Add2_o';
bio(324).ndims=2;
bio(324).size=[];
bio(324).isStruct=false;

bio(325).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/Switch1';
bio(325).sigName='ipStrAng[deg]';
bio(325).portIdx=0;
bio(325).dim=[1,1];
bio(325).sigWidth=1;
bio(325).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.ipStrAngdeg';
bio(325).ndims=2;
bio(325).size=[];
bio(325).isStruct=false;

bio(326).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing/Memory';
bio(326).sigName='';
bio(326).portIdx=0;
bio(326).dim=[1,1];
bio(326).sigWidth=1;
bio(326).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Memory_o';
bio(326).ndims=2;
bio(326).size=[];
bio(326).isStruct=false;

bio(327).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing/Memory1';
bio(327).sigName='';
bio(327).portIdx=0;
bio(327).dim=[1,1];
bio(327).sigWidth=1;
bio(327).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Memory1_i';
bio(327).ndims=2;
bio(327).size=[];
bio(327).isStruct=false;

bio(328).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing/Merge';
bio(328).sigName='';
bio(328).portIdx=0;
bio(328).dim=[1,1];
bio(328).sigWidth=1;
bio(328).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge_p';
bio(328).ndims=2;
bio(328).size=[];
bio(328).isStruct=false;

bio(329).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing/Merge1';
bio(329).sigName='';
bio(329).portIdx=0;
bio(329).dim=[1,1];
bio(329).sigWidth=1;
bio(329).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge1_h';
bio(329).ndims=2;
bio(329).size=[];
bio(329).isStruct=false;

bio(330).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing/Merge2';
bio(330).sigName='';
bio(330).portIdx=0;
bio(330).dim=[1,1];
bio(330).sigWidth=1;
bio(330).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge2_m';
bio(330).ndims=2;
bio(330).size=[];
bio(330).isStruct=false;

bio(331).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing1/Memory';
bio(331).sigName='';
bio(331).portIdx=0;
bio(331).dim=[1,1];
bio(331).sigWidth=1;
bio(331).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Memory_f';
bio(331).ndims=2;
bio(331).size=[];
bio(331).isStruct=false;

bio(332).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing1/Memory1';
bio(332).sigName='';
bio(332).portIdx=0;
bio(332).dim=[1,1];
bio(332).sigWidth=1;
bio(332).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Memory1_if';
bio(332).ndims=2;
bio(332).size=[];
bio(332).isStruct=false;

bio(333).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing1/Merge';
bio(333).sigName='';
bio(333).portIdx=0;
bio(333).dim=[1,1];
bio(333).sigWidth=1;
bio(333).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge_c';
bio(333).ndims=2;
bio(333).size=[];
bio(333).isStruct=false;

bio(334).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing1/Merge1';
bio(334).sigName='';
bio(334).portIdx=0;
bio(334).dim=[1,1];
bio(334).sigWidth=1;
bio(334).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge1_b';
bio(334).ndims=2;
bio(334).size=[];
bio(334).isStruct=false;

bio(335).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing1/Merge2';
bio(335).sigName='';
bio(335).portIdx=0;
bio(335).dim=[1,1];
bio(335).sigWidth=1;
bio(335).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge2_mc';
bio(335).ndims=2;
bio(335).size=[];
bio(335).isStruct=false;

bio(336).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing2/Memory';
bio(336).sigName='';
bio(336).portIdx=0;
bio(336).dim=[1,1];
bio(336).sigWidth=1;
bio(336).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Memory_p';
bio(336).ndims=2;
bio(336).size=[];
bio(336).isStruct=false;

bio(337).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing2/Memory1';
bio(337).sigName='';
bio(337).portIdx=0;
bio(337).dim=[1,1];
bio(337).sigWidth=1;
bio(337).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Memory1_d';
bio(337).ndims=2;
bio(337).size=[];
bio(337).isStruct=false;

bio(338).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing2/Merge';
bio(338).sigName='';
bio(338).portIdx=0;
bio(338).dim=[1,1];
bio(338).sigWidth=1;
bio(338).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge_kt';
bio(338).ndims=2;
bio(338).size=[];
bio(338).isStruct=false;

bio(339).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing2/Merge1';
bio(339).sigName='';
bio(339).portIdx=0;
bio(339).dim=[1,1];
bio(339).sigWidth=1;
bio(339).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge1_d';
bio(339).ndims=2;
bio(339).size=[];
bio(339).isStruct=false;

bio(340).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing2/Merge2';
bio(340).sigName='';
bio(340).portIdx=0;
bio(340).dim=[1,1];
bio(340).sigWidth=1;
bio(340).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge2_a';
bio(340).ndims=2;
bio(340).size=[];
bio(340).isStruct=false;

bio(341).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing3/Memory';
bio(341).sigName='';
bio(341).portIdx=0;
bio(341).dim=[1,1];
bio(341).sigWidth=1;
bio(341).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Memory_ot';
bio(341).ndims=2;
bio(341).size=[];
bio(341).isStruct=false;

bio(342).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing3/Memory1';
bio(342).sigName='';
bio(342).portIdx=0;
bio(342).dim=[1,1];
bio(342).sigWidth=1;
bio(342).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Memory1_g';
bio(342).ndims=2;
bio(342).size=[];
bio(342).isStruct=false;

bio(343).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing3/Merge';
bio(343).sigName='';
bio(343).portIdx=0;
bio(343).dim=[1,1];
bio(343).sigWidth=1;
bio(343).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge_a';
bio(343).ndims=2;
bio(343).size=[];
bio(343).isStruct=false;

bio(344).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing3/Merge1';
bio(344).sigName='';
bio(344).portIdx=0;
bio(344).dim=[1,1];
bio(344).sigWidth=1;
bio(344).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge1_du';
bio(344).ndims=2;
bio(344).size=[];
bio(344).isStruct=false;

bio(345).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing3/Merge2';
bio(345).sigName='';
bio(345).portIdx=0;
bio(345).dim=[1,1];
bio(345).sigWidth=1;
bio(345).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge2_g';
bio(345).ndims=2;
bio(345).size=[];
bio(345).isStruct=false;

bio(346).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/Product2';
bio(346).sigName='';
bio(346).portIdx=0;
bio(346).dim=[1,1];
bio(346).sigWidth=1;
bio(346).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Product2';
bio(346).ndims=2;
bio(346).size=[];
bio(346).isStruct=false;

bio(347).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Discrete PID Controller1/Clamping circuit/DataTypeConv1';
bio(347).sigName='';
bio(347).portIdx=0;
bio(347).dim=[1,1];
bio(347).sigWidth=1;
bio(347).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.DataTypeConv1';
bio(347).ndims=2;
bio(347).size=[];
bio(347).isStruct=false;

bio(348).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Discrete PID Controller1/Clamping circuit/DataTypeConv2';
bio(348).sigName='';
bio(348).portIdx=0;
bio(348).dim=[1,1];
bio(348).sigWidth=1;
bio(348).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.DataTypeConv2';
bio(348).ndims=2;
bio(348).size=[];
bio(348).isStruct=false;

bio(349).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Discrete PID Controller1/Clamping circuit/DeadZone';
bio(349).sigName='';
bio(349).portIdx=0;
bio(349).dim=[1,1];
bio(349).sigWidth=1;
bio(349).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.DeadZone';
bio(349).ndims=2;
bio(349).size=[];
bio(349).isStruct=false;

bio(350).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Discrete PID Controller1/Clamping circuit/ZeroGain';
bio(350).sigName='';
bio(350).portIdx=0;
bio(350).dim=[1,1];
bio(350).sigWidth=1;
bio(350).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.ZeroGain';
bio(350).ndims=2;
bio(350).size=[];
bio(350).isStruct=false;

bio(351).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Discrete PID Controller1/Clamping circuit/AND';
bio(351).sigName='';
bio(351).portIdx=0;
bio(351).dim=[1,1];
bio(351).sigWidth=1;
bio(351).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.AND';
bio(351).ndims=2;
bio(351).size=[];
bio(351).isStruct=false;

bio(352).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Discrete PID Controller1/Clamping circuit/Equal';
bio(352).sigName='';
bio(352).portIdx=0;
bio(352).dim=[1,1];
bio(352).sigWidth=1;
bio(352).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Equal';
bio(352).ndims=2;
bio(352).size=[];
bio(352).isStruct=false;

bio(353).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Discrete PID Controller1/Clamping circuit/NotEqual';
bio(353).sigName='';
bio(353).portIdx=0;
bio(353).dim=[1,1];
bio(353).sigWidth=1;
bio(353).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.NotEqual';
bio(353).ndims=2;
bio(353).size=[];
bio(353).isStruct=false;

bio(354).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Discrete PID Controller1/Clamping circuit/SignDeltaU';
bio(354).sigName='';
bio(354).portIdx=0;
bio(354).dim=[1,1];
bio(354).sigWidth=1;
bio(354).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.SignDeltaU';
bio(354).ndims=2;
bio(354).size=[];
bio(354).isStruct=false;

bio(355).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Discrete PID Controller1/Clamping circuit/SignPreIntegrator';
bio(355).sigName='';
bio(355).portIdx=0;
bio(355).dim=[1,1];
bio(355).sigWidth=1;
bio(355).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.SignPreIntegrator';
bio(355).ndims=2;
bio(355).size=[];
bio(355).isStruct=false;

bio(356).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/MessageCounter/Data Type Conversion';
bio(356).sigName='';
bio(356).portIdx=0;
bio(356).dim=[1,1];
bio(356).sigWidth=1;
bio(356).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.DataTypeConversion';
bio(356).ndims=2;
bio(356).size=[];
bio(356).isStruct=false;

bio(357).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/MessageCounter/Data Type Conversion1';
bio(357).sigName='Counter';
bio(357).portIdx=0;
bio(357).dim=[1,1];
bio(357).sigWidth=1;
bio(357).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Counter';
bio(357).ndims=2;
bio(357).size=[];
bio(357).isStruct=false;

bio(358).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/MessageCounter/Divide';
bio(358).sigName='';
bio(358).portIdx=0;
bio(358).dim=[1,1];
bio(358).sigWidth=1;
bio(358).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Divide';
bio(358).ndims=2;
bio(358).size=[];
bio(358).isStruct=false;

bio(359).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/MessageCounter/Relational Operator';
bio(359).sigName='';
bio(359).portIdx=0;
bio(359).dim=[1,1];
bio(359).sigWidth=1;
bio(359).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RelationalOperator';
bio(359).ndims=2;
bio(359).size=[];
bio(359).isStruct=false;

bio(360).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/MessageCounter/Relational Operator2';
bio(360).sigName='';
bio(360).portIdx=0;
bio(360).dim=[1,1];
bio(360).sigWidth=1;
bio(360).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.RelationalOperator2';
bio(360).ndims=2;
bio(360).size=[];
bio(360).isStruct=false;

bio(361).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/MessageCounter/Sum';
bio(361).sigName='';
bio(361).portIdx=0;
bio(361).dim=[1,1];
bio(361).sigWidth=1;
bio(361).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Sum_n';
bio(361).ndims=2;
bio(361).size=[];
bio(361).isStruct=false;

bio(362).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/MessageCounter/Sum1';
bio(362).sigName='';
bio(362).portIdx=0;
bio(362).dim=[1,1];
bio(362).sigWidth=1;
bio(362).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Sum1_m';
bio(362).ndims=2;
bio(362).size=[];
bio(362).isStruct=false;

bio(363).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/MessageCounter/Switch';
bio(363).sigName='';
bio(363).portIdx=0;
bio(363).dim=[1,1];
bio(363).sigWidth=1;
bio(363).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Switch_nz';
bio(363).ndims=2;
bio(363).size=[];
bio(363).isStruct=false;

bio(364).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/MessageCounter/Switch2';
bio(364).sigName='';
bio(364).portIdx=0;
bio(364).dim=[1,1];
bio(364).sigWidth=1;
bio(364).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Switch2';
bio(364).ndims=2;
bio(364).size=[];
bio(364).isStruct=false;

bio(365).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/MessageCounter/Unit Delay';
bio(365).sigName='';
bio(365).portIdx=0;
bio(365).dim=[1,1];
bio(365).sigWidth=1;
bio(365).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.UnitDelay_l';
bio(365).ndims=2;
bio(365).size=[];
bio(365).isStruct=false;

bio(366).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/MessageCounter/Unit Delay1';
bio(366).sigName='';
bio(366).portIdx=0;
bio(366).dim=[1,1];
bio(366).sigWidth=1;
bio(366).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.UnitDelay1_o';
bio(366).ndims=2;
bio(366).size=[];
bio(366).isStruct=false;

bio(367).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/Tx_ADAS_data/Data Type Conversion1';
bio(367).sigName='MessageCounter';
bio(367).portIdx=0;
bio(367).dim=[1,1];
bio(367).sigWidth=1;
bio(367).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.MessageCounter';
bio(367).ndims=2;
bio(367).size=[];
bio(367).isStruct=false;

bio(368).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/Tx_ADAS_data/Data Type Conversion11';
bio(368).sigName='';
bio(368).portIdx=0;
bio(368).dim=[1,1];
bio(368).sigWidth=1;
bio(368).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.DataTypeConversion11';
bio(368).ndims=2;
bio(368).size=[];
bio(368).isStruct=false;

bio(369).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/Tx_ADAS_data/Data Type Conversion12';
bio(369).sigName='MessageCounter';
bio(369).portIdx=0;
bio(369).dim=[1,1];
bio(369).sigWidth=1;
bio(369).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.MessageCounter_k';
bio(369).ndims=2;
bio(369).size=[];
bio(369).isStruct=false;

bio(370).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/Tx_ADAS_data/Data Type Conversion14';
bio(370).sigName='Checksum_Out';
bio(370).portIdx=0;
bio(370).dim=[1,1];
bio(370).sigWidth=1;
bio(370).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Checksum_Out';
bio(370).ndims=2;
bio(370).size=[];
bio(370).isStruct=false;

bio(371).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/Tx_ADAS_data/Data Type Conversion2';
bio(371).sigName='LKAS_Toq';
bio(371).portIdx=0;
bio(371).dim=[1,1];
bio(371).sigWidth=1;
bio(371).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.LKAS_Toq';
bio(371).ndims=2;
bio(371).size=[];
bio(371).isStruct=false;

bio(372).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/Tx_ADAS_data/Data Type Conversion9';
bio(372).sigName='ActiveFlag';
bio(372).portIdx=0;
bio(372).dim=[1,1];
bio(372).sigWidth=1;
bio(372).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.ActiveFlag';
bio(372).ndims=2;
bio(372).size=[];
bio(372).isStruct=false;

bio(373).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/EMS1Processing/EMS1 Processing/ErrProcessing/Memory';
bio(373).sigName='';
bio(373).portIdx=0;
bio(373).dim=[1,1];
bio(373).sigWidth=1;
bio(373).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Memory';
bio(373).ndims=2;
bio(373).size=[];
bio(373).isStruct=false;

bio(374).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/EMS1Processing/EMS1 Processing/ErrProcessing/Memory1';
bio(374).sigName='';
bio(374).portIdx=0;
bio(374).dim=[1,1];
bio(374).sigWidth=1;
bio(374).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Memory1';
bio(374).ndims=2;
bio(374).size=[];
bio(374).isStruct=false;

bio(375).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/EMS1Processing/EMS1 Processing/ErrProcessing/Merge';
bio(375).sigName='';
bio(375).portIdx=0;
bio(375).dim=[1,1];
bio(375).sigWidth=1;
bio(375).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge';
bio(375).ndims=2;
bio(375).size=[];
bio(375).isStruct=false;

bio(376).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/EMS1Processing/EMS1 Processing/ErrProcessing/Merge1';
bio(376).sigName='';
bio(376).portIdx=0;
bio(376).dim=[1,1];
bio(376).sigWidth=1;
bio(376).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge1';
bio(376).ndims=2;
bio(376).size=[];
bio(376).isStruct=false;

bio(377).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/EMS1Processing/EMS1 Processing/ErrProcessing/Merge2';
bio(377).sigName='';
bio(377).portIdx=0;
bio(377).dim=[1,1];
bio(377).sigWidth=1;
bio(377).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge2';
bio(377).ndims=2;
bio(377).size=[];
bio(377).isStruct=false;

bio(378).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/Compare To Constant1/Compare';
bio(378).sigName='';
bio(378).portIdx=0;
bio(378).dim=[1,1];
bio(378).sigWidth=1;
bio(378).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Compare_f';
bio(378).ndims=2;
bio(378).size=[];
bio(378).isStruct=false;

bio(379).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/ErrProcessing1/Memory';
bio(379).sigName='';
bio(379).portIdx=0;
bio(379).dim=[1,1];
bio(379).sigWidth=1;
bio(379).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Memory_j';
bio(379).ndims=2;
bio(379).size=[];
bio(379).isStruct=false;

bio(380).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/ErrProcessing1/Memory1';
bio(380).sigName='';
bio(380).portIdx=0;
bio(380).dim=[1,1];
bio(380).sigWidth=1;
bio(380).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Memory1_m';
bio(380).ndims=2;
bio(380).size=[];
bio(380).isStruct=false;

bio(381).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/ErrProcessing1/Merge';
bio(381).sigName='';
bio(381).portIdx=0;
bio(381).dim=[1,1];
bio(381).sigWidth=1;
bio(381).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge_b';
bio(381).ndims=2;
bio(381).size=[];
bio(381).isStruct=false;

bio(382).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/ErrProcessing1/Merge1';
bio(382).sigName='';
bio(382).portIdx=0;
bio(382).dim=[1,1];
bio(382).sigWidth=1;
bio(382).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge1_i';
bio(382).ndims=2;
bio(382).size=[];
bio(382).isStruct=false;

bio(383).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/ErrProcessing1/Merge2';
bio(383).sigName='';
bio(383).portIdx=0;
bio(383).dim=[1,1];
bio(383).sigWidth=1;
bio(383).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge2_k';
bio(383).ndims=2;
bio(383).size=[];
bio(383).isStruct=false;

bio(384).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/ErrProcessing2/Memory';
bio(384).sigName='';
bio(384).portIdx=0;
bio(384).dim=[1,1];
bio(384).sigWidth=1;
bio(384).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Memory_a';
bio(384).ndims=2;
bio(384).size=[];
bio(384).isStruct=false;

bio(385).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/ErrProcessing2/Memory1';
bio(385).sigName='';
bio(385).portIdx=0;
bio(385).dim=[1,1];
bio(385).sigWidth=1;
bio(385).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Memory1_j';
bio(385).ndims=2;
bio(385).size=[];
bio(385).isStruct=false;

bio(386).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/ErrProcessing2/Merge';
bio(386).sigName='';
bio(386).portIdx=0;
bio(386).dim=[1,1];
bio(386).sigWidth=1;
bio(386).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge_k';
bio(386).ndims=2;
bio(386).size=[];
bio(386).isStruct=false;

bio(387).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/ErrProcessing2/Merge1';
bio(387).sigName='';
bio(387).portIdx=0;
bio(387).dim=[1,1];
bio(387).sigWidth=1;
bio(387).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge1_k';
bio(387).ndims=2;
bio(387).size=[];
bio(387).isStruct=false;

bio(388).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/ErrProcessing2/Merge2';
bio(388).sigName='';
bio(388).portIdx=0;
bio(388).dim=[1,1];
bio(388).sigWidth=1;
bio(388).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge2_o';
bio(388).ndims=2;
bio(388).size=[];
bio(388).isStruct=false;

bio(389).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing/If Action Subsystem/In1';
bio(389).sigName='';
bio(389).portIdx=0;
bio(389).dim=[1,1];
bio(389).sigWidth=1;
bio(389).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge1_h';
bio(389).ndims=2;
bio(389).size=[];
bio(389).isStruct=false;

bio(390).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing/If Action Subsystem/Constant';
bio(390).sigName='';
bio(390).portIdx=0;
bio(390).dim=[1,1];
bio(390).sigWidth=1;
bio(390).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge_p';
bio(390).ndims=2;
bio(390).size=[];
bio(390).isStruct=false;

bio(391).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing/If Action Subsystem/Constant1';
bio(391).sigName='';
bio(391).portIdx=0;
bio(391).dim=[1,1];
bio(391).sigWidth=1;
bio(391).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge2_m';
bio(391).ndims=2;
bio(391).size=[];
bio(391).isStruct=false;

bio(392).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing/If Action Subsystem1/In1';
bio(392).sigName='';
bio(392).portIdx=0;
bio(392).dim=[1,1];
bio(392).sigWidth=1;
bio(392).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge_p';
bio(392).ndims=2;
bio(392).size=[];
bio(392).isStruct=false;

bio(393).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing/If Action Subsystem1/Constant';
bio(393).sigName='';
bio(393).portIdx=0;
bio(393).dim=[1,1];
bio(393).sigWidth=1;
bio(393).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge1_h';
bio(393).ndims=2;
bio(393).size=[];
bio(393).isStruct=false;

bio(394).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing/If Action Subsystem1/Constant1';
bio(394).sigName='';
bio(394).portIdx=0;
bio(394).dim=[1,1];
bio(394).sigWidth=1;
bio(394).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge2_m';
bio(394).ndims=2;
bio(394).size=[];
bio(394).isStruct=false;

bio(395).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing/If Action Subsystem2/In1';
bio(395).sigName='';
bio(395).portIdx=0;
bio(395).dim=[1,1];
bio(395).sigWidth=1;
bio(395).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge_p';
bio(395).ndims=2;
bio(395).size=[];
bio(395).isStruct=false;

bio(396).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing/If Action Subsystem2/Constant1';
bio(396).sigName='';
bio(396).portIdx=0;
bio(396).dim=[1,1];
bio(396).sigWidth=1;
bio(396).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge2_m';
bio(396).ndims=2;
bio(396).size=[];
bio(396).isStruct=false;

bio(397).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing/If Action Subsystem2/Add';
bio(397).sigName='';
bio(397).portIdx=0;
bio(397).dim=[1,1];
bio(397).sigWidth=1;
bio(397).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge1_h';
bio(397).ndims=2;
bio(397).size=[];
bio(397).isStruct=false;

bio(398).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing1/If Action Subsystem/In1';
bio(398).sigName='';
bio(398).portIdx=0;
bio(398).dim=[1,1];
bio(398).sigWidth=1;
bio(398).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge1_b';
bio(398).ndims=2;
bio(398).size=[];
bio(398).isStruct=false;

bio(399).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing1/If Action Subsystem/Constant';
bio(399).sigName='';
bio(399).portIdx=0;
bio(399).dim=[1,1];
bio(399).sigWidth=1;
bio(399).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge_c';
bio(399).ndims=2;
bio(399).size=[];
bio(399).isStruct=false;

bio(400).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing1/If Action Subsystem/Constant1';
bio(400).sigName='';
bio(400).portIdx=0;
bio(400).dim=[1,1];
bio(400).sigWidth=1;
bio(400).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge2_mc';
bio(400).ndims=2;
bio(400).size=[];
bio(400).isStruct=false;

bio(401).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing1/If Action Subsystem1/In1';
bio(401).sigName='';
bio(401).portIdx=0;
bio(401).dim=[1,1];
bio(401).sigWidth=1;
bio(401).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge_c';
bio(401).ndims=2;
bio(401).size=[];
bio(401).isStruct=false;

bio(402).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing1/If Action Subsystem1/Constant';
bio(402).sigName='';
bio(402).portIdx=0;
bio(402).dim=[1,1];
bio(402).sigWidth=1;
bio(402).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge1_b';
bio(402).ndims=2;
bio(402).size=[];
bio(402).isStruct=false;

bio(403).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing1/If Action Subsystem1/Constant1';
bio(403).sigName='';
bio(403).portIdx=0;
bio(403).dim=[1,1];
bio(403).sigWidth=1;
bio(403).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge2_mc';
bio(403).ndims=2;
bio(403).size=[];
bio(403).isStruct=false;

bio(404).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing1/If Action Subsystem2/In1';
bio(404).sigName='';
bio(404).portIdx=0;
bio(404).dim=[1,1];
bio(404).sigWidth=1;
bio(404).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge_c';
bio(404).ndims=2;
bio(404).size=[];
bio(404).isStruct=false;

bio(405).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing1/If Action Subsystem2/Constant1';
bio(405).sigName='';
bio(405).portIdx=0;
bio(405).dim=[1,1];
bio(405).sigWidth=1;
bio(405).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge2_mc';
bio(405).ndims=2;
bio(405).size=[];
bio(405).isStruct=false;

bio(406).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing1/If Action Subsystem2/Add';
bio(406).sigName='';
bio(406).portIdx=0;
bio(406).dim=[1,1];
bio(406).sigWidth=1;
bio(406).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge1_b';
bio(406).ndims=2;
bio(406).size=[];
bio(406).isStruct=false;

bio(407).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing2/If Action Subsystem/In1';
bio(407).sigName='';
bio(407).portIdx=0;
bio(407).dim=[1,1];
bio(407).sigWidth=1;
bio(407).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge1_d';
bio(407).ndims=2;
bio(407).size=[];
bio(407).isStruct=false;

bio(408).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing2/If Action Subsystem/Constant';
bio(408).sigName='';
bio(408).portIdx=0;
bio(408).dim=[1,1];
bio(408).sigWidth=1;
bio(408).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge_kt';
bio(408).ndims=2;
bio(408).size=[];
bio(408).isStruct=false;

bio(409).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing2/If Action Subsystem/Constant1';
bio(409).sigName='';
bio(409).portIdx=0;
bio(409).dim=[1,1];
bio(409).sigWidth=1;
bio(409).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge2_a';
bio(409).ndims=2;
bio(409).size=[];
bio(409).isStruct=false;

bio(410).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing2/If Action Subsystem1/In1';
bio(410).sigName='';
bio(410).portIdx=0;
bio(410).dim=[1,1];
bio(410).sigWidth=1;
bio(410).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge_kt';
bio(410).ndims=2;
bio(410).size=[];
bio(410).isStruct=false;

bio(411).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing2/If Action Subsystem1/Constant';
bio(411).sigName='';
bio(411).portIdx=0;
bio(411).dim=[1,1];
bio(411).sigWidth=1;
bio(411).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge1_d';
bio(411).ndims=2;
bio(411).size=[];
bio(411).isStruct=false;

bio(412).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing2/If Action Subsystem1/Constant1';
bio(412).sigName='';
bio(412).portIdx=0;
bio(412).dim=[1,1];
bio(412).sigWidth=1;
bio(412).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge2_a';
bio(412).ndims=2;
bio(412).size=[];
bio(412).isStruct=false;

bio(413).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing2/If Action Subsystem2/In1';
bio(413).sigName='';
bio(413).portIdx=0;
bio(413).dim=[1,1];
bio(413).sigWidth=1;
bio(413).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge_kt';
bio(413).ndims=2;
bio(413).size=[];
bio(413).isStruct=false;

bio(414).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing2/If Action Subsystem2/Constant1';
bio(414).sigName='';
bio(414).portIdx=0;
bio(414).dim=[1,1];
bio(414).sigWidth=1;
bio(414).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge2_a';
bio(414).ndims=2;
bio(414).size=[];
bio(414).isStruct=false;

bio(415).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing2/If Action Subsystem2/Add';
bio(415).sigName='';
bio(415).portIdx=0;
bio(415).dim=[1,1];
bio(415).sigWidth=1;
bio(415).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge1_d';
bio(415).ndims=2;
bio(415).size=[];
bio(415).isStruct=false;

bio(416).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing3/If Action Subsystem/In1';
bio(416).sigName='';
bio(416).portIdx=0;
bio(416).dim=[1,1];
bio(416).sigWidth=1;
bio(416).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge1_du';
bio(416).ndims=2;
bio(416).size=[];
bio(416).isStruct=false;

bio(417).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing3/If Action Subsystem/Constant';
bio(417).sigName='';
bio(417).portIdx=0;
bio(417).dim=[1,1];
bio(417).sigWidth=1;
bio(417).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge_a';
bio(417).ndims=2;
bio(417).size=[];
bio(417).isStruct=false;

bio(418).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing3/If Action Subsystem/Constant1';
bio(418).sigName='';
bio(418).portIdx=0;
bio(418).dim=[1,1];
bio(418).sigWidth=1;
bio(418).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge2_g';
bio(418).ndims=2;
bio(418).size=[];
bio(418).isStruct=false;

bio(419).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing3/If Action Subsystem1/In1';
bio(419).sigName='';
bio(419).portIdx=0;
bio(419).dim=[1,1];
bio(419).sigWidth=1;
bio(419).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge_a';
bio(419).ndims=2;
bio(419).size=[];
bio(419).isStruct=false;

bio(420).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing3/If Action Subsystem1/Constant';
bio(420).sigName='';
bio(420).portIdx=0;
bio(420).dim=[1,1];
bio(420).sigWidth=1;
bio(420).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge1_du';
bio(420).ndims=2;
bio(420).size=[];
bio(420).isStruct=false;

bio(421).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing3/If Action Subsystem1/Constant1';
bio(421).sigName='';
bio(421).portIdx=0;
bio(421).dim=[1,1];
bio(421).sigWidth=1;
bio(421).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge2_g';
bio(421).ndims=2;
bio(421).size=[];
bio(421).isStruct=false;

bio(422).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing3/If Action Subsystem2/In1';
bio(422).sigName='';
bio(422).portIdx=0;
bio(422).dim=[1,1];
bio(422).sigWidth=1;
bio(422).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge_a';
bio(422).ndims=2;
bio(422).size=[];
bio(422).isStruct=false;

bio(423).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing3/If Action Subsystem2/Constant1';
bio(423).sigName='';
bio(423).portIdx=0;
bio(423).dim=[1,1];
bio(423).sigWidth=1;
bio(423).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge2_g';
bio(423).ndims=2;
bio(423).size=[];
bio(423).isStruct=false;

bio(424).blkName='InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing3/If Action Subsystem2/Add';
bio(424).sigName='';
bio(424).portIdx=0;
bio(424).dim=[1,1];
bio(424).sigWidth=1;
bio(424).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge1_du';
bio(424).ndims=2;
bio(424).size=[];
bio(424).isStruct=false;

bio(425).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Control/Angle_gain';
bio(425).sigName='';
bio(425).portIdx=0;
bio(425).dim=[1,1];
bio(425).sigWidth=1;
bio(425).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Angle_gain';
bio(425).ndims=2;
bio(425).size=[];
bio(425).isStruct=false;

bio(426).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Control/Gain';
bio(426).sigName='';
bio(426).portIdx=0;
bio(426).dim=[1,1];
bio(426).sigWidth=1;
bio(426).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Gain_f';
bio(426).ndims=2;
bio(426).size=[];
bio(426).isStruct=false;

bio(427).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Control/Gain1';
bio(427).sigName='';
bio(427).portIdx=0;
bio(427).dim=[1,1];
bio(427).sigWidth=1;
bio(427).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Gain1_d';
bio(427).ndims=2;
bio(427).size=[];
bio(427).isStruct=false;

bio(428).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Control/Product1';
bio(428).sigName='';
bio(428).portIdx=0;
bio(428).dim=[1,1];
bio(428).sigWidth=1;
bio(428).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Product1';
bio(428).ndims=2;
bio(428).size=[];
bio(428).isStruct=false;

bio(429).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Control/Product2';
bio(429).sigName='';
bio(429).portIdx=0;
bio(429).dim=[1,1];
bio(429).sigWidth=1;
bio(429).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Product2_k';
bio(429).ndims=2;
bio(429).size=[];
bio(429).isStruct=false;

bio(430).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Control/SAS_Saturation1';
bio(430).sigName='';
bio(430).portIdx=0;
bio(430).dim=[1,1];
bio(430).sigWidth=1;
bio(430).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.SAS_Saturation1';
bio(430).ndims=2;
bio(430).size=[];
bio(430).isStruct=false;

bio(431).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Control/SAS_Saturation1_old';
bio(431).sigName='';
bio(431).portIdx=0;
bio(431).dim=[1,1];
bio(431).sigWidth=1;
bio(431).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.SAS_Saturation1_old';
bio(431).ndims=2;
bio(431).size=[];
bio(431).isStruct=false;

bio(432).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Control/SAS_Saturation2';
bio(432).sigName='SAS_sat2';
bio(432).portIdx=0;
bio(432).dim=[1,1];
bio(432).sigWidth=1;
bio(432).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.SAS_sat2_l';
bio(432).ndims=2;
bio(432).size=[];
bio(432).isStruct=false;

bio(433).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Control/SAS_Saturation2_old';
bio(433).sigName='SAS_sat2';
bio(433).portIdx=0;
bio(433).dim=[1,1];
bio(433).sigWidth=1;
bio(433).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.SAS_sat2';
bio(433).ndims=2;
bio(433).size=[];
bio(433).isStruct=false;

bio(434).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Control/Add';
bio(434).sigName='';
bio(434).portIdx=0;
bio(434).dim=[1,1];
bio(434).sigWidth=1;
bio(434).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Add_i';
bio(434).ndims=2;
bio(434).size=[];
bio(434).isStruct=false;

bio(435).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Control/Sum';
bio(435).sigName='';
bio(435).portIdx=0;
bio(435).dim=[1,1];
bio(435).sigWidth=1;
bio(435).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Sum_h';
bio(435).ndims=2;
bio(435).size=[];
bio(435).isStruct=false;

bio(436).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Control/Sum1';
bio(436).sigName='';
bio(436).portIdx=0;
bio(436).dim=[1,1];
bio(436).sigWidth=1;
bio(436).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Sum1_d';
bio(436).ndims=2;
bio(436).size=[];
bio(436).isStruct=false;

bio(437).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Control/Sum2';
bio(437).sigName='';
bio(437).portIdx=0;
bio(437).dim=[1,1];
bio(437).sigWidth=1;
bio(437).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Sum2';
bio(437).ndims=2;
bio(437).size=[];
bio(437).isStruct=false;

bio(438).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Control/Switch';
bio(438).sigName='';
bio(438).portIdx=0;
bio(438).dim=[1,1];
bio(438).sigWidth=1;
bio(438).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Switch_j';
bio(438).ndims=2;
bio(438).size=[];
bio(438).isStruct=false;

bio(439).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Control/Switch1';
bio(439).sigName='';
bio(439).portIdx=0;
bio(439).dim=[1,1];
bio(439).sigWidth=1;
bio(439).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Switch1_l';
bio(439).ndims=2;
bio(439).size=[];
bio(439).isStruct=false;

bio(440).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Control/Integer Delay';
bio(440).sigName='';
bio(440).portIdx=0;
bio(440).dim=[1,1];
bio(440).sigWidth=1;
bio(440).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.IntegerDelay';
bio(440).ndims=2;
bio(440).size=[];
bio(440).isStruct=false;

bio(441).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Control/Integer Delay1';
bio(441).sigName='';
bio(441).portIdx=0;
bio(441).dim=[1,1];
bio(441).sigWidth=1;
bio(441).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.IntegerDelay1';
bio(441).ndims=2;
bio(441).size=[];
bio(441).isStruct=false;

bio(442).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Control/Integer Delay2';
bio(442).sigName='';
bio(442).portIdx=0;
bio(442).dim=[1,1];
bio(442).sigWidth=1;
bio(442).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.IntegerDelay2';
bio(442).ndims=2;
bio(442).size=[];
bio(442).isStruct=false;

bio(443).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Speed_Control/Discrete-Time Integrator';
bio(443).sigName='';
bio(443).portIdx=0;
bio(443).dim=[1,1];
bio(443).sigWidth=1;
bio(443).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.DiscreteTimeIntegrator';
bio(443).ndims=2;
bio(443).size=[];
bio(443).isStruct=false;

bio(444).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Speed_Control/Gain1';
bio(444).sigName='';
bio(444).portIdx=0;
bio(444).dim=[1,1];
bio(444).sigWidth=1;
bio(444).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Gain1';
bio(444).ndims=2;
bio(444).size=[];
bio(444).isStruct=false;

bio(445).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Speed_Control/Gain2';
bio(445).sigName='';
bio(445).portIdx=0;
bio(445).dim=[1,1];
bio(445).sigWidth=1;
bio(445).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Gain2';
bio(445).ndims=2;
bio(445).size=[];
bio(445).isStruct=false;

bio(446).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Speed_Control/Gain3';
bio(446).sigName='';
bio(446).portIdx=0;
bio(446).dim=[1,1];
bio(446).sigWidth=1;
bio(446).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Gain3';
bio(446).ndims=2;
bio(446).size=[];
bio(446).isStruct=false;

bio(447).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Speed_Control/Product5';
bio(447).sigName='P_value';
bio(447).portIdx=0;
bio(447).dim=[1,1];
bio(447).sigWidth=1;
bio(447).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.P_value';
bio(447).ndims=2;
bio(447).size=[];
bio(447).isStruct=false;

bio(448).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Speed_Control/Product7';
bio(448).sigName='I_value';
bio(448).portIdx=0;
bio(448).dim=[1,1];
bio(448).sigWidth=1;
bio(448).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.I_value';
bio(448).ndims=2;
bio(448).size=[];
bio(448).isStruct=false;

bio(449).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Speed_Control/SASSpeedSat1';
bio(449).sigName='SASSpeed_sat1';
bio(449).portIdx=0;
bio(449).dim=[1,1];
bio(449).sigWidth=1;
bio(449).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.SASSpeed_sat1_c';
bio(449).ndims=2;
bio(449).size=[];
bio(449).isStruct=false;

bio(450).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Speed_Control/SASSpeedSat1_old';
bio(450).sigName='SASSpeed_sat1';
bio(450).portIdx=0;
bio(450).dim=[1,1];
bio(450).sigWidth=1;
bio(450).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.SASSpeed_sat1';
bio(450).ndims=2;
bio(450).size=[];
bio(450).isStruct=false;

bio(451).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Speed_Control/SASSpeedSat2';
bio(451).sigName='SASSpeed_sat2';
bio(451).portIdx=0;
bio(451).dim=[1,1];
bio(451).sigWidth=1;
bio(451).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.SASSpeed_sat2';
bio(451).ndims=2;
bio(451).size=[];
bio(451).isStruct=false;

bio(452).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Speed_Control/SASSpeedSat2_old';
bio(452).sigName='';
bio(452).portIdx=0;
bio(452).dim=[1,1];
bio(452).sigWidth=1;
bio(452).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.SASSpeedSat2_old';
bio(452).ndims=2;
bio(452).size=[];
bio(452).isStruct=false;

bio(453).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Speed_Control/Sum3';
bio(453).sigName='';
bio(453).portIdx=0;
bio(453).dim=[1,1];
bio(453).sigWidth=1;
bio(453).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Sum3';
bio(453).ndims=2;
bio(453).size=[];
bio(453).isStruct=false;

bio(454).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Speed_Control/Switch';
bio(454).sigName='';
bio(454).portIdx=0;
bio(454).dim=[1,1];
bio(454).sigWidth=1;
bio(454).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Switch_b';
bio(454).ndims=2;
bio(454).size=[];
bio(454).isStruct=false;

bio(455).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/Tx_ADAS_data/Checksum_NEW/Shift Arithmetic1';
bio(455).sigName='Active_TOI_Low';
bio(455).portIdx=0;
bio(455).dim=[1,1];
bio(455).sigWidth=1;
bio(455).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Active_TOI_Low';
bio(455).ndims=2;
bio(455).size=[];
bio(455).isStruct=false;

bio(456).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/Tx_ADAS_data/Checksum_NEW/Shift Arithmetic2';
bio(456).sigName='TOI_Fault_Low';
bio(456).portIdx=0;
bio(456).dim=[1,1];
bio(456).sigWidth=1;
bio(456).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.TOI_Fault_Low';
bio(456).ndims=2;
bio(456).size=[];
bio(456).isStruct=false;

bio(457).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/Tx_ADAS_data/Checksum_NEW/Shift Arithmetic3';
bio(457).sigName='StrTqRequest_High';
bio(457).portIdx=0;
bio(457).dim=[1,1];
bio(457).sigWidth=1;
bio(457).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.StrTqRequest_High_a';
bio(457).ndims=2;
bio(457).size=[];
bio(457).isStruct=false;

bio(458).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/Tx_ADAS_data/Checksum_NEW/Shift Arithmetic4';
bio(458).sigName='MsgCounter_Low';
bio(458).portIdx=0;
bio(458).dim=[1,1];
bio(458).sigWidth=1;
bio(458).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.MsgCounter_Low_l';
bio(458).ndims=2;
bio(458).size=[];
bio(458).isStruct=false;

bio(459).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/Tx_ADAS_data/Checksum_NEW/Shift Arithmetic5';
bio(459).sigName='MsgCounter_High';
bio(459).portIdx=0;
bio(459).dim=[1,1];
bio(459).sigWidth=1;
bio(459).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.MsgCounter_High_m';
bio(459).ndims=2;
bio(459).size=[];
bio(459).isStruct=false;

bio(460).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/Tx_ADAS_data/Checksum_NEW/Data Type Conversion1';
bio(460).sigName='';
bio(460).portIdx=0;
bio(460).dim=[1,1];
bio(460).sigWidth=1;
bio(460).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.DataTypeConversion1';
bio(460).ndims=2;
bio(460).size=[];
bio(460).isStruct=false;

bio(461).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/Tx_ADAS_data/Checksum_NEW/Data Type Conversion2';
bio(461).sigName='CONST_TNINETYTWO';
bio(461).portIdx=0;
bio(461).dim=[1,1];
bio(461).sigWidth=1;
bio(461).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.CONST_TNINETYTWO';
bio(461).ndims=2;
bio(461).size=[];
bio(461).isStruct=false;

bio(462).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/Tx_ADAS_data/Checksum_NEW/Data Type Conversion3';
bio(462).sigName='Active_TOI';
bio(462).portIdx=0;
bio(462).dim=[1,1];
bio(462).sigWidth=1;
bio(462).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Active_TOI';
bio(462).ndims=2;
bio(462).size=[];
bio(462).isStruct=false;

bio(463).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/Tx_ADAS_data/Checksum_NEW/Data Type Conversion4';
bio(463).sigName='TOI_Fault';
bio(463).portIdx=0;
bio(463).dim=[1,1];
bio(463).sigWidth=1;
bio(463).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.TOI_Fault';
bio(463).ndims=2;
bio(463).size=[];
bio(463).isStruct=false;

bio(464).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/Tx_ADAS_data/Checksum_NEW/Data Type Conversion5';
bio(464).sigName='';
bio(464).portIdx=0;
bio(464).dim=[1,1];
bio(464).sigWidth=1;
bio(464).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.DataTypeConversion5';
bio(464).ndims=2;
bio(464).size=[];
bio(464).isStruct=false;

bio(465).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/Tx_ADAS_data/Checksum_NEW/Data Type Conversion6';
bio(465).sigName='';
bio(465).portIdx=0;
bio(465).dim=[1,1];
bio(465).sigWidth=1;
bio(465).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.DataTypeConversion6';
bio(465).ndims=2;
bio(465).size=[];
bio(465).isStruct=false;

bio(466).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/Tx_ADAS_data/Checksum_NEW/Data Type Conversion7';
bio(466).sigName='';
bio(466).portIdx=0;
bio(466).dim=[1,1];
bio(466).sigWidth=1;
bio(466).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.DataTypeConversion7';
bio(466).ndims=2;
bio(466).size=[];
bio(466).isStruct=false;

bio(467).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/Tx_ADAS_data/Checksum_NEW/Data Type Conversion8';
bio(467).sigName='';
bio(467).portIdx=0;
bio(467).dim=[1,1];
bio(467).sigWidth=1;
bio(467).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.DataTypeConversion8';
bio(467).ndims=2;
bio(467).size=[];
bio(467).isStruct=false;

bio(468).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/Tx_ADAS_data/Checksum_NEW/Gain';
bio(468).sigName='';
bio(468).portIdx=0;
bio(468).dim=[1,1];
bio(468).sigWidth=1;
bio(468).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Gain';
bio(468).ndims=2;
bio(468).size=[];
bio(468).isStruct=false;

bio(469).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/Tx_ADAS_data/Checksum_NEW/Bitwise Operator1';
bio(469).sigName='StrTqRequest_High';
bio(469).portIdx=0;
bio(469).dim=[1,1];
bio(469).sigWidth=1;
bio(469).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.StrTqRequest_High';
bio(469).ndims=2;
bio(469).size=[];
bio(469).isStruct=false;

bio(470).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/Tx_ADAS_data/Checksum_NEW/Bitwise Operator2';
bio(470).sigName='Checksum_Out';
bio(470).portIdx=0;
bio(470).dim=[1,1];
bio(470).sigWidth=1;
bio(470).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Checksum_Out_o';
bio(470).ndims=2;
bio(470).size=[];
bio(470).isStruct=false;

bio(471).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/Tx_ADAS_data/Checksum_NEW/Bitwise Operator3';
bio(471).sigName='';
bio(471).portIdx=0;
bio(471).dim=[1,1];
bio(471).sigWidth=1;
bio(471).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.BitwiseOperator3';
bio(471).ndims=2;
bio(471).size=[];
bio(471).isStruct=false;

bio(472).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/Tx_ADAS_data/Checksum_NEW/Bitwise Operator5';
bio(472).sigName='MsgCounter_Low';
bio(472).portIdx=0;
bio(472).dim=[1,1];
bio(472).sigWidth=1;
bio(472).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.MsgCounter_Low';
bio(472).ndims=2;
bio(472).size=[];
bio(472).isStruct=false;

bio(473).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/Tx_ADAS_data/Checksum_NEW/Bitwise Operator6';
bio(473).sigName='MsgCounter_High';
bio(473).portIdx=0;
bio(473).dim=[1,1];
bio(473).sigWidth=1;
bio(473).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.MsgCounter_High';
bio(473).ndims=2;
bio(473).size=[];
bio(473).isStruct=false;

bio(474).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/Tx_ADAS_data/Checksum_NEW/Add';
bio(474).sigName='';
bio(474).portIdx=0;
bio(474).dim=[1,1];
bio(474).sigWidth=1;
bio(474).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Add_c';
bio(474).ndims=2;
bio(474).size=[];
bio(474).isStruct=false;

bio(475).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/Tx_ADAS_data/Checksum_NEW/Add1';
bio(475).sigName='';
bio(475).portIdx=0;
bio(475).dim=[1,1];
bio(475).sigWidth=1;
bio(475).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Add1_e';
bio(475).ndims=2;
bio(475).size=[];
bio(475).isStruct=false;

bio(476).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/Tx_ADAS_data/Checksum_NEW/Add2';
bio(476).sigName='';
bio(476).portIdx=0;
bio(476).dim=[1,1];
bio(476).sigWidth=1;
bio(476).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Add2_j';
bio(476).ndims=2;
bio(476).size=[];
bio(476).isStruct=false;

bio(477).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/EMS1Processing/EMS1 Processing/ErrProcessing/If Action Subsystem/In1';
bio(477).sigName='';
bio(477).portIdx=0;
bio(477).dim=[1,1];
bio(477).sigWidth=1;
bio(477).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge1';
bio(477).ndims=2;
bio(477).size=[];
bio(477).isStruct=false;

bio(478).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/EMS1Processing/EMS1 Processing/ErrProcessing/If Action Subsystem/Constant';
bio(478).sigName='';
bio(478).portIdx=0;
bio(478).dim=[1,1];
bio(478).sigWidth=1;
bio(478).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge';
bio(478).ndims=2;
bio(478).size=[];
bio(478).isStruct=false;

bio(479).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/EMS1Processing/EMS1 Processing/ErrProcessing/If Action Subsystem/Constant1';
bio(479).sigName='';
bio(479).portIdx=0;
bio(479).dim=[1,1];
bio(479).sigWidth=1;
bio(479).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge2';
bio(479).ndims=2;
bio(479).size=[];
bio(479).isStruct=false;

bio(480).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/EMS1Processing/EMS1 Processing/ErrProcessing/If Action Subsystem1/In1';
bio(480).sigName='';
bio(480).portIdx=0;
bio(480).dim=[1,1];
bio(480).sigWidth=1;
bio(480).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge';
bio(480).ndims=2;
bio(480).size=[];
bio(480).isStruct=false;

bio(481).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/EMS1Processing/EMS1 Processing/ErrProcessing/If Action Subsystem1/Constant';
bio(481).sigName='';
bio(481).portIdx=0;
bio(481).dim=[1,1];
bio(481).sigWidth=1;
bio(481).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge1';
bio(481).ndims=2;
bio(481).size=[];
bio(481).isStruct=false;

bio(482).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/EMS1Processing/EMS1 Processing/ErrProcessing/If Action Subsystem1/Constant1';
bio(482).sigName='';
bio(482).portIdx=0;
bio(482).dim=[1,1];
bio(482).sigWidth=1;
bio(482).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge2';
bio(482).ndims=2;
bio(482).size=[];
bio(482).isStruct=false;

bio(483).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/EMS1Processing/EMS1 Processing/ErrProcessing/If Action Subsystem2/In1';
bio(483).sigName='';
bio(483).portIdx=0;
bio(483).dim=[1,1];
bio(483).sigWidth=1;
bio(483).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge';
bio(483).ndims=2;
bio(483).size=[];
bio(483).isStruct=false;

bio(484).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/EMS1Processing/EMS1 Processing/ErrProcessing/If Action Subsystem2/Constant1';
bio(484).sigName='';
bio(484).portIdx=0;
bio(484).dim=[1,1];
bio(484).sigWidth=1;
bio(484).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge2';
bio(484).ndims=2;
bio(484).size=[];
bio(484).isStruct=false;

bio(485).blkName='InputProcessing/For Iterator Subsystem/EMS1Processing/EMS1Processing/EMS1 Processing/ErrProcessing/If Action Subsystem2/Add';
bio(485).sigName='';
bio(485).portIdx=0;
bio(485).dim=[1,1];
bio(485).sigWidth=1;
bio(485).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge1';
bio(485).ndims=2;
bio(485).size=[];
bio(485).isStruct=false;

bio(486).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/ErrProcessing1/If Action Subsystem/In1';
bio(486).sigName='';
bio(486).portIdx=0;
bio(486).dim=[1,1];
bio(486).sigWidth=1;
bio(486).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge1_i';
bio(486).ndims=2;
bio(486).size=[];
bio(486).isStruct=false;

bio(487).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/ErrProcessing1/If Action Subsystem/Constant';
bio(487).sigName='';
bio(487).portIdx=0;
bio(487).dim=[1,1];
bio(487).sigWidth=1;
bio(487).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge_b';
bio(487).ndims=2;
bio(487).size=[];
bio(487).isStruct=false;

bio(488).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/ErrProcessing1/If Action Subsystem/Constant1';
bio(488).sigName='';
bio(488).portIdx=0;
bio(488).dim=[1,1];
bio(488).sigWidth=1;
bio(488).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge2_k';
bio(488).ndims=2;
bio(488).size=[];
bio(488).isStruct=false;

bio(489).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/ErrProcessing1/If Action Subsystem1/In1';
bio(489).sigName='';
bio(489).portIdx=0;
bio(489).dim=[1,1];
bio(489).sigWidth=1;
bio(489).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge_b';
bio(489).ndims=2;
bio(489).size=[];
bio(489).isStruct=false;

bio(490).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/ErrProcessing1/If Action Subsystem1/Constant';
bio(490).sigName='';
bio(490).portIdx=0;
bio(490).dim=[1,1];
bio(490).sigWidth=1;
bio(490).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge1_i';
bio(490).ndims=2;
bio(490).size=[];
bio(490).isStruct=false;

bio(491).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/ErrProcessing1/If Action Subsystem1/Constant1';
bio(491).sigName='';
bio(491).portIdx=0;
bio(491).dim=[1,1];
bio(491).sigWidth=1;
bio(491).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge2_k';
bio(491).ndims=2;
bio(491).size=[];
bio(491).isStruct=false;

bio(492).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/ErrProcessing1/If Action Subsystem2/In1';
bio(492).sigName='';
bio(492).portIdx=0;
bio(492).dim=[1,1];
bio(492).sigWidth=1;
bio(492).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge_b';
bio(492).ndims=2;
bio(492).size=[];
bio(492).isStruct=false;

bio(493).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/ErrProcessing1/If Action Subsystem2/Constant1';
bio(493).sigName='';
bio(493).portIdx=0;
bio(493).dim=[1,1];
bio(493).sigWidth=1;
bio(493).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge2_k';
bio(493).ndims=2;
bio(493).size=[];
bio(493).isStruct=false;

bio(494).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/ErrProcessing1/If Action Subsystem2/Add';
bio(494).sigName='';
bio(494).portIdx=0;
bio(494).dim=[1,1];
bio(494).sigWidth=1;
bio(494).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge1_i';
bio(494).ndims=2;
bio(494).size=[];
bio(494).isStruct=false;

bio(495).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/ErrProcessing2/If Action Subsystem/In1';
bio(495).sigName='';
bio(495).portIdx=0;
bio(495).dim=[1,1];
bio(495).sigWidth=1;
bio(495).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge1_k';
bio(495).ndims=2;
bio(495).size=[];
bio(495).isStruct=false;

bio(496).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/ErrProcessing2/If Action Subsystem/Constant';
bio(496).sigName='';
bio(496).portIdx=0;
bio(496).dim=[1,1];
bio(496).sigWidth=1;
bio(496).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge_k';
bio(496).ndims=2;
bio(496).size=[];
bio(496).isStruct=false;

bio(497).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/ErrProcessing2/If Action Subsystem/Constant1';
bio(497).sigName='';
bio(497).portIdx=0;
bio(497).dim=[1,1];
bio(497).sigWidth=1;
bio(497).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge2_o';
bio(497).ndims=2;
bio(497).size=[];
bio(497).isStruct=false;

bio(498).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/ErrProcessing2/If Action Subsystem1/In1';
bio(498).sigName='';
bio(498).portIdx=0;
bio(498).dim=[1,1];
bio(498).sigWidth=1;
bio(498).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge_k';
bio(498).ndims=2;
bio(498).size=[];
bio(498).isStruct=false;

bio(499).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/ErrProcessing2/If Action Subsystem1/Constant';
bio(499).sigName='';
bio(499).portIdx=0;
bio(499).dim=[1,1];
bio(499).sigWidth=1;
bio(499).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge1_k';
bio(499).ndims=2;
bio(499).size=[];
bio(499).isStruct=false;

bio(500).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/ErrProcessing2/If Action Subsystem1/Constant1';
bio(500).sigName='';
bio(500).portIdx=0;
bio(500).dim=[1,1];
bio(500).sigWidth=1;
bio(500).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge2_o';
bio(500).ndims=2;
bio(500).size=[];
bio(500).isStruct=false;

bio(501).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/ErrProcessing2/If Action Subsystem2/In1';
bio(501).sigName='';
bio(501).portIdx=0;
bio(501).dim=[1,1];
bio(501).sigWidth=1;
bio(501).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge_k';
bio(501).ndims=2;
bio(501).size=[];
bio(501).isStruct=false;

bio(502).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/ErrProcessing2/If Action Subsystem2/Constant1';
bio(502).sigName='';
bio(502).portIdx=0;
bio(502).dim=[1,1];
bio(502).sigWidth=1;
bio(502).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge2_o';
bio(502).ndims=2;
bio(502).size=[];
bio(502).isStruct=false;

bio(503).blkName='InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/ErrProcessing2/If Action Subsystem2/Add';
bio(503).sigName='';
bio(503).portIdx=0;
bio(503).dim=[1,1];
bio(503).sigWidth=1;
bio(503).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Merge1_k';
bio(503).ndims=2;
bio(503).size=[];
bio(503).isStruct=false;

bio(504).blkName='OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Speed_Control/Compare To Zero/Compare';
bio(504).sigName='';
bio(504).portIdx=0;
bio(504).dim=[1,1];
bio(504).sigWidth=1;
bio(504).sigAddress='&LaneMergingSim_ControllerWithVirtualHuman_B.Compare_c';
bio(504).ndims=2;
bio(504).size=[];
bio(504).isStruct=false;

function len = getlenBIO
len = 504;

