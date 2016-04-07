function pt=LaneMergingSim_ControllerWithVirtualHumanpt
pt = [];
pt(1).blockname = 'ACC_State';
pt(1).paramname = 'Value';
pt(1).class     = 'scalar';
pt(1).nrows     = 1;
pt(1).ncols     = 1;
pt(1).subsource = 'SS_DOUBLE';
pt(1).ndims     = '2';
pt(1).size      = '[]';
pt(getlenPT) = pt(1);

pt(2).blockname = 'DriverOverrideReset';
pt(2).paramname = 'Value';
pt(2).class     = 'scalar';
pt(2).nrows     = 1;
pt(2).ncols     = 1;
pt(2).subsource = 'SS_DOUBLE';
pt(2).ndims     = '2';
pt(2).size      = '[]';

pt(3).blockname = 'Enable';
pt(3).paramname = 'Value';
pt(3).class     = 'scalar';
pt(3).nrows     = 1;
pt(3).ncols     = 1;
pt(3).subsource = 'SS_DOUBLE';
pt(3).ndims     = '2';
pt(3).size      = '[]';

pt(4).blockname = 'SPAS_Cmd';
pt(4).paramname = 'Value';
pt(4).class     = 'scalar';
pt(4).nrows     = 1;
pt(4).ncols     = 1;
pt(4).subsource = 'SS_DOUBLE';
pt(4).ndims     = '2';
pt(4).size      = '[]';

pt(5).blockname = 'SPAS_Ctrl';
pt(5).paramname = 'Value';
pt(5).class     = 'scalar';
pt(5).nrows     = 1;
pt(5).ncols     = 1;
pt(5).subsource = 'SS_DOUBLE';
pt(5).ndims     = '2';
pt(5).size      = '[]';

pt(6).blockname = 'delta_f';
pt(6).paramname = 'Value';
pt(6).class     = 'scalar';
pt(6).nrows     = 1;
pt(6).ncols     = 1;
pt(6).subsource = 'SS_DOUBLE';
pt(6).ndims     = '2';
pt(6).size      = '[]';

pt(7).blockname = 'enManSteer';
pt(7).paramname = 'Value';
pt(7).class     = 'scalar';
pt(7).nrows     = 1;
pt(7).ncols     = 1;
pt(7).subsource = 'SS_DOUBLE';
pt(7).ndims     = '2';
pt(7).size      = '[]';

pt(8).blockname = 'reactiveDist';
pt(8).paramname = 'Value';
pt(8).class     = 'scalar';
pt(8).nrows     = 1;
pt(8).ncols     = 1;
pt(8).subsource = 'SS_DOUBLE';
pt(8).ndims     = '2';
pt(8).size      = '[]';

pt(9).blockname = 'safeDist';
pt(9).paramname = 'Value';
pt(9).class     = 'scalar';
pt(9).nrows     = 1;
pt(9).ncols     = 1;
pt(9).subsource = 'SS_DOUBLE';
pt(9).ndims     = '2';
pt(9).size      = '[]';

pt(10).blockname = 'Gain';
pt(10).paramname = 'Gain';
pt(10).class     = 'scalar';
pt(10).nrows     = 1;
pt(10).ncols     = 1;
pt(10).subsource = 'SS_DOUBLE';
pt(10).ndims     = '2';
pt(10).size      = '[]';

pt(11).blockname = 'CAN_SETUP_1_2';
pt(11).paramname = 'P1';
pt(11).class     = 'scalar';
pt(11).nrows     = 1;
pt(11).ncols     = 1;
pt(11).subsource = 'SS_DOUBLE';
pt(11).ndims     = '2';
pt(11).size      = '[]';

pt(12).blockname = 'CAN_SETUP_1_2';
pt(12).paramname = 'P2';
pt(12).class     = 'scalar';
pt(12).nrows     = 1;
pt(12).ncols     = 1;
pt(12).subsource = 'SS_DOUBLE';
pt(12).ndims     = '2';
pt(12).size      = '[]';

pt(13).blockname = 'CAN_SETUP_1_2';
pt(13).paramname = 'P3';
pt(13).class     = 'vector';
pt(13).nrows     = 1;
pt(13).ncols     = 4;
pt(13).subsource = 'SS_DOUBLE';
pt(13).ndims     = '2';
pt(13).size      = '[]';

pt(14).blockname = 'CAN_SETUP_1_2';
pt(14).paramname = 'P4';
pt(14).class     = 'vector';
pt(14).nrows     = 1;
pt(14).ncols     = 4;
pt(14).subsource = 'SS_DOUBLE';
pt(14).ndims     = '2';
pt(14).size      = '[]';

pt(15).blockname = 'CAN_SETUP_1_2';
pt(15).paramname = 'P5';
pt(15).class     = 'vector';
pt(15).nrows     = 1;
pt(15).ncols     = 4;
pt(15).subsource = 'SS_DOUBLE';
pt(15).ndims     = '2';
pt(15).size      = '[]';

pt(16).blockname = 'CAN_SETUP_1_2';
pt(16).paramname = 'P6';
pt(16).class     = 'scalar';
pt(16).nrows     = 1;
pt(16).ncols     = 1;
pt(16).subsource = 'SS_DOUBLE';
pt(16).ndims     = '2';
pt(16).size      = '[]';

pt(17).blockname = 'CAN_SETUP_1_2';
pt(17).paramname = 'P7';
pt(17).class     = 'scalar';
pt(17).nrows     = 1;
pt(17).ncols     = 1;
pt(17).subsource = 'SS_DOUBLE';
pt(17).ndims     = '2';
pt(17).size      = '[]';

pt(18).blockname = 'CAN_SETUP_1_2';
pt(18).paramname = 'P8';
pt(18).class     = 'vector';
pt(18).nrows     = 1;
pt(18).ncols     = 4;
pt(18).subsource = 'SS_DOUBLE';
pt(18).ndims     = '2';
pt(18).size      = '[]';

pt(19).blockname = 'CAN_SETUP_1_2';
pt(19).paramname = 'P9';
pt(19).class     = 'vector';
pt(19).nrows     = 1;
pt(19).ncols     = 4;
pt(19).subsource = 'SS_DOUBLE';
pt(19).ndims     = '2';
pt(19).size      = '[]';

pt(20).blockname = 'CAN_SETUP_1_2';
pt(20).paramname = 'P10';
pt(20).class     = 'vector';
pt(20).nrows     = 1;
pt(20).ncols     = 4;
pt(20).subsource = 'SS_DOUBLE';
pt(20).ndims     = '2';
pt(20).size      = '[]';

pt(21).blockname = 'CAN_SETUP_1_2';
pt(21).paramname = 'P11';
pt(21).class     = 'vector';
pt(21).nrows     = 1;
pt(21).ncols     = 2;
pt(21).subsource = 'SS_DOUBLE';
pt(21).ndims     = '2';
pt(21).size      = '[]';

pt(22).blockname = 'CAN_SETUP_3_4';
pt(22).paramname = 'P1';
pt(22).class     = 'scalar';
pt(22).nrows     = 1;
pt(22).ncols     = 1;
pt(22).subsource = 'SS_DOUBLE';
pt(22).ndims     = '2';
pt(22).size      = '[]';

pt(23).blockname = 'CAN_SETUP_3_4';
pt(23).paramname = 'P2';
pt(23).class     = 'scalar';
pt(23).nrows     = 1;
pt(23).ncols     = 1;
pt(23).subsource = 'SS_DOUBLE';
pt(23).ndims     = '2';
pt(23).size      = '[]';

pt(24).blockname = 'CAN_SETUP_3_4';
pt(24).paramname = 'P3';
pt(24).class     = 'vector';
pt(24).nrows     = 1;
pt(24).ncols     = 4;
pt(24).subsource = 'SS_DOUBLE';
pt(24).ndims     = '2';
pt(24).size      = '[]';

pt(25).blockname = 'CAN_SETUP_3_4';
pt(25).paramname = 'P4';
pt(25).class     = 'vector';
pt(25).nrows     = 1;
pt(25).ncols     = 4;
pt(25).subsource = 'SS_DOUBLE';
pt(25).ndims     = '2';
pt(25).size      = '[]';

pt(26).blockname = 'CAN_SETUP_3_4';
pt(26).paramname = 'P5';
pt(26).class     = 'vector';
pt(26).nrows     = 1;
pt(26).ncols     = 4;
pt(26).subsource = 'SS_DOUBLE';
pt(26).ndims     = '2';
pt(26).size      = '[]';

pt(27).blockname = 'CAN_SETUP_3_4';
pt(27).paramname = 'P6';
pt(27).class     = 'scalar';
pt(27).nrows     = 1;
pt(27).ncols     = 1;
pt(27).subsource = 'SS_DOUBLE';
pt(27).ndims     = '2';
pt(27).size      = '[]';

pt(28).blockname = 'CAN_SETUP_3_4';
pt(28).paramname = 'P7';
pt(28).class     = 'scalar';
pt(28).nrows     = 1;
pt(28).ncols     = 1;
pt(28).subsource = 'SS_DOUBLE';
pt(28).ndims     = '2';
pt(28).size      = '[]';

pt(29).blockname = 'CAN_SETUP_3_4';
pt(29).paramname = 'P8';
pt(29).class     = 'vector';
pt(29).nrows     = 1;
pt(29).ncols     = 4;
pt(29).subsource = 'SS_DOUBLE';
pt(29).ndims     = '2';
pt(29).size      = '[]';

pt(30).blockname = 'CAN_SETUP_3_4';
pt(30).paramname = 'P9';
pt(30).class     = 'vector';
pt(30).nrows     = 1;
pt(30).ncols     = 4;
pt(30).subsource = 'SS_DOUBLE';
pt(30).ndims     = '2';
pt(30).size      = '[]';

pt(31).blockname = 'CAN_SETUP_3_4';
pt(31).paramname = 'P10';
pt(31).class     = 'vector';
pt(31).nrows     = 1;
pt(31).ncols     = 4;
pt(31).subsource = 'SS_DOUBLE';
pt(31).ndims     = '2';
pt(31).size      = '[]';

pt(32).blockname = 'CAN_SETUP_3_4';
pt(32).paramname = 'P11';
pt(32).class     = 'vector';
pt(32).nrows     = 1;
pt(32).ncols     = 2;
pt(32).subsource = 'SS_DOUBLE';
pt(32).ndims     = '2';
pt(32).size      = '[]';

pt(33).blockname = 'AutonomousVehicleSimulator/theta_ori';
pt(33).paramname = 'Value';
pt(33).class     = 'scalar';
pt(33).nrows     = 1;
pt(33).ncols     = 1;
pt(33).subsource = 'SS_DOUBLE';
pt(33).ndims     = '2';
pt(33).size      = '[]';

pt(34).blockname = 'AutonomousVehicleSimulator/x_ori';
pt(34).paramname = 'Value';
pt(34).class     = 'scalar';
pt(34).nrows     = 1;
pt(34).ncols     = 1;
pt(34).subsource = 'SS_DOUBLE';
pt(34).ndims     = '2';
pt(34).size      = '[]';

pt(35).blockname = 'AutonomousVehicleSimulator/y_ori';
pt(35).paramname = 'Value';
pt(35).class     = 'scalar';
pt(35).nrows     = 1;
pt(35).ncols     = 1;
pt(35).subsource = 'SS_DOUBLE';
pt(35).ndims     = '2';
pt(35).size      = '[]';

pt(36).blockname = 'AutonomousVehicleSimulator/Memory';
pt(36).paramname = 'X0';
pt(36).class     = 'scalar';
pt(36).nrows     = 1;
pt(36).ncols     = 1;
pt(36).subsource = 'SS_DOUBLE';
pt(36).ndims     = '2';
pt(36).size      = '[]';

pt(37).blockname = 'AutonomousVehicleSimulator/v_r_old1';
pt(37).paramname = 'X0';
pt(37).class     = 'scalar';
pt(37).nrows     = 1;
pt(37).ncols     = 1;
pt(37).subsource = 'SS_DOUBLE';
pt(37).ndims     = '2';
pt(37).size      = '[]';

pt(38).blockname = 'AutonomousVehicleSimulator/x_r_old';
pt(38).paramname = 'X0';
pt(38).class     = 'scalar';
pt(38).nrows     = 1;
pt(38).ncols     = 1;
pt(38).subsource = 'SS_DOUBLE';
pt(38).ndims     = '2';
pt(38).size      = '[]';

pt(39).blockname = 'Controller/q_h';
pt(39).paramname = 'Value';
pt(39).class     = 'scalar';
pt(39).nrows     = 1;
pt(39).ncols     = 1;
pt(39).subsource = 'SS_DOUBLE';
pt(39).ndims     = '2';
pt(39).size      = '[]';

