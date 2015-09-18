function count = CountTimes(mode_sim, driver_state, x_to_middle_sim, d_to_frontobs_sim, control_sim, howtocount)

if(howtocount == 'IncludeSafeAndUnsafe')
	NoObsDrState1SafeCount = sum((mode_sim ==1)   & (driver_state==1) & (abs(x_to_middle_sim)<1.7) & (control_sim == 2));
	NoObsDrState1UnsafeCount = sum((mode_sim ==1) & (driver_state==1) & (abs(x_to_middle_sim)>1.7) & (control_sim == 2));
	NoObsDrState2SafeCount = sum((mode_sim ==1)   & (driver_state==2) & (abs(x_to_middle_sim)<1.7) & (control_sim == 2));
	NoObsDrState2UnsafeCount = sum((mode_sim ==1) & (driver_state==2) & (abs(x_to_middle_sim)>1.7) & (control_sim == 2));
	NoObsDrState3SafeCount = sum((mode_sim ==1)   & (driver_state==3) & (abs(x_to_middle_sim)<1.7) & (control_sim == 2));
	NoObsDrState3UnsafeCount = sum((mode_sim ==1) & (driver_state==3) & (abs(x_to_middle_sim)>1.7) & (control_sim == 2));

	ObsDrState1SafeCount = sum((mode_sim ==2)   & (driver_state==1) & (d_to_frontobs_sim>20) & (control_sim == 2));
	ObsDrState1UnsafeCount = sum((mode_sim ==2) & (driver_state==1) & (d_to_frontobs_sim<20) & (control_sim == 2));
	ObsDrState2SafeCount = sum((mode_sim ==2)   & (driver_state==2) & (d_to_frontobs_sim>20) & (control_sim == 2));
	ObsDrState2UnsafeCount = sum((mode_sim ==2) & (driver_state==2) & (d_to_frontobs_sim<20) & (control_sim == 2));
	ObsDrState3SafeCount = sum((mode_sim ==2)   & (driver_state==3) & (d_to_frontobs_sim>20) & (control_sim == 2));
	ObsDrState3UnafeCount = sum((mode_sim ==2)  & (driver_state==3) & (d_to_frontobs_sim<20) & (control_sim == 2));		
	
	count = [NoObsDrState1SafeCount, NoObsDrState1UnsafeCount, NoObsDrState2SafeCount, NoObsDrState2UnsafeCount,NoObsDrState3SafeCount,NoObsDrState3UnsafeCount
             ObsDrState1SafeCount, ObsDrState1UnsafeCount, ObsDrState2SafeCount,ObsDrState2UnsafeCount, ObsDrState3SafeCount, ObsDrState3UnafeCount]*0.025;

elseif(howtocount == 'ExcludeSafeAndUnsafe')
	NoObsDrState1Count = sum((mode_sim ==1) & (driver_state==1) & (control_sim == 2));
	NoObsDrState2Count = sum((mode_sim ==1) & (driver_state==2) & (control_sim == 2));
	NoObsDrState3Count = sum((mode_sim ==1) & (driver_state==3) & (control_sim == 2));
	ObsDrState1Count = sum((mode_sim ==2) & (driver_state==1) & (control_sim == 2));
	ObsDrState2Count = sum((mode_sim ==2) & (driver_state==2) & (control_sim == 2));
	ObsDrState3Count = sum((mode_sim ==2) & (driver_state==3) & (control_sim == 2));	
	count = [NoObsDrState1Count, NoObsDrState2Count, NoObsDrState3Count, ObsDrState1Count, ObsDrState2Count, ObsDrState3Count]*0.025;

else
	count = 0;	
end

end