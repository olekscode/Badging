# Badging

```st
planner := BadgingPlanner new
	arrivalTime: '09:15' asTime;
	goToLunchTime: '12:05' asTime;
	returnFromLunchTime: '12:21' asTime;
	yourself.

Transcript open; clear.
Transcript
	show: 'I can leave at ';
	show: planner canLeaveTime;
	cr; cr.

BadgingPlanner busSchedules do: [ :busDepartureTime |
	leaveTime := (busDepartureTime asDateAndTime - BadgingPlanner walkingToBusDuration) asTime.
	timeCredit := planner timeCreditIfLeaveAt: leaveTime.
	
	Transcript
		show: leaveTime;
		show: ' ---> ';
		show: timeCredit;
		cr ].
```