pt(40).blockname = 'Controller/theta_ori';
pt(40).paramname = 'Value';
pt(40).class     = 'scalar';
pt(40).nrows     = 1;
pt(40).ncols     = 1;
pt(40).subsource = 'SS_DOUBLE';
pt(40).ndims     = '2';
pt(40).size      = '[]';

pt(41).blockname = 'Controller/x_ori';
pt(41).paramname = 'Value';
pt(41).class     = 'scalar';
pt(41).nrows     = 1;
pt(41).ncols     = 1;
pt(41).subsource = 'SS_DOUBLE';
pt(41).ndims     = '2';
pt(41).size      = '[]';

pt(42).blockname = 'Controller/y_ori';
pt(42).paramname = 'Value';
pt(42).class     = 'scalar';
pt(42).nrows     = 1;
pt(42).ncols     = 1;
pt(42).subsource = 'SS_DOUBLE';
pt(42).ndims     = '2';
pt(42).size      = '[]';

pt(43).blockname = 'Controller/Gain';
pt(43).paramname = 'Gain';
pt(43).class     = 'scalar';
pt(43).nrows     = 1;
pt(43).ncols     = 1;
pt(43).subsource = 'SS_DOUBLE';
pt(43).ndims     = '2';
pt(43).size      = '[]';

pt(44).blockname = 'Controller/Gain1';
pt(44).paramname = 'Gain';
pt(44).class     = 'scalar';
pt(44).nrows     = 1;
pt(44).ncols     = 1;
pt(44).subsource = 'SS_DOUBLE';
pt(44).ndims     = '2';
pt(44).size      = '[]';

pt(45).blockname = 'Controller/Gain2';
pt(45).paramname = 'Gain';
pt(45).class     = 'scalar';
pt(45).nrows     = 1;
pt(45).ncols     = 1;
pt(45).subsource = 'SS_DOUBLE';
pt(45).ndims     = '2';
pt(45).size      = '[]';

pt(46).blockname = 'Controller/Gain3';
pt(46).paramname = 'Gain';
pt(46).class     = 'scalar';
pt(46).nrows     = 1;
pt(46).ncols     = 1;
pt(46).subsource = 'SS_DOUBLE';
pt(46).ndims     = '2';
pt(46).size      = '[]';

pt(47).blockname = 'Controller/belief';
pt(47).paramname = 'X0';
pt(47).class     = 'vector';
pt(47).nrows     = 1;
pt(47).ncols     = 12;
pt(47).subsource = 'SS_DOUBLE';
pt(47).ndims     = '2';
pt(47).size      = '[]';

pt(48).blockname = 'Controller/d_h_mem';
pt(48).paramname = 'X0';
pt(48).class     = 'scalar';
pt(48).nrows     = 1;
pt(48).ncols     = 1;
pt(48).subsource = 'SS_DOUBLE';
pt(48).ndims     = '2';
pt(48).size      = '[]';

pt(49).blockname = 'Controller/d_r_mem';
pt(49).paramname = 'X0';
pt(49).class     = 'scalar';
pt(49).nrows     = 1;
pt(49).ncols     = 1;
pt(49).subsource = 'SS_DOUBLE';
pt(49).ndims     = '2';
pt(49).size      = '[]';

pt(50).blockname = 'Controller/sigma';
pt(50).paramname = 'X0';
pt(50).class     = 'scalar';
pt(50).nrows     = 1;
pt(50).ncols     = 1;
pt(50).subsource = 'SS_DOUBLE';
pt(50).ndims     = '2';
pt(50).size      = '[]';

pt(51).blockname = 'Controller/u_mem';
pt(51).paramname = 'X0';
pt(51).class     = 'scalar';
pt(51).nrows     = 1;
pt(51).ncols     = 1;
pt(51).subsource = 'SS_DOUBLE';
pt(51).ndims     = '2';
pt(51).size      = '[]';

pt(52).blockname = 'Controller/v_h_mem';
pt(52).paramname = 'X0';
pt(52).class     = 'scalar';
pt(52).nrows     = 1;
pt(52).ncols     = 1;
pt(52).subsource = 'SS_DOUBLE';
pt(52).ndims     = '2';
pt(52).size      = '[]';

pt(53).blockname = 'Controller/v_r_mem';
pt(53).paramname = 'X0';
pt(53).class     = 'scalar';
pt(53).nrows     = 1;
pt(53).ncols     = 1;
pt(53).subsource = 'SS_DOUBLE';
pt(53).ndims     = '2';
pt(53).size      = '[]';

pt(54).blockname = 'Controller/Discrete FIR Filter';
pt(54).paramname = 'InitialStates';
pt(54).class     = 'scalar';
pt(54).nrows     = 1;
pt(54).ncols     = 1;
pt(54).subsource = 'SS_DOUBLE';
pt(54).ndims     = '2';
pt(54).size      = '[]';

pt(55).blockname = 'Controller/Discrete FIR Filter';
pt(55).paramname = 'Coefficients';
pt(55).class     = 'vector';
pt(55).nrows     = 1;
pt(55).ncols     = 3;
pt(55).subsource = 'SS_DOUBLE';
pt(55).ndims     = '2';
pt(55).size      = '[]';

pt(56).blockname = 'DriverOverride/default';
pt(56).paramname = 'Value';
pt(56).class     = 'scalar';
pt(56).nrows     = 1;
pt(56).ncols     = 1;
pt(56).subsource = 'SS_DOUBLE';
pt(56).ndims     = '2';
pt(56).size      = '[]';

pt(57).blockname = 'DriverOverride/Saturation';
pt(57).paramname = 'UpperLimit';
pt(57).class     = 'scalar';
pt(57).nrows     = 1;
pt(57).ncols     = 1;
pt(57).subsource = 'SS_DOUBLE';
pt(57).ndims     = '2';
pt(57).size      = '[]';

pt(58).blockname = 'DriverOverride/Saturation';
pt(58).paramname = 'LowerLimit';
pt(58).class     = 'scalar';
pt(58).nrows     = 1;
pt(58).ncols     = 1;
pt(58).subsource = 'SS_DOUBLE';
pt(58).ndims     = '2';
pt(58).size      = '[]';

pt(59).blockname = 'DriverOverride/Switch';
pt(59).paramname = 'Threshold';
pt(59).class     = 'scalar';
pt(59).nrows     = 1;
pt(59).ncols     = 1;
pt(59).subsource = 'SS_DOUBLE';
pt(59).ndims     = '2';
pt(59).size      = '[]';

pt(60).blockname = 'DriverOverride/Unit Delay2';
pt(60).paramname = 'InitialCondition';
pt(60).class     = 'scalar';
pt(60).nrows     = 1;
pt(60).ncols     = 1;
pt(60).subsource = 'SS_DOUBLE';
pt(60).ndims     = '2';
pt(60).size      = '[]';

pt(61).blockname = 'InputProcessing/Read_CAN';
pt(61).paramname = 'P1';
pt(61).class     = 'scalar';
pt(61).nrows     = 1;
pt(61).ncols     = 1;
pt(61).subsource = 'SS_DOUBLE';
pt(61).ndims     = '2';
pt(61).size      = '[]';

pt(62).blockname = 'InputProcessing/Read_CAN';
pt(62).paramname = 'P2';
pt(62).class     = 'scalar';
pt(62).nrows     = 1;
pt(62).ncols     = 1;
pt(62).subsource = 'SS_DOUBLE';
pt(62).ndims     = '2';
pt(62).size      = '[]';

pt(63).blockname = 'InputProcessing/Read_CAN';
pt(63).paramname = 'P3';
pt(63).class     = 'scalar';
pt(63).nrows     = 1;
pt(63).ncols     = 1;
pt(63).subsource = 'SS_DOUBLE';
pt(63).ndims     = '2';
pt(63).size      = '[]';

pt(64).blockname = 'InputProcessing/Read_CAN';
pt(64).paramname = 'P4';
pt(64).class     = 'scalar';
pt(64).nrows     = 1;
pt(64).ncols     = 1;
pt(64).subsource = 'SS_DOUBLE';
pt(64).ndims     = '2';
pt(64).size      = '[]';

pt(65).blockname = 'InputProcessing/Read_CAN';
pt(65).paramname = 'P5';
pt(65).class     = 'scalar';
pt(65).nrows     = 1;
pt(65).ncols     = 1;
pt(65).subsource = 'SS_DOUBLE';
pt(65).ndims     = '2';
pt(65).size      = '[]';

pt(66).blockname = 'InputProcessing/Read_CAN';
pt(66).paramname = 'P6';
pt(66).class     = 'scalar';
pt(66).nrows     = 1;
pt(66).ncols     = 1;
pt(66).subsource = 'SS_DOUBLE';
pt(66).ndims     = '2';
pt(66).size      = '[]';

pt(67).blockname = 'InputProcessing/Read_CAN';
pt(67).paramname = 'P7';
pt(67).class     = 'vector';
pt(67).nrows     = 1;
pt(67).ncols     = 2;
pt(67).subsource = 'SS_DOUBLE';
pt(67).ndims     = '2';
pt(67).size      = '[]';

pt(68).blockname = 'InputProcessing/Read_CAN_2';
pt(68).paramname = 'P1';
pt(68).class     = 'scalar';
pt(68).nrows     = 1;
pt(68).ncols     = 1;
pt(68).subsource = 'SS_DOUBLE';
pt(68).ndims     = '2';
pt(68).size      = '[]';

pt(69).blockname = 'InputProcessing/Read_CAN_2';
pt(69).paramname = 'P2';
pt(69).class     = 'scalar';
pt(69).nrows     = 1;
pt(69).ncols     = 1;
pt(69).subsource = 'SS_DOUBLE';
pt(69).ndims     = '2';
pt(69).size      = '[]';

pt(70).blockname = 'InputProcessing/Read_CAN_2';
pt(70).paramname = 'P3';
pt(70).class     = 'scalar';
pt(70).nrows     = 1;
pt(70).ncols     = 1;
pt(70).subsource = 'SS_DOUBLE';
pt(70).ndims     = '2';
pt(70).size      = '[]';

pt(71).blockname = 'InputProcessing/Read_CAN_2';
pt(71).paramname = 'P4';
pt(71).class     = 'scalar';
pt(71).nrows     = 1;
pt(71).ncols     = 1;
pt(71).subsource = 'SS_DOUBLE';
pt(71).ndims     = '2';
pt(71).size      = '[]';

pt(72).blockname = 'InputProcessing/Read_CAN_2';
pt(72).paramname = 'P5';
pt(72).class     = 'scalar';
pt(72).nrows     = 1;
pt(72).ncols     = 1;
pt(72).subsource = 'SS_DOUBLE';
pt(72).ndims     = '2';
pt(72).size      = '[]';

pt(73).blockname = 'InputProcessing/Read_CAN_2';
pt(73).paramname = 'P6';
pt(73).class     = 'scalar';
pt(73).nrows     = 1;
pt(73).ncols     = 1;
pt(73).subsource = 'SS_DOUBLE';
pt(73).ndims     = '2';
pt(73).size      = '[]';

pt(74).blockname = 'InputProcessing/Read_CAN_2';
pt(74).paramname = 'P7';
pt(74).class     = 'vector';
pt(74).nrows     = 1;
pt(74).ncols     = 2;
pt(74).subsource = 'SS_DOUBLE';
pt(74).ndims     = '2';
pt(74).size      = '[]';

pt(75).blockname = 'InputProcessing/Read_CAN_3';
pt(75).paramname = 'P1';
pt(75).class     = 'scalar';
pt(75).nrows     = 1;
pt(75).ncols     = 1;
pt(75).subsource = 'SS_DOUBLE';
pt(75).ndims     = '2';
pt(75).size      = '[]';

pt(76).blockname = 'InputProcessing/Read_CAN_3';
pt(76).paramname = 'P2';
pt(76).class     = 'scalar';
pt(76).nrows     = 1;
pt(76).ncols     = 1;
pt(76).subsource = 'SS_DOUBLE';
pt(76).ndims     = '2';
pt(76).size      = '[]';

pt(77).blockname = 'InputProcessing/Read_CAN_3';
pt(77).paramname = 'P3';
pt(77).class     = 'scalar';
pt(77).nrows     = 1;
pt(77).ncols     = 1;
pt(77).subsource = 'SS_DOUBLE';
pt(77).ndims     = '2';
pt(77).size      = '[]';

pt(78).blockname = 'InputProcessing/Read_CAN_3';
pt(78).paramname = 'P4';
pt(78).class     = 'scalar';
pt(78).nrows     = 1;
pt(78).ncols     = 1;
pt(78).subsource = 'SS_DOUBLE';
pt(78).ndims     = '2';
pt(78).size      = '[]';

