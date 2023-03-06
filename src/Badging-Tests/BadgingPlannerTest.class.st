Class {
	#name : #BadgingPlannerTest,
	#superclass : #TestCase,
	#category : #'Badging-Tests'
}

{ #category : #tests }
BadgingPlannerTest >> testAnticipatedLunchDuration [

	self assert: BadgingPlanner anticipatedLunchDuration class equals: Duration
]

{ #category : #tests }
BadgingPlannerTest >> testBusSchedules [

	self assert: BadgingPlanner busSchedules isNotEmpty.
	self assert: BadgingPlanner busSchedules anyOne class equals: Time
]

{ #category : #tests }
BadgingPlannerTest >> testCanLeaveTime [

	| planner |
	planner := BadgingPlanner new.
	
	planner
		arrivalTime: '08:20' asTime;
		goToLunchTime: '12:30' asTime;
		returnFromLunchTime: '13:20' asTime.
	
	self assert: planner canLeaveTime equals: '16:40' asTime.
]

{ #category : #tests }
BadgingPlannerTest >> testInOfficeDurationIfLeaveAt [

	| planner inOfficeDuration |
	planner := BadgingPlanner new.
	
	planner
		arrivalTime: '08:20' asTime;
		goToLunchTime: '12:30' asTime;
		returnFromLunchTime: '13:20' asTime.
		
	inOfficeDuration := planner inOfficeDurationIfLeaveAt: '17:30' asTime.
	
	self assert: inOfficeDuration equals: (8 hours + 20 minutes).
]

{ #category : #tests }
BadgingPlannerTest >> testLunchDuration [

	| planner |
	planner := BadgingPlanner new.
	
	planner goToLunchTime: '12:30' asTime.
	planner returnFromLunchTime: '13:20' asTime.
	
	self assert: planner lunchDuration equals: 50 minutes.
]

{ #category : #tests }
BadgingPlannerTest >> testLunchDurationBeforeLunch [

	| planner |
	planner := BadgingPlanner new.
	
	self assert: planner lunchDuration equals: BadgingPlanner anticipatedLunchDuration.
]

{ #category : #tests }
BadgingPlannerTest >> testLunchDurationNoReturnTime [

	| planner |
	planner := BadgingPlanner new.
	planner goToLunchTime: '12:30' asTime.
	
	self assert: planner lunchDuration equals: BadgingPlanner anticipatedLunchDuration.
]

{ #category : #tests }
BadgingPlannerTest >> testRequiredInOfficeDuration [

	self assert: BadgingPlanner requiredInOfficeDuration class equals: Duration
]

{ #category : #tests }
BadgingPlannerTest >> testTimeCreditIfLeaveAt [

	| planner timeCredit |
	planner := BadgingPlanner new.
	
	planner
		arrivalTime: '08:20' asTime;
		goToLunchTime: '12:30' asTime;
		returnFromLunchTime: '13:20' asTime.
		
	timeCredit := planner timeCreditIfLeaveAt: '17:30' asTime.
	
	self assert: timeCredit equals: 50 minutes.
]

{ #category : #tests }
BadgingPlannerTest >> testTimeCreditIfLeaveAtNegative [

	| planner timeCredit |
	planner := BadgingPlanner new.
	
	planner
		arrivalTime: '08:20' asTime;
		goToLunchTime: '12:30' asTime;
		returnFromLunchTime: '13:20' asTime.
		
	timeCredit := planner timeCreditIfLeaveAt: '16:30' asTime.
	
	self assert: timeCredit equals: -10 minutes.
]

{ #category : #tests }
BadgingPlannerTest >> testWalkingToBusDuration [

	self assert: BadgingPlanner walkingToBusDuration class equals: Duration
]
