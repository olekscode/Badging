Class {
	#name : #BadgingPlanner,
	#superclass : #Object,
	#instVars : [
		'goToLunchTime',
		'returnFromLunchTime',
		'arrivalTime'
	],
	#category : #Badging
}

{ #category : #constants }
BadgingPlanner class >> anticipatedLunchDuration [
	
	^ 1 hour
]

{ #category : #constants }
BadgingPlanner class >> busSchedules [
	
	^ {
		'16:01' .
		'16:48' .
		'17:45' .
		'18:31' .
		'19:16'.
		'20:01'
	} collect: [ :each | each asTime ].
]

{ #category : #constants }
BadgingPlanner class >> requiredInOfficeDuration [
	
	^ '7:30' asTime asDuration
]

{ #category : #constants }
BadgingPlanner class >> walkingToBusDuration [
	
	^ 5 minutes
]

{ #category : #accessing }
BadgingPlanner >> arrivalTime: aTime [ 
	
	arrivalTime := aTime
]

{ #category : #calculation }
BadgingPlanner >> canLeaveTime [
	
	^ (arrivalTime asDateAndTime + self class requiredInOfficeDuration + self lunchDuration) asTime
]

{ #category : #accessing }
BadgingPlanner >> goToLunchTime: aTime [ 
	
	goToLunchTime := aTime
]

{ #category : #calculation }
BadgingPlanner >> inOfficeDurationIfLeaveAt: aTime [ 
	
	^ aTime asDateAndTime - arrivalTime - self lunchDuration
]

{ #category : #calculation }
BadgingPlanner >> lunchDuration [
	
	(goToLunchTime isNil or: [ returnFromLunchTime isNil ]) ifTrue: [ 
		^ self class anticipatedLunchDuration ].
	
	^ returnFromLunchTime asDateAndTime - goToLunchTime
]

{ #category : #accessing }
BadgingPlanner >> returnFromLunchTime: aTime [ 
	
	returnFromLunchTime := aTime
]

{ #category : #calculation }
BadgingPlanner >> timeCreditIfLeaveAt: aTime [ 
	
	^ (self inOfficeDurationIfLeaveAt: aTime) - self class requiredInOfficeDuration
]