pt(79).blockname = 'InputProcessing/Read_CAN_3';
pt(79).paramname = 'P5';
pt(79).class     = 'scalar';
pt(79).nrows     = 1;
pt(79).ncols     = 1;
pt(79).subsource = 'SS_DOUBLE';
pt(79).ndims     = '2';
pt(79).size      = '[]';

pt(80).blockname = 'InputProcessing/Read_CAN_3';
pt(80).paramname = 'P6';
pt(80).class     = 'scalar';
pt(80).nrows     = 1;
pt(80).ncols     = 1;
pt(80).subsource = 'SS_DOUBLE';
pt(80).ndims     = '2';
pt(80).size      = '[]';

pt(81).blockname = 'InputProcessing/Read_CAN_3';
pt(81).paramname = 'P7';
pt(81).class     = 'vector';
pt(81).nrows     = 1;
pt(81).ncols     = 2;
pt(81).subsource = 'SS_DOUBLE';
pt(81).ndims     = '2';
pt(81).size      = '[]';

pt(82).blockname = 'OutputProcessing/Manual_aReq';
pt(82).paramname = 'Value';
pt(82).class     = 'scalar';
pt(82).nrows     = 1;
pt(82).ncols     = 1;
pt(82).subsource = 'SS_DOUBLE';
pt(82).ndims     = '2';
pt(82).size      = '[]';

pt(83).blockname = 'OutputProcessing/enableManAx';
pt(83).paramname = 'Value';
pt(83).class     = 'scalar';
pt(83).nrows     = 1;
pt(83).ncols     = 1;
pt(83).subsource = 'SS_DOUBLE';
pt(83).ndims     = '2';
pt(83).size      = '[]';

pt(84).blockname = 'OutputProcessing/100ms';
pt(84).paramname = 'Amplitude';
pt(84).class     = 'scalar';
pt(84).nrows     = 1;
pt(84).ncols     = 1;
pt(84).subsource = 'SS_DOUBLE';
pt(84).ndims     = '2';
pt(84).size      = '[]';

pt(85).blockname = 'OutputProcessing/100ms';
pt(85).paramname = 'Period';
pt(85).class     = 'scalar';
pt(85).nrows     = 1;
pt(85).ncols     = 1;
pt(85).subsource = 'SS_DOUBLE';
pt(85).ndims     = '2';
pt(85).size      = '[]';

pt(86).blockname = 'OutputProcessing/100ms';
pt(86).paramname = 'PulseWidth';
pt(86).class     = 'scalar';
pt(86).nrows     = 1;
pt(86).ncols     = 1;
pt(86).subsource = 'SS_DOUBLE';
pt(86).ndims     = '2';
pt(86).size      = '[]';

pt(87).blockname = 'OutputProcessing/100ms';
pt(87).paramname = 'PhaseDelay';
pt(87).class     = 'scalar';
pt(87).nrows     = 1;
pt(87).ncols     = 1;
pt(87).subsource = 'SS_DOUBLE';
pt(87).ndims     = '2';
pt(87).size      = '[]';

pt(88).blockname = 'OutputProcessing/Write_CAN_1';
pt(88).paramname = 'P1';
pt(88).class     = 'scalar';
pt(88).nrows     = 1;
pt(88).ncols     = 1;
pt(88).subsource = 'SS_DOUBLE';
pt(88).ndims     = '2';
pt(88).size      = '[]';

pt(89).blockname = 'OutputProcessing/Write_CAN_1';
pt(89).paramname = 'P2';
pt(89).class     = 'scalar';
pt(89).nrows     = 1;
pt(89).ncols     = 1;
pt(89).subsource = 'SS_DOUBLE';
pt(89).ndims     = '2';
pt(89).size      = '[]';

pt(90).blockname = 'OutputProcessing/Write_CAN_1';
pt(90).paramname = 'P3';
pt(90).class     = 'scalar';
pt(90).nrows     = 1;
pt(90).ncols     = 1;
pt(90).subsource = 'SS_DOUBLE';
pt(90).ndims     = '2';
pt(90).size      = '[]';

pt(91).blockname = 'OutputProcessing/Write_CAN_1';
pt(91).paramname = 'P4';
pt(91).class     = 'scalar';
pt(91).nrows     = 1;
pt(91).ncols     = 1;
pt(91).subsource = 'SS_DOUBLE';
pt(91).ndims     = '2';
pt(91).size      = '[]';

pt(92).blockname = 'OutputProcessing/Write_CAN_1';
pt(92).paramname = 'P5';
pt(92).class     = 'scalar';
pt(92).nrows     = 1;
pt(92).ncols     = 1;
pt(92).subsource = 'SS_DOUBLE';
pt(92).ndims     = '2';
pt(92).size      = '[]';

pt(93).blockname = 'OutputProcessing/Write_CAN_1';
pt(93).paramname = 'P6';
pt(93).class     = 'scalar';
pt(93).nrows     = 1;
pt(93).ncols     = 1;
pt(93).subsource = 'SS_DOUBLE';
pt(93).ndims     = '2';
pt(93).size      = '[]';

pt(94).blockname = 'OutputProcessing/Write_CAN_1';
pt(94).paramname = 'P7';
pt(94).class     = 'scalar';
pt(94).nrows     = 1;
pt(94).ncols     = 1;
pt(94).subsource = 'SS_DOUBLE';
pt(94).ndims     = '2';
pt(94).size      = '[]';

pt(95).blockname = 'OutputProcessing/Write_CAN_1';
pt(95).paramname = 'P8';
pt(95).class     = 'scalar';
pt(95).nrows     = 1;
pt(95).ncols     = 1;
pt(95).subsource = 'SS_DOUBLE';
pt(95).ndims     = '2';
pt(95).size      = '[]';

pt(96).blockname = 'OutputProcessing/Write_CAN_1';
pt(96).paramname = 'P9';
pt(96).class     = 'vector';
pt(96).nrows     = 1;
pt(96).ncols     = 2;
pt(96).subsource = 'SS_DOUBLE';
pt(96).ndims     = '2';
pt(96).size      = '[]';

pt(97).blockname = 'OutputProcessing/Switch';
pt(97).paramname = 'Threshold';
pt(97).class     = 'scalar';
pt(97).nrows     = 1;
pt(97).ncols     = 1;
pt(97).subsource = 'SS_DOUBLE';
pt(97).ndims     = '2';
pt(97).size      = '[]';

pt(98).blockname = 'OutputProcessing/ACC_Interface/Clearance';
pt(98).paramname = 'Value';
pt(98).class     = 'scalar';
pt(98).nrows     = 1;
pt(98).ncols     = 1;
pt(98).subsource = 'SS_DOUBLE';
pt(98).ndims     = '2';
pt(98).size      = '[]';

pt(99).blockname = 'OutputProcessing/ACC_Interface/Headway';
pt(99).paramname = 'Value';
pt(99).class     = 'scalar';
pt(99).nrows     = 1;
pt(99).ncols     = 1;
pt(99).subsource = 'SS_DOUBLE';
pt(99).ndims     = '2';
pt(99).size      = '[]';

pt(100).blockname = 'OutputProcessing/ACC_Interface/ObjectValid';
pt(100).paramname = 'Value';
pt(100).class     = 'scalar';
pt(100).nrows     = 1;
pt(100).ncols     = 1;
pt(100).subsource = 'SS_DOUBLE';
pt(100).ndims     = '2';
pt(100).size      = '[]';

pt(101).blockname = 'OutputProcessing/ACC_Interface/Objvalid';
pt(101).paramname = 'Value';
pt(101).class     = 'scalar';
pt(101).nrows     = 1;
pt(101).ncols     = 1;
pt(101).subsource = 'SS_DOUBLE';
pt(101).ndims     = '2';
pt(101).size      = '[]';

pt(102).blockname = 'OutputProcessing/ACC_Interface/RelSpd';
pt(102).paramname = 'Value';
pt(102).class     = 'scalar';
pt(102).nrows     = 1;
pt(102).ncols     = 1;
pt(102).subsource = 'SS_DOUBLE';
pt(102).ndims     = '2';
pt(102).size      = '[]';

pt(103).blockname = 'OutputProcessing/ACC_Interface/SetSpeed';
pt(103).paramname = 'Value';
pt(103).class     = 'scalar';
pt(103).nrows     = 1;
pt(103).ncols     = 1;
pt(103).subsource = 'SS_DOUBLE';
pt(103).ndims     = '2';
pt(103).size      = '[]';

pt(104).blockname = 'OutputProcessing/ACC_Interface/disable';
pt(104).paramname = 'Value';
pt(104).class     = 'scalar';
pt(104).nrows     = 1;
pt(104).ncols     = 1;
pt(104).subsource = 'SS_DOUBLE';
pt(104).ndims     = '2';
pt(104).size      = '[]';

pt(105).blockname = 'OutputProcessing/ACC_Interface/Switch';
pt(105).paramname = 'Threshold';
pt(105).class     = 'scalar';
pt(105).nrows     = 1;
pt(105).ncols     = 1;
pt(105).subsource = 'SS_DOUBLE';
pt(105).ndims     = '2';
pt(105).size      = '[]';

pt(106).blockname = 'OutputProcessing/TM_AliveCnt/Constant';
pt(106).paramname = 'Value';
pt(106).class     = 'scalar';
pt(106).nrows     = 1;
pt(106).ncols     = 1;
pt(106).subsource = 'SS_DOUBLE';
pt(106).ndims     = '2';
pt(106).size      = '[]';

pt(107).blockname = 'OutputProcessing/TM_AliveCnt/Constant1';
pt(107).paramname = 'Value';
pt(107).class     = 'scalar';
pt(107).nrows     = 1;
pt(107).ncols     = 1;
pt(107).subsource = 'SS_DOUBLE';
pt(107).ndims     = '2';
pt(107).size      = '[]';

pt(108).blockname = 'OutputProcessing/TM_AliveCnt/Switch1';
pt(108).paramname = 'Threshold';
pt(108).class     = 'scalar';
pt(108).nrows     = 1;
pt(108).ncols     = 1;
pt(108).subsource = 'SS_DOUBLE';
pt(108).ndims     = '2';
pt(108).size      = '[]';

pt(109).blockname = 'OutputProcessing/TM_AliveCnt/Unit Delay';
pt(109).paramname = 'InitialCondition';
pt(109).class     = 'scalar';
pt(109).nrows     = 1;
pt(109).ncols     = 1;
pt(109).subsource = 'SS_DOUBLE';
pt(109).ndims     = '2';
pt(109).size      = '[]';

pt(110).blockname = 'OutputProcessing/VehicleCanProcessing/Req Steering Angle [deg]';
pt(110).paramname = 'Value';
pt(110).class     = 'scalar';
pt(110).nrows     = 1;
pt(110).ncols     = 1;
pt(110).subsource = 'SS_DOUBLE';
pt(110).ndims     = '2';
pt(110).size      = '[]';

pt(111).blockname = 'OutputProcessing/VehicleCanProcessing/SteerOffsetDeg';
pt(111).paramname = 'Value';
pt(111).class     = 'scalar';
pt(111).nrows     = 1;
pt(111).ncols     = 1;
pt(111).subsource = 'SS_DOUBLE';
pt(111).ndims     = '2';
pt(111).size      = '[]';

pt(112).blockname = 'OutputProcessing/VehicleCanProcessing/default';
pt(112).paramname = 'Value';
pt(112).class     = 'scalar';
pt(112).nrows     = 1;
pt(112).ncols     = 1;
pt(112).subsource = 'SS_DOUBLE';
pt(112).ndims     = '2';
pt(112).size      = '[]';

pt(113).blockname = 'OutputProcessing/VehicleCanProcessing/default1';
pt(113).paramname = 'Value';
pt(113).class     = 'scalar';
pt(113).nrows     = 1;
pt(113).ncols     = 1;
pt(113).subsource = 'SS_DOUBLE';
pt(113).ndims     = '2';
pt(113).size      = '[]';

pt(114).blockname = 'OutputProcessing/VehicleCanProcessing/default2';
pt(114).paramname = 'Value';
pt(114).class     = 'scalar';
pt(114).nrows     = 1;
pt(114).ncols     = 1;
pt(114).subsource = 'SS_DOUBLE';
pt(114).ndims     = '2';
pt(114).size      = '[]';

pt(115).blockname = 'OutputProcessing/VehicleCanProcessing/ ';
pt(115).paramname = 'Gain';
pt(115).class     = 'scalar';
pt(115).nrows     = 1;
pt(115).ncols     = 1;
pt(115).subsource = 'SS_DOUBLE';
pt(115).ndims     = '2';
pt(115).size      = '[]';

pt(116).blockname = 'OutputProcessing/VehicleCanProcessing/ 1';
pt(116).paramname = 'Gain';
pt(116).class     = 'scalar';
pt(116).nrows     = 1;
pt(116).ncols     = 1;
pt(116).subsource = 'SS_DOUBLE';
pt(116).ndims     = '2';
pt(116).size      = '[]';

pt(117).blockname = 'OutputProcessing/VehicleCanProcessing/GearRatio';
pt(117).paramname = 'Gain';
pt(117).class     = 'scalar';
pt(117).nrows     = 1;
pt(117).ncols     = 1;
pt(117).subsource = 'SS_DOUBLE';
pt(117).ndims     = '2';
pt(117).size      = '[]';

pt(118).blockname = 'OutputProcessing/VehicleCanProcessing/rad2deg';
pt(118).paramname = 'Gain';
pt(118).class     = 'scalar';
pt(118).nrows     = 1;
pt(118).ncols     = 1;
pt(118).subsource = 'SS_DOUBLE';
pt(118).ndims     = '2';
pt(118).size      = '[]';

pt(119).blockname = 'OutputProcessing/VehicleCanProcessing/Saturation';
pt(119).paramname = 'UpperLimit';
pt(119).class     = 'scalar';
pt(119).nrows     = 1;
pt(119).ncols     = 1;
pt(119).subsource = 'SS_DOUBLE';
pt(119).ndims     = '2';
pt(119).size      = '[]';

pt(120).blockname = 'OutputProcessing/VehicleCanProcessing/Saturation';
pt(120).paramname = 'LowerLimit';
pt(120).class     = 'scalar';
pt(120).nrows     = 1;
pt(120).ncols     = 1;
pt(120).subsource = 'SS_DOUBLE';
pt(120).ndims     = '2';
pt(120).size      = '[]';

pt(121).blockname = 'OutputProcessing/VehicleCanProcessing/Switch';
pt(121).paramname = 'Threshold';
pt(121).class     = 'scalar';
pt(121).nrows     = 1;
pt(121).ncols     = 1;
pt(121).subsource = 'SS_DOUBLE';
pt(121).ndims     = '2';
pt(121).size      = '[]';

pt(122).blockname = 'OutputProcessing/VehicleCanProcessing/Switch1';
pt(122).paramname = 'Threshold';
pt(122).class     = 'scalar';
pt(122).nrows     = 1;
pt(122).ncols     = 1;
pt(122).subsource = 'SS_DOUBLE';
pt(122).ndims     = '2';
pt(122).size      = '[]';

pt(123).blockname = 'SensorFusion/Map-based Localization/OffsetX';
pt(123).paramname = 'Value';
pt(123).class     = 'scalar';
pt(123).nrows     = 1;
pt(123).ncols     = 1;
pt(123).subsource = 'SS_DOUBLE';
pt(123).ndims     = '2';
pt(123).size      = '[]';

pt(124).blockname = 'SensorFusion/Map-based Localization/OffsetY';
pt(124).paramname = 'Value';
pt(124).class     = 'scalar';
pt(124).nrows     = 1;
pt(124).ncols     = 1;
pt(124).subsource = 'SS_DOUBLE';
pt(124).ndims     = '2';
pt(124).size      = '[]';

pt(125).blockname = 'SensorFusion/Map-based Localization/gain1';
pt(125).paramname = 'Gain';
pt(125).class     = 'scalar';
pt(125).nrows     = 1;
pt(125).ncols     = 1;
pt(125).subsource = 'SS_DOUBLE';
pt(125).ndims     = '2';
pt(125).size      = '[]';

pt(126).blockname = 'SensorFusion/Map-based Localization/gain2';
pt(126).paramname = 'Gain';
pt(126).class     = 'scalar';
pt(126).nrows     = 1;
pt(126).ncols     = 1;
pt(126).subsource = 'SS_DOUBLE';
pt(126).ndims     = '2';
pt(126).size      = '[]';

pt(127).blockname = 'OutputProcessing/ACC_Interface/SCC1 Processing/Compare To Constant2';
pt(127).paramname = 'const';
pt(127).class     = 'scalar';
pt(127).nrows     = 1;
pt(127).ncols     = 1;
pt(127).subsource = 'SS_DOUBLE';
pt(127).ndims     = '2';
pt(127).size      = '[]';

pt(128).blockname = 'OutputProcessing/ACC_Interface/SCC1 Processing/AVAILABLE_TO_RESUME_CANSPEC';
pt(128).paramname = 'Value';
pt(128).class     = 'scalar';
pt(128).nrows     = 1;
pt(128).ncols     = 1;
pt(128).subsource = 'SS_DOUBLE';
pt(128).ndims     = '2';
pt(128).size      = '[]';

pt(129).blockname = 'OutputProcessing/ACC_Interface/SCC1 Processing/Constant';
pt(129).paramname = 'Value';
pt(129).class     = 'scalar';
pt(129).nrows     = 1;
pt(129).ncols     = 1;
pt(129).subsource = 'SS_DOUBLE';
pt(129).ndims     = '2';
pt(129).size      = '[]';

pt(130).blockname = 'OutputProcessing/ACC_Interface/SCC1 Processing/Constant1';
pt(130).paramname = 'Value';
pt(130).class     = 'scalar';
pt(130).nrows     = 1;
pt(130).ncols     = 1;
pt(130).subsource = 'SS_DOUBLE';
pt(130).ndims     = '2';
pt(130).size      = '[]';

pt(131).blockname = 'OutputProcessing/ACC_Interface/SCC1 Processing/Constant2';
pt(131).paramname = 'Value';
pt(131).class     = 'scalar';
pt(131).nrows     = 1;
pt(131).ncols     = 1;
pt(131).subsource = 'SS_DOUBLE';
pt(131).ndims     = '2';
pt(131).size      = '[]';

pt(132).blockname = 'OutputProcessing/ACC_Interface/SCC1 Processing/Constant3';
pt(132).paramname = 'Value';
pt(132).class     = 'scalar';
pt(132).nrows     = 1;
pt(132).ncols     = 1;
pt(132).subsource = 'SS_DOUBLE';
pt(132).ndims     = '2';
pt(132).size      = '[]';

pt(133).blockname = 'OutputProcessing/ACC_Interface/SCC1 Processing/Constant8';
pt(133).paramname = 'Value';
pt(133).class     = 'scalar';
pt(133).nrows     = 1;
pt(133).ncols     = 1;
pt(133).subsource = 'SS_DOUBLE';
pt(133).ndims     = '2';
pt(133).size      = '[]';

pt(134).blockname = 'OutputProcessing/ACC_Interface/SCC1 Processing/Constant9';
pt(134).paramname = 'Value';
pt(134).class     = 'scalar';
pt(134).nrows     = 1;
pt(134).ncols     = 1;
pt(134).subsource = 'SS_DOUBLE';
pt(134).ndims     = '2';
pt(134).size      = '[]';

pt(135).blockname = 'OutputProcessing/ACC_Interface/SCC1 Processing/ENGAGED_CANSPEC';
pt(135).paramname = 'Value';
pt(135).class     = 'scalar';
pt(135).nrows     = 1;
pt(135).ncols     = 1;
pt(135).subsource = 'SS_DOUBLE';
pt(135).ndims     = '2';
pt(135).size      = '[]';

pt(136).blockname = 'OutputProcessing/ACC_Interface/SCC1 Processing/HEADWAY_STATE_4';
pt(136).paramname = 'Value';
pt(136).class     = 'scalar';
pt(136).nrows     = 1;
pt(136).ncols     = 1;
pt(136).subsource = 'SS_DOUBLE';
pt(136).ndims     = '2';
pt(136).size      = '[]';

pt(137).blockname = 'OutputProcessing/ACC_Interface/SCC1 Processing/NODISPLAY_CANSPEC';
pt(137).paramname = 'Value';
pt(137).class     = 'scalar';
pt(137).nrows     = 1;
pt(137).ncols     = 1;
pt(137).subsource = 'SS_DOUBLE';
pt(137).ndims     = '2';
pt(137).size      = '[]';

pt(138).blockname = 'OutputProcessing/ACC_Interface/SCC1 Processing/OFF';
pt(138).paramname = 'Value';
pt(138).class     = 'scalar';
pt(138).nrows     = 1;
pt(138).ncols     = 1;
pt(138).subsource = 'SS_DOUBLE';
pt(138).ndims     = '2';
pt(138).size      = '[]';

pt(139).blockname = 'OutputProcessing/ACC_Interface/SCC1 Processing/ON';
pt(139).paramname = 'Value';
pt(139).class     = 'scalar';
pt(139).nrows     = 1;
pt(139).ncols     = 1;
pt(139).subsource = 'SS_DOUBLE';
pt(139).ndims     = '2';
pt(139).size      = '[]';

pt(140).blockname = 'OutputProcessing/ACC_Interface/SCC1 Processing/OVERRIDE_CANSPEC';
pt(140).paramname = 'Value';
pt(140).class     = 'scalar';
pt(140).nrows     = 1;
pt(140).ncols     = 1;
pt(140).subsource = 'SS_DOUBLE';
pt(140).ndims     = '2';
pt(140).size      = '[]';

pt(141).blockname = 'OutputProcessing/ACC_Interface/SCC1 Processing/SHUTOFF_CANSPEC';
pt(141).paramname = 'Value';
pt(141).class     = 'scalar';
pt(141).nrows     = 1;
pt(141).ncols     = 1;
pt(141).subsource = 'SS_DOUBLE';
pt(141).ndims     = '2';
pt(141).size      = '[]';

pt(142).blockname = 'OutputProcessing/ACC_Interface/SCC1 Processing/Memory';
pt(142).paramname = 'X0';
pt(142).class     = 'scalar';
pt(142).nrows     = 1;
pt(142).ncols     = 1;
pt(142).subsource = 'SS_DOUBLE';
pt(142).ndims     = '2';
pt(142).size      = '[]';

pt(143).blockname = 'OutputProcessing/ACC_Interface/SCC1 Processing/Switch9';
pt(143).paramname = 'Threshold';
pt(143).class     = 'scalar';
pt(143).nrows     = 1;
pt(143).ncols     = 1;
pt(143).subsource = 'SS_UINT8';
pt(143).ndims     = '2';
pt(143).size      = '[]';

pt(144).blockname = 'OutputProcessing/ACC_Interface/SCC2 Processing/OFF';
pt(144).paramname = 'Value';
pt(144).class     = 'scalar';
pt(144).nrows     = 1;
pt(144).ncols     = 1;
pt(144).subsource = 'SS_DOUBLE';
pt(144).ndims     = '2';
pt(144).size      = '[]';

pt(145).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Discrete PID Controller1';
pt(145).paramname = 'P';
pt(145).class     = 'scalar';
pt(145).nrows     = 1;
pt(145).ncols     = 1;
pt(145).subsource = 'SS_DOUBLE';
pt(145).ndims     = '2';
pt(145).size      = '[]';

pt(146).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Discrete PID Controller1';
pt(146).paramname = 'I';
pt(146).class     = 'scalar';
pt(146).nrows     = 1;
pt(146).ncols     = 1;
pt(146).subsource = 'SS_DOUBLE';
pt(146).ndims     = '2';
pt(146).size      = '[]';

pt(147).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Discrete PID Controller1';
pt(147).paramname = 'D';
pt(147).class     = 'scalar';
pt(147).nrows     = 1;
pt(147).ncols     = 1;
pt(147).subsource = 'SS_DOUBLE';
pt(147).ndims     = '2';
pt(147).size      = '[]';

pt(148).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Discrete PID Controller1';
pt(148).paramname = 'N';
pt(148).class     = 'scalar';
pt(148).nrows     = 1;
pt(148).ncols     = 1;
pt(148).subsource = 'SS_DOUBLE';
pt(148).ndims     = '2';
pt(148).size      = '[]';

pt(149).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Discrete PID Controller1';
pt(149).paramname = 'UpperSaturationLimit';
pt(149).class     = 'scalar';
pt(149).nrows     = 1;
pt(149).ncols     = 1;
pt(149).subsource = 'SS_DOUBLE';
pt(149).ndims     = '2';
pt(149).size      = '[]';

pt(150).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Discrete PID Controller1';
pt(150).paramname = 'LowerSaturationLimit';
pt(150).class     = 'scalar';
pt(150).nrows     = 1;
pt(150).ncols     = 1;
pt(150).subsource = 'SS_DOUBLE';
pt(150).ndims     = '2';
pt(150).size      = '[]';

pt(151).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Status1';
pt(151).paramname = 'Value';
pt(151).class     = 'scalar';
pt(151).nrows     = 1;
pt(151).ncols     = 1;
pt(151).subsource = 'SS_DOUBLE';
pt(151).ndims     = '2';
pt(151).size      = '[]';

pt(152).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Status2';
pt(152).paramname = 'Value';
pt(152).class     = 'scalar';
pt(152).nrows     = 1;
pt(152).ncols     = 1;
pt(152).subsource = 'SS_DOUBLE';
pt(152).ndims     = '2';
pt(152).size      = '[]';

pt(153).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/SteerFilterCoeff1';
pt(153).paramname = 'Value';
pt(153).class     = 'scalar';
pt(153).nrows     = 1;
pt(153).ncols     = 1;
pt(153).subsource = 'SS_DOUBLE';
pt(153).ndims     = '2';
pt(153).size      = '[]';

pt(154).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/SteerFilterCoeff2';
pt(154).paramname = 'Value';
pt(154).class     = 'scalar';
pt(154).nrows     = 1;
pt(154).ncols     = 1;
pt(154).subsource = 'SS_DOUBLE';
pt(154).ndims     = '2';
pt(154).size      = '[]';

pt(155).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/SteeringController 0: UCB 1: Hyundai';
pt(155).paramname = 'Value';
pt(155).class     = 'scalar';
pt(155).nrows     = 1;
pt(155).ncols     = 1;
pt(155).subsource = 'SS_DOUBLE';
pt(155).ndims     = '2';
pt(155).size      = '[]';

pt(156).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/PID_Input';
pt(156).paramname = 'Gain';
pt(156).class     = 'scalar';
pt(156).nrows     = 1;
pt(156).ncols     = 1;
pt(156).subsource = 'SS_DOUBLE';
pt(156).ndims     = '2';
pt(156).size      = '[]';

pt(157).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/PID_Input1';
pt(157).paramname = 'Gain';
pt(157).class     = 'scalar';
pt(157).nrows     = 1;
pt(157).ncols     = 1;
pt(157).subsource = 'SS_DOUBLE';
pt(157).ndims     = '2';
pt(157).size      = '[]';

pt(158).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/PID_Input2';
pt(158).paramname = 'Gain';
pt(158).class     = 'scalar';
pt(158).nrows     = 1;
pt(158).ncols     = 1;
pt(158).subsource = 'SS_DOUBLE';
pt(158).ndims     = '2';
pt(158).size      = '[]';

pt(159).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/PID_Output';
pt(159).paramname = 'Gain';
pt(159).class     = 'scalar';
pt(159).nrows     = 1;
pt(159).ncols     = 1;
pt(159).subsource = 'SS_DOUBLE';
pt(159).ndims     = '2';
pt(159).size      = '[]';

pt(160).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Rate Transition11';
pt(160).paramname = 'X0';
pt(160).class     = 'scalar';
pt(160).nrows     = 1;
pt(160).ncols     = 1;
pt(160).subsource = 'SS_DOUBLE';
pt(160).ndims     = '2';
pt(160).size      = '[]';

pt(161).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Rate Limiter';
pt(161).paramname = 'RisingSlewLimit';
pt(161).class     = 'scalar';
pt(161).nrows     = 1;
pt(161).ncols     = 1;
pt(161).subsource = 'SS_DOUBLE';
pt(161).ndims     = '2';
pt(161).size      = '[]';

pt(162).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Rate Limiter';
pt(162).paramname = 'FallingSlewLimit';
pt(162).class     = 'scalar';
pt(162).nrows     = 1;
pt(162).ncols     = 1;
pt(162).subsource = 'SS_DOUBLE';
pt(162).ndims     = '2';
pt(162).size      = '[]';

pt(163).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Rate Limiter';
pt(163).paramname = 'InitialCondition';
pt(163).class     = 'scalar';
pt(163).nrows     = 1;
pt(163).ncols     = 1;
pt(163).subsource = 'SS_DOUBLE';
pt(163).ndims     = '2';
pt(163).size      = '[]';

pt(164).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Saturation';
pt(164).paramname = 'UpperLimit';
pt(164).class     = 'scalar';
pt(164).nrows     = 1;
pt(164).ncols     = 1;
pt(164).subsource = 'SS_DOUBLE';
pt(164).ndims     = '2';
pt(164).size      = '[]';

pt(165).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Saturation';
pt(165).paramname = 'LowerLimit';
pt(165).class     = 'scalar';
pt(165).nrows     = 1;
pt(165).ncols     = 1;
pt(165).subsource = 'SS_DOUBLE';
pt(165).ndims     = '2';
pt(165).size      = '[]';

pt(166).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Switch';
pt(166).paramname = 'Threshold';
pt(166).class     = 'scalar';
pt(166).nrows     = 1;
pt(166).ncols     = 1;
pt(166).subsource = 'SS_DOUBLE';
pt(166).ndims     = '2';
pt(166).size      = '[]';

pt(167).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Switch1';
pt(167).paramname = 'Threshold';
pt(167).class     = 'scalar';
pt(167).nrows     = 1;
pt(167).ncols     = 1;
pt(167).subsource = 'SS_DOUBLE';
pt(167).ndims     = '2';
pt(167).size      = '[]';

pt(168).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Unit Delay';
pt(168).paramname = 'InitialCondition';
pt(168).class     = 'scalar';
pt(168).nrows     = 1;
pt(168).ncols     = 1;
pt(168).subsource = 'SS_DOUBLE';
pt(168).ndims     = '2';
pt(168).size      = '[]';

pt(169).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Unit Delay1';
pt(169).paramname = 'InitialCondition';
pt(169).class     = 'scalar';
pt(169).nrows     = 1;
pt(169).ncols     = 1;
pt(169).subsource = 'SS_DOUBLE';
pt(169).ndims     = '2';
pt(169).size      = '[]';

pt(170).blockname = 'InputProcessing/For Iterator Subsystem/EMS1Processing/EMS1Processing/Gain';
pt(170).paramname = 'Gain';
pt(170).class     = 'scalar';
pt(170).nrows     = 1;
pt(170).ncols     = 1;
pt(170).subsource = 'SS_DOUBLE';
pt(170).ndims     = '2';
pt(170).size      = '[]';

pt(171).blockname = 'InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/Constant3';
pt(171).paramname = 'Value';
pt(171).class     = 'scalar';
pt(171).nrows     = 1;
pt(171).ncols     = 1;
pt(171).subsource = 'SS_DOUBLE';
pt(171).ndims     = '2';
pt(171).size      = '[]';

pt(172).blockname = 'InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/Gain';
pt(172).paramname = 'Gain';
pt(172).class     = 'scalar';
pt(172).nrows     = 1;
pt(172).ncols     = 1;
pt(172).subsource = 'SS_DOUBLE';
pt(172).ndims     = '2';
pt(172).size      = '[]';

pt(173).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/I_gain_spd';
pt(173).paramname = 'Value';
pt(173).class     = 'scalar';
pt(173).nrows     = 1;
pt(173).ncols     = 1;
pt(173).subsource = 'SS_DOUBLE';
pt(173).ndims     = '2';
pt(173).size      = '[]';

pt(174).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/IGainSpeed';
pt(174).paramname = 'Gain';
pt(174).class     = 'scalar';
pt(174).nrows     = 1;
pt(174).ncols     = 1;
pt(174).subsource = 'SS_DOUBLE';
pt(174).ndims     = '2';
pt(174).size      = '[]';

pt(175).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PGainSAS';
pt(175).paramname = 'Gain';
pt(175).class     = 'scalar';
pt(175).nrows     = 1;
pt(175).ncols     = 1;
pt(175).subsource = 'SS_DOUBLE';
pt(175).ndims     = '2';
pt(175).size      = '[]';

pt(176).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PGainSpeed';
pt(176).paramname = 'Gain';
pt(176).class     = 'scalar';
pt(176).nrows     = 1;
pt(176).ncols     = 1;
pt(176).subsource = 'SS_DOUBLE';
pt(176).ndims     = '2';
pt(176).size      = '[]';

pt(177).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/P_gain_sas_map';
pt(177).paramname = 'InputValues';
pt(177).class     = 'vector';
pt(177).nrows     = 1;
pt(177).ncols     = 5;
pt(177).subsource = 'SS_DOUBLE';
pt(177).ndims     = '2';
pt(177).size      = '[]';

pt(178).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/P_gain_sas_map';
pt(178).paramname = 'Table';
pt(178).class     = 'vector';
pt(178).nrows     = 1;
pt(178).ncols     = 5;
pt(178).subsource = 'SS_DOUBLE';
pt(178).ndims     = '2';
pt(178).size      = '[]';

pt(179).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/P_gain_spd_map';
pt(179).paramname = 'InputValues';
pt(179).class     = 'vector';
pt(179).nrows     = 1;
pt(179).ncols     = 5;
pt(179).subsource = 'SS_DOUBLE';
pt(179).ndims     = '2';
pt(179).size      = '[]';

pt(180).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/P_gain_spd_map';
pt(180).paramname = 'Table';
pt(180).class     = 'vector';
pt(180).nrows     = 1;
pt(180).ncols     = 5;
pt(180).subsource = 'SS_DOUBLE';
pt(180).ndims     = '2';
pt(180).size      = '[]';

pt(181).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/Rate Limiter steering';
pt(181).paramname = 'RisingSlewLimit';
pt(181).class     = 'scalar';
pt(181).nrows     = 1;
pt(181).ncols     = 1;
pt(181).subsource = 'SS_DOUBLE';
pt(181).ndims     = '2';
pt(181).size      = '[]';

pt(182).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/Rate Limiter steering';
pt(182).paramname = 'FallingSlewLimit';
pt(182).class     = 'scalar';
pt(182).nrows     = 1;
pt(182).ncols     = 1;
pt(182).subsource = 'SS_DOUBLE';
pt(182).ndims     = '2';
pt(182).size      = '[]';

pt(183).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/Rate Limiter steering';
pt(183).paramname = 'InitialCondition';
pt(183).class     = 'scalar';
pt(183).nrows     = 1;
pt(183).ncols     = 1;
pt(183).subsource = 'SS_DOUBLE';
pt(183).ndims     = '2';
pt(183).size      = '[]';

pt(184).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/Saturation steering torque';
pt(184).paramname = 'UpperLimit';
pt(184).class     = 'scalar';
pt(184).nrows     = 1;
pt(184).ncols     = 1;
pt(184).subsource = 'SS_DOUBLE';
pt(184).ndims     = '2';
pt(184).size      = '[]';

pt(185).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/Saturation steering torque';
pt(185).paramname = 'LowerLimit';
pt(185).class     = 'scalar';
pt(185).nrows     = 1;
pt(185).ncols     = 1;
pt(185).subsource = 'SS_DOUBLE';
pt(185).ndims     = '2';
pt(185).size      = '[]';

pt(186).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Discrete PID Controller1/Constant';
pt(186).paramname = 'Value';
pt(186).class     = 'scalar';
pt(186).nrows     = 1;
pt(186).ncols     = 1;
pt(186).subsource = 'SS_DOUBLE';
pt(186).ndims     = '2';
pt(186).size      = '[]';

pt(187).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Discrete PID Controller1/Filter';
pt(187).paramname = 'gainval';
pt(187).class     = 'scalar';
pt(187).nrows     = 1;
pt(187).ncols     = 1;
pt(187).subsource = 'SS_DOUBLE';
pt(187).ndims     = '2';
pt(187).size      = '[]';

pt(188).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Discrete PID Controller1/Filter';
pt(188).paramname = 'InitialCondition';
pt(188).class     = 'scalar';
pt(188).nrows     = 1;
pt(188).ncols     = 1;
pt(188).subsource = 'SS_DOUBLE';
pt(188).ndims     = '2';
pt(188).size      = '[]';

pt(189).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Discrete PID Controller1/Integrator';
pt(189).paramname = 'gainval';
pt(189).class     = 'scalar';
pt(189).nrows     = 1;
pt(189).ncols     = 1;
pt(189).subsource = 'SS_DOUBLE';
pt(189).ndims     = '2';
pt(189).size      = '[]';

pt(190).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Discrete PID Controller1/Integrator';
pt(190).paramname = 'InitialCondition';
pt(190).class     = 'scalar';
pt(190).nrows     = 1;
pt(190).ncols     = 1;
pt(190).subsource = 'SS_DOUBLE';
pt(190).ndims     = '2';
pt(190).size      = '[]';

pt(191).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Discrete PID Controller1/Switch';
pt(191).paramname = 'Threshold';
pt(191).class     = 'scalar';
pt(191).nrows     = 1;
pt(191).ncols     = 1;
pt(191).subsource = 'SS_DOUBLE';
pt(191).ndims     = '2';
pt(191).size      = '[]';

pt(192).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/MessageCounter';
pt(192).paramname = 'cyc_time';
pt(192).class     = 'scalar';
pt(192).nrows     = 1;
pt(192).ncols     = 1;
pt(192).subsource = 'SS_DOUBLE';
pt(192).ndims     = '2';
pt(192).size      = '[]';

pt(193).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/MessageCounter';
pt(193).paramname = 'calc_time';
pt(193).class     = 'scalar';
pt(193).nrows     = 1;
pt(193).ncols     = 1;
pt(193).subsource = 'SS_DOUBLE';
pt(193).ndims     = '2';
pt(193).size      = '[]';

pt(194).blockname = 'InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/Compare To Constant1';
pt(194).paramname = 'const';
pt(194).class     = 'scalar';
pt(194).nrows     = 1;
pt(194).ncols     = 1;
pt(194).subsource = 'SS_DOUBLE';
pt(194).ndims     = '2';
pt(194).size      = '[]';

pt(195).blockname = 'InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/Constant6';
pt(195).paramname = 'Value';
pt(195).class     = 'scalar';
pt(195).nrows     = 1;
pt(195).ncols     = 1;
pt(195).subsource = 'SS_DOUBLE';
pt(195).ndims     = '2';
pt(195).size      = '[]';

pt(196).blockname = 'InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/Switch1';
pt(196).paramname = 'Threshold';
pt(196).class     = 'scalar';
pt(196).nrows     = 1;
pt(196).ncols     = 1;
pt(196).subsource = 'SS_UINT8';
pt(196).ndims     = '2';
pt(196).size      = '[]';

pt(197).blockname = 'InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing/Memory';
pt(197).paramname = 'X0';
pt(197).class     = 'scalar';
pt(197).nrows     = 1;
pt(197).ncols     = 1;
pt(197).subsource = 'SS_DOUBLE';
pt(197).ndims     = '2';
pt(197).size      = '[]';

pt(198).blockname = 'InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing/Memory1';
pt(198).paramname = 'X0';
pt(198).class     = 'scalar';
pt(198).nrows     = 1;
pt(198).ncols     = 1;
pt(198).subsource = 'SS_DOUBLE';
pt(198).ndims     = '2';
pt(198).size      = '[]';

pt(199).blockname = 'InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing1/Memory';
pt(199).paramname = 'X0';
pt(199).class     = 'scalar';
pt(199).nrows     = 1;
pt(199).ncols     = 1;
pt(199).subsource = 'SS_DOUBLE';
pt(199).ndims     = '2';
pt(199).size      = '[]';

pt(200).blockname = 'InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing1/Memory1';
pt(200).paramname = 'X0';
pt(200).class     = 'scalar';
pt(200).nrows     = 1;
pt(200).ncols     = 1;
pt(200).subsource = 'SS_DOUBLE';
pt(200).ndims     = '2';
pt(200).size      = '[]';

pt(201).blockname = 'InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing2/Memory';
pt(201).paramname = 'X0';
pt(201).class     = 'scalar';
pt(201).nrows     = 1;
pt(201).ncols     = 1;
pt(201).subsource = 'SS_DOUBLE';
pt(201).ndims     = '2';
pt(201).size      = '[]';

pt(202).blockname = 'InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing2/Memory1';
pt(202).paramname = 'X0';
pt(202).class     = 'scalar';
pt(202).nrows     = 1;
pt(202).ncols     = 1;
pt(202).subsource = 'SS_DOUBLE';
pt(202).ndims     = '2';
pt(202).size      = '[]';

pt(203).blockname = 'InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing3/Memory';
pt(203).paramname = 'X0';
pt(203).class     = 'scalar';
pt(203).nrows     = 1;
pt(203).ncols     = 1;
pt(203).subsource = 'SS_DOUBLE';
pt(203).ndims     = '2';
pt(203).size      = '[]';

pt(204).blockname = 'InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing3/Memory1';
pt(204).paramname = 'X0';
pt(204).class     = 'scalar';
pt(204).nrows     = 1;
pt(204).ncols     = 1;
pt(204).subsource = 'SS_DOUBLE';
pt(204).ndims     = '2';
pt(204).size      = '[]';

pt(205).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/UseOldPI';
pt(205).paramname = 'Value';
pt(205).class     = 'scalar';
pt(205).nrows     = 1;
pt(205).ncols     = 1;
pt(205).subsource = 'SS_DOUBLE';
pt(205).ndims     = '2';
pt(205).size      = '[]';

pt(206).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Discrete PID Controller1/Clamping circuit/ZeroGain';
pt(206).paramname = 'Gain';
pt(206).class     = 'scalar';
pt(206).nrows     = 1;
pt(206).ncols     = 1;
pt(206).subsource = 'SS_DOUBLE';
pt(206).ndims     = '2';
pt(206).size      = '[]';

pt(207).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/MessageCounter/Increment';
pt(207).paramname = 'Value';
pt(207).class     = 'scalar';
pt(207).nrows     = 1;
pt(207).ncols     = 1;
pt(207).subsource = 'SS_DOUBLE';
pt(207).ndims     = '2';
pt(207).size      = '[]';

pt(208).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/MessageCounter/Max Value';
pt(208).paramname = 'Value';
pt(208).class     = 'scalar';
pt(208).nrows     = 1;
pt(208).ncols     = 1;
pt(208).subsource = 'SS_DOUBLE';
pt(208).ndims     = '2';
pt(208).size      = '[]';

pt(209).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/MessageCounter/Reset Value';
pt(209).paramname = 'Value';
pt(209).class     = 'scalar';
pt(209).nrows     = 1;
pt(209).ncols     = 1;
pt(209).subsource = 'SS_DOUBLE';
pt(209).ndims     = '2';
pt(209).size      = '[]';

pt(210).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/MessageCounter/Reset Value1';
pt(210).paramname = 'Value';
pt(210).class     = 'scalar';
pt(210).nrows     = 1;
pt(210).ncols     = 1;
pt(210).subsource = 'SS_DOUBLE';
pt(210).ndims     = '2';
pt(210).size      = '[]';

pt(211).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/MessageCounter/Unit Delay';
pt(211).paramname = 'InitialCondition';
pt(211).class     = 'scalar';
pt(211).nrows     = 1;
pt(211).ncols     = 1;
pt(211).subsource = 'SS_DOUBLE';
pt(211).ndims     = '2';
pt(211).size      = '[]';

pt(212).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/MessageCounter/Unit Delay1';
pt(212).paramname = 'InitialCondition';
pt(212).class     = 'scalar';
pt(212).nrows     = 1;
pt(212).ncols     = 1;
pt(212).subsource = 'SS_DOUBLE';
pt(212).ndims     = '2';
pt(212).size      = '[]';

pt(213).blockname = 'InputProcessing/For Iterator Subsystem/EMS1Processing/EMS1Processing/EMS1 Processing/ErrProcessing/Memory';
pt(213).paramname = 'X0';
pt(213).class     = 'scalar';
pt(213).nrows     = 1;
pt(213).ncols     = 1;
pt(213).subsource = 'SS_DOUBLE';
pt(213).ndims     = '2';
pt(213).size      = '[]';

pt(214).blockname = 'InputProcessing/For Iterator Subsystem/EMS1Processing/EMS1Processing/EMS1 Processing/ErrProcessing/Memory1';
pt(214).paramname = 'X0';
pt(214).class     = 'scalar';
pt(214).nrows     = 1;
pt(214).ncols     = 1;
pt(214).subsource = 'SS_DOUBLE';
pt(214).ndims     = '2';
pt(214).size      = '[]';

pt(215).blockname = 'InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/ErrProcessing1/Memory';
pt(215).paramname = 'X0';
pt(215).class     = 'scalar';
pt(215).nrows     = 1;
pt(215).ncols     = 1;
pt(215).subsource = 'SS_DOUBLE';
pt(215).ndims     = '2';
pt(215).size      = '[]';

pt(216).blockname = 'InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/ErrProcessing1/Memory1';
pt(216).paramname = 'X0';
pt(216).class     = 'scalar';
pt(216).nrows     = 1;
pt(216).ncols     = 1;
pt(216).subsource = 'SS_DOUBLE';
pt(216).ndims     = '2';
pt(216).size      = '[]';

pt(217).blockname = 'InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/ErrProcessing2/Memory';
pt(217).paramname = 'X0';
pt(217).class     = 'scalar';
pt(217).nrows     = 1;
pt(217).ncols     = 1;
pt(217).subsource = 'SS_DOUBLE';
pt(217).ndims     = '2';
pt(217).size      = '[]';

pt(218).blockname = 'InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/ErrProcessing2/Memory1';
pt(218).paramname = 'X0';
pt(218).class     = 'scalar';
pt(218).nrows     = 1;
pt(218).ncols     = 1;
pt(218).subsource = 'SS_DOUBLE';
pt(218).ndims     = '2';
pt(218).size      = '[]';

pt(219).blockname = 'InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing/If Action Subsystem/Constant';
pt(219).paramname = 'Value';
pt(219).class     = 'scalar';
pt(219).nrows     = 1;
pt(219).ncols     = 1;
pt(219).subsource = 'SS_DOUBLE';
pt(219).ndims     = '2';
pt(219).size      = '[]';

pt(220).blockname = 'InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing/If Action Subsystem/Constant1';
pt(220).paramname = 'Value';
pt(220).class     = 'scalar';
pt(220).nrows     = 1;
pt(220).ncols     = 1;
pt(220).subsource = 'SS_DOUBLE';
pt(220).ndims     = '2';
pt(220).size      = '[]';

pt(221).blockname = 'InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing/If Action Subsystem1/Constant';
pt(221).paramname = 'Value';
pt(221).class     = 'scalar';
pt(221).nrows     = 1;
pt(221).ncols     = 1;
pt(221).subsource = 'SS_DOUBLE';
pt(221).ndims     = '2';
pt(221).size      = '[]';

pt(222).blockname = 'InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing/If Action Subsystem1/Constant1';
pt(222).paramname = 'Value';
pt(222).class     = 'scalar';
pt(222).nrows     = 1;
pt(222).ncols     = 1;
pt(222).subsource = 'SS_DOUBLE';
pt(222).ndims     = '2';
pt(222).size      = '[]';

pt(223).blockname = 'InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing/If Action Subsystem2/Constant';
pt(223).paramname = 'Value';
pt(223).class     = 'scalar';
pt(223).nrows     = 1;
pt(223).ncols     = 1;
pt(223).subsource = 'SS_DOUBLE';
pt(223).ndims     = '2';
pt(223).size      = '[]';

pt(224).blockname = 'InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing/If Action Subsystem2/Constant1';
pt(224).paramname = 'Value';
pt(224).class     = 'scalar';
pt(224).nrows     = 1;
pt(224).ncols     = 1;
pt(224).subsource = 'SS_DOUBLE';
pt(224).ndims     = '2';
pt(224).size      = '[]';

pt(225).blockname = 'InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing1/If Action Subsystem/Constant';
pt(225).paramname = 'Value';
pt(225).class     = 'scalar';
pt(225).nrows     = 1;
pt(225).ncols     = 1;
pt(225).subsource = 'SS_DOUBLE';
pt(225).ndims     = '2';
pt(225).size      = '[]';

pt(226).blockname = 'InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing1/If Action Subsystem/Constant1';
pt(226).paramname = 'Value';
pt(226).class     = 'scalar';
pt(226).nrows     = 1;
pt(226).ncols     = 1;
pt(226).subsource = 'SS_DOUBLE';
pt(226).ndims     = '2';
pt(226).size      = '[]';

pt(227).blockname = 'InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing1/If Action Subsystem1/Constant';
pt(227).paramname = 'Value';
pt(227).class     = 'scalar';
pt(227).nrows     = 1;
pt(227).ncols     = 1;
pt(227).subsource = 'SS_DOUBLE';
pt(227).ndims     = '2';
pt(227).size      = '[]';

pt(228).blockname = 'InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing1/If Action Subsystem1/Constant1';
pt(228).paramname = 'Value';
pt(228).class     = 'scalar';
pt(228).nrows     = 1;
pt(228).ncols     = 1;
pt(228).subsource = 'SS_DOUBLE';
pt(228).ndims     = '2';
pt(228).size      = '[]';

pt(229).blockname = 'InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing1/If Action Subsystem2/Constant';
pt(229).paramname = 'Value';
pt(229).class     = 'scalar';
pt(229).nrows     = 1;
pt(229).ncols     = 1;
pt(229).subsource = 'SS_DOUBLE';
pt(229).ndims     = '2';
pt(229).size      = '[]';

pt(230).blockname = 'InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing1/If Action Subsystem2/Constant1';
pt(230).paramname = 'Value';
pt(230).class     = 'scalar';
pt(230).nrows     = 1;
pt(230).ncols     = 1;
pt(230).subsource = 'SS_DOUBLE';
pt(230).ndims     = '2';
pt(230).size      = '[]';

pt(231).blockname = 'InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing2/If Action Subsystem/Constant';
pt(231).paramname = 'Value';
pt(231).class     = 'scalar';
pt(231).nrows     = 1;
pt(231).ncols     = 1;
pt(231).subsource = 'SS_DOUBLE';
pt(231).ndims     = '2';
pt(231).size      = '[]';

pt(232).blockname = 'InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing2/If Action Subsystem/Constant1';
pt(232).paramname = 'Value';
pt(232).class     = 'scalar';
pt(232).nrows     = 1;
pt(232).ncols     = 1;
pt(232).subsource = 'SS_DOUBLE';
pt(232).ndims     = '2';
pt(232).size      = '[]';

pt(233).blockname = 'InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing2/If Action Subsystem1/Constant';
pt(233).paramname = 'Value';
pt(233).class     = 'scalar';
pt(233).nrows     = 1;
pt(233).ncols     = 1;
pt(233).subsource = 'SS_DOUBLE';
pt(233).ndims     = '2';
pt(233).size      = '[]';

pt(234).blockname = 'InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing2/If Action Subsystem1/Constant1';
pt(234).paramname = 'Value';
pt(234).class     = 'scalar';
pt(234).nrows     = 1;
pt(234).ncols     = 1;
pt(234).subsource = 'SS_DOUBLE';
pt(234).ndims     = '2';
pt(234).size      = '[]';

pt(235).blockname = 'InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing2/If Action Subsystem2/Constant';
pt(235).paramname = 'Value';
pt(235).class     = 'scalar';
pt(235).nrows     = 1;
pt(235).ncols     = 1;
pt(235).subsource = 'SS_DOUBLE';
pt(235).ndims     = '2';
pt(235).size      = '[]';

pt(236).blockname = 'InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing2/If Action Subsystem2/Constant1';
pt(236).paramname = 'Value';
pt(236).class     = 'scalar';
pt(236).nrows     = 1;
pt(236).ncols     = 1;
pt(236).subsource = 'SS_DOUBLE';
pt(236).ndims     = '2';
pt(236).size      = '[]';

pt(237).blockname = 'InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing3/If Action Subsystem/Constant';
pt(237).paramname = 'Value';
pt(237).class     = 'scalar';
pt(237).nrows     = 1;
pt(237).ncols     = 1;
pt(237).subsource = 'SS_DOUBLE';
pt(237).ndims     = '2';
pt(237).size      = '[]';

pt(238).blockname = 'InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing3/If Action Subsystem/Constant1';
pt(238).paramname = 'Value';
pt(238).class     = 'scalar';
pt(238).nrows     = 1;
pt(238).ncols     = 1;
pt(238).subsource = 'SS_DOUBLE';
pt(238).ndims     = '2';
pt(238).size      = '[]';

pt(239).blockname = 'InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing3/If Action Subsystem1/Constant';
pt(239).paramname = 'Value';
pt(239).class     = 'scalar';
pt(239).nrows     = 1;
pt(239).ncols     = 1;
pt(239).subsource = 'SS_DOUBLE';
pt(239).ndims     = '2';
pt(239).size      = '[]';

pt(240).blockname = 'InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing3/If Action Subsystem1/Constant1';
pt(240).paramname = 'Value';
pt(240).class     = 'scalar';
pt(240).nrows     = 1;
pt(240).ncols     = 1;
pt(240).subsource = 'SS_DOUBLE';
pt(240).ndims     = '2';
pt(240).size      = '[]';

pt(241).blockname = 'InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing3/If Action Subsystem2/Constant';
pt(241).paramname = 'Value';
pt(241).class     = 'scalar';
pt(241).nrows     = 1;
pt(241).ncols     = 1;
pt(241).subsource = 'SS_DOUBLE';
pt(241).ndims     = '2';
pt(241).size      = '[]';

pt(242).blockname = 'InputProcessing/For Iterator Subsystem/WhlSpdProcessing/WhlSpd Processing/ErrProcessing3/If Action Subsystem2/Constant1';
pt(242).paramname = 'Value';
pt(242).class     = 'scalar';
pt(242).nrows     = 1;
pt(242).ncols     = 1;
pt(242).subsource = 'SS_DOUBLE';
pt(242).ndims     = '2';
pt(242).size      = '[]';

pt(243).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Control/Angle_gain';
pt(243).paramname = 'Gain';
pt(243).class     = 'scalar';
pt(243).nrows     = 1;
pt(243).ncols     = 1;
pt(243).subsource = 'SS_DOUBLE';
pt(243).ndims     = '2';
pt(243).size      = '[]';

pt(244).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Control/Gain';
pt(244).paramname = 'Gain';
pt(244).class     = 'scalar';
pt(244).nrows     = 1;
pt(244).ncols     = 1;
pt(244).subsource = 'SS_DOUBLE';
pt(244).ndims     = '2';
pt(244).size      = '[]';

pt(245).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Control/Gain1';
pt(245).paramname = 'Gain';
pt(245).class     = 'scalar';
pt(245).nrows     = 1;
pt(245).ncols     = 1;
pt(245).subsource = 'SS_DOUBLE';
pt(245).ndims     = '2';
pt(245).size      = '[]';

pt(246).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Control/SAS_Saturation1';
pt(246).paramname = 'UpperLimit';
pt(246).class     = 'scalar';
pt(246).nrows     = 1;
pt(246).ncols     = 1;
pt(246).subsource = 'SS_DOUBLE';
pt(246).ndims     = '2';
pt(246).size      = '[]';

pt(247).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Control/SAS_Saturation1';
pt(247).paramname = 'LowerLimit';
pt(247).class     = 'scalar';
pt(247).nrows     = 1;
pt(247).ncols     = 1;
pt(247).subsource = 'SS_DOUBLE';
pt(247).ndims     = '2';
pt(247).size      = '[]';

pt(248).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Control/SAS_Saturation1_old';
pt(248).paramname = 'UpperLimit';
pt(248).class     = 'scalar';
pt(248).nrows     = 1;
pt(248).ncols     = 1;
pt(248).subsource = 'SS_DOUBLE';
pt(248).ndims     = '2';
pt(248).size      = '[]';

pt(249).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Control/SAS_Saturation1_old';
pt(249).paramname = 'LowerLimit';
pt(249).class     = 'scalar';
pt(249).nrows     = 1;
pt(249).ncols     = 1;
pt(249).subsource = 'SS_DOUBLE';
pt(249).ndims     = '2';
pt(249).size      = '[]';

pt(250).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Control/SAS_Saturation2';
pt(250).paramname = 'UpperLimit';
pt(250).class     = 'scalar';
pt(250).nrows     = 1;
pt(250).ncols     = 1;
pt(250).subsource = 'SS_DOUBLE';
pt(250).ndims     = '2';
pt(250).size      = '[]';

pt(251).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Control/SAS_Saturation2';
pt(251).paramname = 'LowerLimit';
pt(251).class     = 'scalar';
pt(251).nrows     = 1;
pt(251).ncols     = 1;
pt(251).subsource = 'SS_DOUBLE';
pt(251).ndims     = '2';
pt(251).size      = '[]';

pt(252).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Control/SAS_Saturation2_old';
pt(252).paramname = 'UpperLimit';
pt(252).class     = 'scalar';
pt(252).nrows     = 1;
pt(252).ncols     = 1;
pt(252).subsource = 'SS_DOUBLE';
pt(252).ndims     = '2';
pt(252).size      = '[]';

pt(253).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Control/SAS_Saturation2_old';
pt(253).paramname = 'LowerLimit';
pt(253).class     = 'scalar';
pt(253).nrows     = 1;
pt(253).ncols     = 1;
pt(253).subsource = 'SS_DOUBLE';
pt(253).ndims     = '2';
pt(253).size      = '[]';

pt(254).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Control/Switch';
pt(254).paramname = 'Threshold';
pt(254).class     = 'scalar';
pt(254).nrows     = 1;
pt(254).ncols     = 1;
pt(254).subsource = 'SS_DOUBLE';
pt(254).ndims     = '2';
pt(254).size      = '[]';

pt(255).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Control/Switch1';
pt(255).paramname = 'Threshold';
pt(255).class     = 'scalar';
pt(255).nrows     = 1;
pt(255).ncols     = 1;
pt(255).subsource = 'SS_DOUBLE';
pt(255).ndims     = '2';
pt(255).size      = '[]';

pt(256).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Control/Integer Delay';
pt(256).paramname = 'DelayLength';
pt(256).class     = 'scalar';
pt(256).nrows     = 1;
pt(256).ncols     = 1;
pt(256).subsource = 'SS_UINT32';
pt(256).ndims     = '2';
pt(256).size      = '[]';

pt(257).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Control/Integer Delay';
pt(257).paramname = 'InitialCondition';
pt(257).class     = 'scalar';
pt(257).nrows     = 1;
pt(257).ncols     = 1;
pt(257).subsource = 'SS_DOUBLE';
pt(257).ndims     = '2';
pt(257).size      = '[]';

pt(258).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Control/Integer Delay1';
pt(258).paramname = 'DelayLength';
pt(258).class     = 'scalar';
pt(258).nrows     = 1;
pt(258).ncols     = 1;
pt(258).subsource = 'SS_UINT32';
pt(258).ndims     = '2';
pt(258).size      = '[]';

pt(259).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Control/Integer Delay1';
pt(259).paramname = 'InitialCondition';
pt(259).class     = 'scalar';
pt(259).nrows     = 1;
pt(259).ncols     = 1;
pt(259).subsource = 'SS_DOUBLE';
pt(259).ndims     = '2';
pt(259).size      = '[]';

pt(260).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Control/Integer Delay2';
pt(260).paramname = 'DelayLength';
pt(260).class     = 'scalar';
pt(260).nrows     = 1;
pt(260).ncols     = 1;
pt(260).subsource = 'SS_UINT32';
pt(260).ndims     = '2';
pt(260).size      = '[]';

pt(261).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Control/Integer Delay2';
pt(261).paramname = 'InitialCondition';
pt(261).class     = 'scalar';
pt(261).nrows     = 1;
pt(261).ncols     = 1;
pt(261).subsource = 'SS_DOUBLE';
pt(261).ndims     = '2';
pt(261).size      = '[]';

pt(262).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Speed_Control/Discrete-Time Integrator';
pt(262).paramname = 'gainval';
pt(262).class     = 'scalar';
pt(262).nrows     = 1;
pt(262).ncols     = 1;
pt(262).subsource = 'SS_DOUBLE';
pt(262).ndims     = '2';
pt(262).size      = '[]';

pt(263).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Speed_Control/Discrete-Time Integrator';
pt(263).paramname = 'InitialCondition';
pt(263).class     = 'scalar';
pt(263).nrows     = 1;
pt(263).ncols     = 1;
pt(263).subsource = 'SS_DOUBLE';
pt(263).ndims     = '2';
pt(263).size      = '[]';

pt(264).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Speed_Control/Discrete-Time Integrator';
pt(264).paramname = 'UpperSaturationLimit';
pt(264).class     = 'scalar';
pt(264).nrows     = 1;
pt(264).ncols     = 1;
pt(264).subsource = 'SS_DOUBLE';
pt(264).ndims     = '2';
pt(264).size      = '[]';

pt(265).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Speed_Control/Discrete-Time Integrator';
pt(265).paramname = 'LowerSaturationLimit';
pt(265).class     = 'scalar';
pt(265).nrows     = 1;
pt(265).ncols     = 1;
pt(265).subsource = 'SS_DOUBLE';
pt(265).ndims     = '2';
pt(265).size      = '[]';

pt(266).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Speed_Control/Gain1';
pt(266).paramname = 'Gain';
pt(266).class     = 'scalar';
pt(266).nrows     = 1;
pt(266).ncols     = 1;
pt(266).subsource = 'SS_DOUBLE';
pt(266).ndims     = '2';
pt(266).size      = '[]';

pt(267).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Speed_Control/Gain2';
pt(267).paramname = 'Gain';
pt(267).class     = 'scalar';
pt(267).nrows     = 1;
pt(267).ncols     = 1;
pt(267).subsource = 'SS_DOUBLE';
pt(267).ndims     = '2';
pt(267).size      = '[]';

pt(268).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Speed_Control/Gain3';
pt(268).paramname = 'Gain';
pt(268).class     = 'scalar';
pt(268).nrows     = 1;
pt(268).ncols     = 1;
pt(268).subsource = 'SS_DOUBLE';
pt(268).ndims     = '2';
pt(268).size      = '[]';

pt(269).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Speed_Control/SASSpeedSat1';
pt(269).paramname = 'UpperLimit';
pt(269).class     = 'scalar';
pt(269).nrows     = 1;
pt(269).ncols     = 1;
pt(269).subsource = 'SS_DOUBLE';
pt(269).ndims     = '2';
pt(269).size      = '[]';

pt(270).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Speed_Control/SASSpeedSat1';
pt(270).paramname = 'LowerLimit';
pt(270).class     = 'scalar';
pt(270).nrows     = 1;
pt(270).ncols     = 1;
pt(270).subsource = 'SS_DOUBLE';
pt(270).ndims     = '2';
pt(270).size      = '[]';

pt(271).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Speed_Control/SASSpeedSat1_old';
pt(271).paramname = 'UpperLimit';
pt(271).class     = 'scalar';
pt(271).nrows     = 1;
pt(271).ncols     = 1;
pt(271).subsource = 'SS_DOUBLE';
pt(271).ndims     = '2';
pt(271).size      = '[]';

pt(272).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Speed_Control/SASSpeedSat1_old';
pt(272).paramname = 'LowerLimit';
pt(272).class     = 'scalar';
pt(272).nrows     = 1;
pt(272).ncols     = 1;
pt(272).subsource = 'SS_DOUBLE';
pt(272).ndims     = '2';
pt(272).size      = '[]';

pt(273).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Speed_Control/SASSpeedSat2';
pt(273).paramname = 'UpperLimit';
pt(273).class     = 'scalar';
pt(273).nrows     = 1;
pt(273).ncols     = 1;
pt(273).subsource = 'SS_DOUBLE';
pt(273).ndims     = '2';
pt(273).size      = '[]';

pt(274).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Speed_Control/SASSpeedSat2';
pt(274).paramname = 'LowerLimit';
pt(274).class     = 'scalar';
pt(274).nrows     = 1;
pt(274).ncols     = 1;
pt(274).subsource = 'SS_DOUBLE';
pt(274).ndims     = '2';
pt(274).size      = '[]';

pt(275).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Speed_Control/SASSpeedSat2_old';
pt(275).paramname = 'UpperLimit';
pt(275).class     = 'scalar';
pt(275).nrows     = 1;
pt(275).ncols     = 1;
pt(275).subsource = 'SS_DOUBLE';
pt(275).ndims     = '2';
pt(275).size      = '[]';

pt(276).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Speed_Control/SASSpeedSat2_old';
pt(276).paramname = 'LowerLimit';
pt(276).class     = 'scalar';
pt(276).nrows     = 1;
pt(276).ncols     = 1;
pt(276).subsource = 'SS_DOUBLE';
pt(276).ndims     = '2';
pt(276).size      = '[]';

pt(277).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Speed_Control/Switch';
pt(277).paramname = 'Threshold';
pt(277).class     = 'scalar';
pt(277).nrows     = 1;
pt(277).ncols     = 1;
pt(277).subsource = 'SS_DOUBLE';
pt(277).ndims     = '2';
pt(277).size      = '[]';

pt(278).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/Tx_ADAS_data/Checksum_NEW/Constant1';
pt(278).paramname = 'Value';
pt(278).class     = 'scalar';
pt(278).nrows     = 1;
pt(278).ncols     = 1;
pt(278).subsource = 'SS_DOUBLE';
pt(278).ndims     = '2';
pt(278).size      = '[]';

pt(279).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/Tx_ADAS_data/Checksum_NEW/Constant2';
pt(279).paramname = 'Value';
pt(279).class     = 'scalar';
pt(279).nrows     = 1;
pt(279).ncols     = 1;
pt(279).subsource = 'SS_DOUBLE';
pt(279).ndims     = '2';
pt(279).size      = '[]';

pt(280).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/Tx_ADAS_data/Checksum_NEW/Constant3';
pt(280).paramname = 'Value';
pt(280).class     = 'scalar';
pt(280).nrows     = 1;
pt(280).ncols     = 1;
pt(280).subsource = 'SS_DOUBLE';
pt(280).ndims     = '2';
pt(280).size      = '[]';

pt(281).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/Tx_ADAS_data/Checksum_NEW/Constant4';
pt(281).paramname = 'Value';
pt(281).class     = 'scalar';
pt(281).nrows     = 1;
pt(281).ncols     = 1;
pt(281).subsource = 'SS_DOUBLE';
pt(281).ndims     = '2';
pt(281).size      = '[]';

pt(282).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/Tx_ADAS_data/Checksum_NEW/Offset';
pt(282).paramname = 'Value';
pt(282).class     = 'scalar';
pt(282).nrows     = 1;
pt(282).ncols     = 1;
pt(282).subsource = 'SS_DOUBLE';
pt(282).ndims     = '2';
pt(282).size      = '[]';

pt(283).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/Tx_ADAS_data/Checksum_NEW/Gain';
pt(283).paramname = 'Gain';
pt(283).class     = 'scalar';
pt(283).nrows     = 1;
pt(283).ncols     = 1;
pt(283).subsource = 'SS_DOUBLE';
pt(283).ndims     = '2';
pt(283).size      = '[]';

pt(284).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/TxLKAS2CAN/Tx_ADAS_data/Checksum_NEW/Bitwise Operator2';
pt(284).paramname = 'BitMask';
pt(284).class     = 'scalar';
pt(284).nrows     = 1;
pt(284).ncols     = 1;
pt(284).subsource = 'SS_UINT16';
pt(284).ndims     = '2';
pt(284).size      = '[]';

pt(285).blockname = 'InputProcessing/For Iterator Subsystem/EMS1Processing/EMS1Processing/EMS1 Processing/ErrProcessing/If Action Subsystem/Constant';
pt(285).paramname = 'Value';
pt(285).class     = 'scalar';
pt(285).nrows     = 1;
pt(285).ncols     = 1;
pt(285).subsource = 'SS_DOUBLE';
pt(285).ndims     = '2';
pt(285).size      = '[]';

pt(286).blockname = 'InputProcessing/For Iterator Subsystem/EMS1Processing/EMS1Processing/EMS1 Processing/ErrProcessing/If Action Subsystem/Constant1';
pt(286).paramname = 'Value';
pt(286).class     = 'scalar';
pt(286).nrows     = 1;
pt(286).ncols     = 1;
pt(286).subsource = 'SS_DOUBLE';
pt(286).ndims     = '2';
pt(286).size      = '[]';

pt(287).blockname = 'InputProcessing/For Iterator Subsystem/EMS1Processing/EMS1Processing/EMS1 Processing/ErrProcessing/If Action Subsystem1/Constant';
pt(287).paramname = 'Value';
pt(287).class     = 'scalar';
pt(287).nrows     = 1;
pt(287).ncols     = 1;
pt(287).subsource = 'SS_DOUBLE';
pt(287).ndims     = '2';
pt(287).size      = '[]';

pt(288).blockname = 'InputProcessing/For Iterator Subsystem/EMS1Processing/EMS1Processing/EMS1 Processing/ErrProcessing/If Action Subsystem1/Constant1';
pt(288).paramname = 'Value';
pt(288).class     = 'scalar';
pt(288).nrows     = 1;
pt(288).ncols     = 1;
pt(288).subsource = 'SS_DOUBLE';
pt(288).ndims     = '2';
pt(288).size      = '[]';

pt(289).blockname = 'InputProcessing/For Iterator Subsystem/EMS1Processing/EMS1Processing/EMS1 Processing/ErrProcessing/If Action Subsystem2/Constant';
pt(289).paramname = 'Value';
pt(289).class     = 'scalar';
pt(289).nrows     = 1;
pt(289).ncols     = 1;
pt(289).subsource = 'SS_DOUBLE';
pt(289).ndims     = '2';
pt(289).size      = '[]';

pt(290).blockname = 'InputProcessing/For Iterator Subsystem/EMS1Processing/EMS1Processing/EMS1 Processing/ErrProcessing/If Action Subsystem2/Constant1';
pt(290).paramname = 'Value';
pt(290).class     = 'scalar';
pt(290).nrows     = 1;
pt(290).ncols     = 1;
pt(290).subsource = 'SS_DOUBLE';
pt(290).ndims     = '2';
pt(290).size      = '[]';

pt(291).blockname = 'InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/ErrProcessing1/If Action Subsystem/Constant';
pt(291).paramname = 'Value';
pt(291).class     = 'scalar';
pt(291).nrows     = 1;
pt(291).ncols     = 1;
pt(291).subsource = 'SS_DOUBLE';
pt(291).ndims     = '2';
pt(291).size      = '[]';

pt(292).blockname = 'InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/ErrProcessing1/If Action Subsystem/Constant1';
pt(292).paramname = 'Value';
pt(292).class     = 'scalar';
pt(292).nrows     = 1;
pt(292).ncols     = 1;
pt(292).subsource = 'SS_DOUBLE';
pt(292).ndims     = '2';
pt(292).size      = '[]';

pt(293).blockname = 'InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/ErrProcessing1/If Action Subsystem1/Constant';
pt(293).paramname = 'Value';
pt(293).class     = 'scalar';
pt(293).nrows     = 1;
pt(293).ncols     = 1;
pt(293).subsource = 'SS_DOUBLE';
pt(293).ndims     = '2';
pt(293).size      = '[]';

pt(294).blockname = 'InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/ErrProcessing1/If Action Subsystem1/Constant1';
pt(294).paramname = 'Value';
pt(294).class     = 'scalar';
pt(294).nrows     = 1;
pt(294).ncols     = 1;
pt(294).subsource = 'SS_DOUBLE';
pt(294).ndims     = '2';
pt(294).size      = '[]';

pt(295).blockname = 'InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/ErrProcessing1/If Action Subsystem2/Constant';
pt(295).paramname = 'Value';
pt(295).class     = 'scalar';
pt(295).nrows     = 1;
pt(295).ncols     = 1;
pt(295).subsource = 'SS_DOUBLE';
pt(295).ndims     = '2';
pt(295).size      = '[]';

pt(296).blockname = 'InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/ErrProcessing1/If Action Subsystem2/Constant1';
pt(296).paramname = 'Value';
pt(296).class     = 'scalar';
pt(296).nrows     = 1;
pt(296).ncols     = 1;
pt(296).subsource = 'SS_DOUBLE';
pt(296).ndims     = '2';
pt(296).size      = '[]';

pt(297).blockname = 'InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/ErrProcessing2/If Action Subsystem/Constant';
pt(297).paramname = 'Value';
pt(297).class     = 'scalar';
pt(297).nrows     = 1;
pt(297).ncols     = 1;
pt(297).subsource = 'SS_DOUBLE';
pt(297).ndims     = '2';
pt(297).size      = '[]';

pt(298).blockname = 'InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/ErrProcessing2/If Action Subsystem/Constant1';
pt(298).paramname = 'Value';
pt(298).class     = 'scalar';
pt(298).nrows     = 1;
pt(298).ncols     = 1;
pt(298).subsource = 'SS_DOUBLE';
pt(298).ndims     = '2';
pt(298).size      = '[]';

pt(299).blockname = 'InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/ErrProcessing2/If Action Subsystem1/Constant';
pt(299).paramname = 'Value';
pt(299).class     = 'scalar';
pt(299).nrows     = 1;
pt(299).ncols     = 1;
pt(299).subsource = 'SS_DOUBLE';
pt(299).ndims     = '2';
pt(299).size      = '[]';

pt(300).blockname = 'InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/ErrProcessing2/If Action Subsystem1/Constant1';
pt(300).paramname = 'Value';
pt(300).class     = 'scalar';
pt(300).nrows     = 1;
pt(300).ncols     = 1;
pt(300).subsource = 'SS_DOUBLE';
pt(300).ndims     = '2';
pt(300).size      = '[]';

pt(301).blockname = 'InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/ErrProcessing2/If Action Subsystem2/Constant';
pt(301).paramname = 'Value';
pt(301).class     = 'scalar';
pt(301).nrows     = 1;
pt(301).ncols     = 1;
pt(301).subsource = 'SS_DOUBLE';
pt(301).ndims     = '2';
pt(301).size      = '[]';

pt(302).blockname = 'InputProcessing/For Iterator Subsystem/SAS1Processing/SAS1Processing/SAS1 Processing/ErrProcessing2/If Action Subsystem2/Constant1';
pt(302).paramname = 'Value';
pt(302).class     = 'scalar';
pt(302).nrows     = 1;
pt(302).ncols     = 1;
pt(302).subsource = 'SS_DOUBLE';
pt(302).ndims     = '2';
pt(302).size      = '[]';

pt(303).blockname = 'OutputProcessing/VehicleCanProcessing/LKAS2/Angle 2 Torque/PI controller/SAS_Speed_Control/Compare To Zero/Constant';
pt(303).paramname = 'Value';
pt(303).class     = 'scalar';
pt(303).nrows     = 1;
pt(303).ncols     = 1;
pt(303).subsource = 'SS_DOUBLE';
pt(303).ndims     = '2';
pt(303).size      = '[]';

function len = getlenPT
len = 303;

