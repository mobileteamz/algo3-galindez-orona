!classDefinition: #MarsRoverTests category: 'Mars-Rover'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRoverTests methodsFor: 'testing' stamp: 'iO 5/30/2022 00:06:53'!
test01Initialization
	| newRover |	
	newRover := MarsRover new initWith:0@0 and:'N'.	
	
	self assert: newRover currentCardinalPoint equals:'N'.
	self assert: newRover currentPoint = (0@0).
	! !

!MarsRoverTests methodsFor: 'testing' stamp: 'iO 5/30/2022 14:39:17'!
test02testFoward
	| newRover  somePoint|	
	
	newRover := MarsRover new initWith:0@0 and:$N.	
	newRover executeCommand: 'f'.
	
	somePoint := newRover currentPoint.
	
	self assert: newRover currentPoint equals: (0@1).
	! !

!MarsRoverTests methodsFor: 'testing' stamp: 'iO 5/30/2022 00:46:27'!
test03testBackwards
	| newRover  somePoint|	
	
	newRover := MarsRover new initWith:0@0 and:'N'.	
	newRover executeCommand: 'b'.
	
	somePoint := newRover currentPoint.
	
	self assert: newRover currentPoint equals: (0@-1).
	! !

!MarsRoverTests methodsFor: 'testing' stamp: 'iO 5/30/2022 14:46:04'!
test04rotateClockwise
	| newRover  currentCardinalPoint|	
	
	newRover := MarsRover new initWith:0@0 and:$N.	
	newRover executeCommand: 'r'.
	
	
	currentCardinalPoint := newRover currentCardinalPoint .
	
	self assert: newRover currentCardinalPoint equals: $E.
	! !

!MarsRoverTests methodsFor: 'testing' stamp: 'iO 5/30/2022 14:46:25'!
test05rotateAntiClockwise
	| newRover |	
	
	newRover := MarsRover new initWith:0@0 and:$N.	
	newRover executeCommand: 'l'.
	
	self assert: newRover currentCardinalPoint equals: $W.
	! !

!MarsRoverTests methodsFor: 'testing' stamp: 'iO 5/30/2022 14:39:33'!
test06path
	| newRover |	
	
	newRover := MarsRover new initWith:0@0 and:$N.	
	newRover executeCommand: 'ffffl'.
	
	self assert: newRover currentCardinalPoint equals: $W.
	self assert: newRover currentPoint equals: (0@4).
	! !

!MarsRoverTests methodsFor: 'testing' stamp: 'iO 5/30/2022 14:40:18'!
test07moreComplexPath
	| newRover |	
	
	newRover := MarsRover new initWith:0@0 and:$N.	
	newRover executeCommand: 'fffflffff'.
	
	self assert: newRover currentCardinalPoint equals: $W.
	self assert: newRover currentPoint equals: (-4@4).
	! !

!MarsRoverTests methodsFor: 'testing' stamp: 'iO 5/30/2022 14:48:27'!
test08notSoComplexPath
	| newRover |	
	
	newRover := MarsRover new initWith:0@0 and:$N.	
	newRover executeCommand: 'lffff'.
	
	self assert: newRover currentCardinalPoint equals: $W.
	self assert: newRover currentPoint equals: (-4@0).
	! !

!MarsRoverTests methodsFor: 'testing' stamp: 'iO 5/30/2022 14:50:47'!
test09ComplexPath
	| newRover |	
	
	newRover := MarsRover new initWith:0@0 and:$N.	
	newRover executeCommand: 'ffffflffflffffb'.
	
	self assert: newRover currentCardinalPoint equals: $S.
	self assert: newRover currentPoint equals: (-3@1).
	! !


!classDefinition: #MarsRover category: 'Mars-Rover'!
Object subclass: #MarsRover
	instanceVariableNames: 'theCurrentPoint theCurrentCardinalPoint forward'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRover methodsFor: 'initialization' stamp: 'iO 5/30/2022 00:05:55'!
initWith: initialPoint and: cardinalPoint
	theCurrentPoint := initialPoint.
	theCurrentCardinalPoint := cardinalPoint.! !


!MarsRover methodsFor: 'accessing' stamp: 'iO 5/30/2022 00:06:33'!
currentCardinalPoint
	^ theCurrentCardinalPoint.! !

!MarsRover methodsFor: 'accessing' stamp: 'iO 5/29/2022 21:59:56'!
currentPoint
	^ theCurrentPoint.! !


!MarsRover methodsFor: 'evaluating' stamp: 'iO 5/29/2022 22:41:54'!
executeCommand: aCommand
	aCommand do: [ :aLetter | self resolveCommand: aLetter]. ! !

!MarsRover methodsFor: 'evaluating' stamp: 'iO 5/30/2022 00:40:29'!
resolveCommand: aCommand
	(self class allSubclasses) do: [ :aSubclass | ((aSubclass canHandle:aCommand) & (aSubclass respondsToInitialCardinalPoint: (self currentCardinalPoint))) ifTrue: [
			theCurrentPoint  := ((self currentPoint) x + (aSubclass value) x) @ ((self currentPoint) y + (aSubclass value) y).  
			theCurrentCardinalPoint := aSubclass newCardinalPoint: (self currentCardinalPoint).
			^self. ].
			].! !


!classDefinition: #Backwards category: 'Mars-Rover'!
MarsRover subclass: #Backwards
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Backwards class' category: 'Mars-Rover'!
Backwards class
	instanceVariableNames: ''!

!Backwards class methodsFor: 'functionality' stamp: 'iO 5/29/2022 23:49:10'!
canHandle: aCommand
	^(aCommand = $b).! !

!Backwards class methodsFor: 'functionality' stamp: 'iO 5/30/2022 00:15:08'!
newCardinalPoint: aCardinalPoint
	^aCardinalPoint.! !

!Backwards class methodsFor: 'functionality' stamp: 'iO 5/29/2022 23:49:04'!
respondsToInitialCardinalPoint: aPoint
	^ false.! !


!Backwards class methodsFor: 'as yet unclassified' stamp: 'iO 5/29/2022 23:51:21'!
value
	^(0@-1).! !


!classDefinition: #BackwardsPointingTowardsEast category: 'Mars-Rover'!
Backwards subclass: #BackwardsPointingTowardsEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BackwardsPointingTowardsEast class' category: 'Mars-Rover'!
BackwardsPointingTowardsEast class
	instanceVariableNames: ''!

!BackwardsPointingTowardsEast class methodsFor: 'accessing' stamp: 'iO 5/30/2022 00:10:50'!
newCardinalPoint
	^$E.! !

!BackwardsPointingTowardsEast class methodsFor: 'accessing' stamp: 'iO 5/29/2022 23:53:02'!
respondsToInitialCardinalPoint: anInitialCardinalPoint
	^anInitialCardinalPoint = 'E'.! !

!BackwardsPointingTowardsEast class methodsFor: 'accessing' stamp: 'iO 5/29/2022 23:53:30'!
value
	^(-1@0).! !


!classDefinition: #BackwardsPointingTowardsNorth category: 'Mars-Rover'!
Backwards subclass: #BackwardsPointingTowardsNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BackwardsPointingTowardsNorth class' category: 'Mars-Rover'!
BackwardsPointingTowardsNorth class
	instanceVariableNames: ''!

!BackwardsPointingTowardsNorth class methodsFor: 'accessing' stamp: 'iO 5/30/2022 00:11:00'!
newCardinalPoint
	^$N.! !

!BackwardsPointingTowardsNorth class methodsFor: 'accessing' stamp: 'iO 5/29/2022 23:51:03'!
respondsToInitialCardinalPoint: anInitialCardinalPoint
	^anInitialCardinalPoint = 'N'.! !

!BackwardsPointingTowardsNorth class methodsFor: 'accessing' stamp: 'iO 5/29/2022 23:52:11'!
value
	^(0@-1).! !


!classDefinition: #BackwardsPointingTowardsSouth category: 'Mars-Rover'!
Backwards subclass: #BackwardsPointingTowardsSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BackwardsPointingTowardsSouth class' category: 'Mars-Rover'!
BackwardsPointingTowardsSouth class
	instanceVariableNames: ''!

!BackwardsPointingTowardsSouth class methodsFor: 'accessing' stamp: 'iO 5/30/2022 00:11:10'!
newCardinalPoint
	^$S.! !

!BackwardsPointingTowardsSouth class methodsFor: 'accessing' stamp: 'iO 5/29/2022 23:53:12'!
respondsToInitialCardinalPoint: anInitialCardinalPoint
	^anInitialCardinalPoint = 'S'.! !

!BackwardsPointingTowardsSouth class methodsFor: 'accessing' stamp: 'iO 5/29/2022 23:52:41'!
value
	^(0@1).! !


!classDefinition: #BackwardsPointingTowardsWest category: 'Mars-Rover'!
Backwards subclass: #BackwardsPointingTowardsWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BackwardsPointingTowardsWest class' category: 'Mars-Rover'!
BackwardsPointingTowardsWest class
	instanceVariableNames: ''!

!BackwardsPointingTowardsWest class methodsFor: 'accessing' stamp: 'iO 5/30/2022 00:11:17'!
newCardinalPoint
	^$W.! !

!BackwardsPointingTowardsWest class methodsFor: 'accessing' stamp: 'iO 5/29/2022 23:53:50'!
respondsToInitialCardinalPoint: anInitialCardinalPoint
	^anInitialCardinalPoint = 'W'.! !

!BackwardsPointingTowardsWest class methodsFor: 'accessing' stamp: 'iO 5/29/2022 23:53:57'!
value
	^(0@-1).! !


!classDefinition: #Foward category: 'Mars-Rover'!
MarsRover subclass: #Foward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Foward class' category: 'Mars-Rover'!
Foward class
	instanceVariableNames: ''!

!Foward class methodsFor: 'functionality' stamp: 'iO 5/29/2022 23:36:10'!
canHandle: aCommand
	^(aCommand = $f).! !

!Foward class methodsFor: 'functionality' stamp: 'iO 5/30/2022 00:15:52'!
newCardinalPoint: aCardinalPoint
	^aCardinalPoint.! !

!Foward class methodsFor: 'functionality' stamp: 'iO 5/29/2022 22:19:42'!
respondsToInitialCardinalPoint: aPoint
	^ false.! !


!classDefinition: #FowardPointingTowardsEast category: 'Mars-Rover'!
Foward subclass: #FowardPointingTowardsEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FowardPointingTowardsEast class' category: 'Mars-Rover'!
FowardPointingTowardsEast class
	instanceVariableNames: ''!

!FowardPointingTowardsEast class methodsFor: 'accessing' stamp: 'iO 5/30/2022 00:11:26'!
newCardinalPoint
	^$E.! !

!FowardPointingTowardsEast class methodsFor: 'accessing' stamp: 'iO 5/30/2022 14:37:25'!
respondsToInitialCardinalPoint: anInitialCardinalPoint
	^anInitialCardinalPoint = $E.! !

!FowardPointingTowardsEast class methodsFor: 'accessing' stamp: 'iO 5/29/2022 23:47:58'!
value
	^(1@0).! !


!classDefinition: #FowardPointingTowardsNorth category: 'Mars-Rover'!
Foward subclass: #FowardPointingTowardsNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FowardPointingTowardsNorth class' category: 'Mars-Rover'!
FowardPointingTowardsNorth class
	instanceVariableNames: ''!

!FowardPointingTowardsNorth class methodsFor: 'accessing' stamp: 'iO 5/30/2022 00:11:38'!
newCardinalPoint
	^$N.! !

!FowardPointingTowardsNorth class methodsFor: 'accessing' stamp: 'iO 5/30/2022 14:37:19'!
respondsToInitialCardinalPoint: anInitialCardinalPoint
	^anInitialCardinalPoint = $N.! !

!FowardPointingTowardsNorth class methodsFor: 'accessing' stamp: 'iO 5/29/2022 23:42:18'!
value
	^(0@1).! !


!classDefinition: #FowardPointingTowardsSouth category: 'Mars-Rover'!
Foward subclass: #FowardPointingTowardsSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FowardPointingTowardsSouth class' category: 'Mars-Rover'!
FowardPointingTowardsSouth class
	instanceVariableNames: ''!

!FowardPointingTowardsSouth class methodsFor: 'accessing' stamp: 'iO 5/30/2022 00:11:50'!
newCardinalPoint
	^$S.! !

!FowardPointingTowardsSouth class methodsFor: 'accessing' stamp: 'iO 5/30/2022 14:37:12'!
respondsToInitialCardinalPoint: anInitialCardinalPoint
	^anInitialCardinalPoint = $S.! !

!FowardPointingTowardsSouth class methodsFor: 'accessing' stamp: 'iO 5/29/2022 23:46:11'!
value
	^(0@-1).! !


!classDefinition: #FowardPointingTowardsWest category: 'Mars-Rover'!
Foward subclass: #FowardPointingTowardsWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FowardPointingTowardsWest class' category: 'Mars-Rover'!
FowardPointingTowardsWest class
	instanceVariableNames: ''!

!FowardPointingTowardsWest class methodsFor: 'accessing' stamp: 'iO 5/30/2022 00:12:01'!
newCardinalPoint
	^$W.! !

!FowardPointingTowardsWest class methodsFor: 'accessing' stamp: 'iO 5/30/2022 14:36:56'!
respondsToInitialCardinalPoint: anInitialCardinalPoint
	^anInitialCardinalPoint = $W.! !

!FowardPointingTowardsWest class methodsFor: 'accessing' stamp: 'iO 5/29/2022 23:48:16'!
value
	^(-1@0).! !


!classDefinition: #RotateAntiClockwise category: 'Mars-Rover'!
MarsRover subclass: #RotateAntiClockwise
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RotateAntiClockwise class' category: 'Mars-Rover'!
RotateAntiClockwise class
	instanceVariableNames: ''!

!RotateAntiClockwise class methodsFor: 'accessing' stamp: 'iO 5/30/2022 00:33:17'!
canHandle: aCommand
	^(aCommand = $l).! !


!RotateAntiClockwise class methodsFor: 'as yet unclassified' stamp: 'iO 5/30/2022 00:22:16'!
newCardinalPoint: aCardinalPoint
	^aCardinalPoint.! !

!RotateAntiClockwise class methodsFor: 'as yet unclassified' stamp: 'iO 5/30/2022 00:22:16'!
respondsToInitialCardinalPoint: aPoint
	^ false.! !


!classDefinition: #RotateAntiClockwisePoitingTowardsEast category: 'Mars-Rover'!
RotateAntiClockwise subclass: #RotateAntiClockwisePoitingTowardsEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RotateAntiClockwisePoitingTowardsEast class' category: 'Mars-Rover'!
RotateAntiClockwisePoitingTowardsEast class
	instanceVariableNames: ''!

!RotateAntiClockwisePoitingTowardsEast class methodsFor: 'as yet unclassified' stamp: 'iO 5/30/2022 00:41:44'!
newCardinalPoint: aCardinalPoint
	^$N.! !

!RotateAntiClockwisePoitingTowardsEast class methodsFor: 'as yet unclassified' stamp: 'iO 5/30/2022 14:42:29'!
respondsToInitialCardinalPoint: anInitialCardinalPoint
	^anInitialCardinalPoint = $E.! !

!RotateAntiClockwisePoitingTowardsEast class methodsFor: 'as yet unclassified' stamp: 'iO 5/30/2022 00:23:56'!
value
	^(0@0).! !


!classDefinition: #RotateAntiClockwisePoitingTowardsNorth category: 'Mars-Rover'!
RotateAntiClockwise subclass: #RotateAntiClockwisePoitingTowardsNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RotateAntiClockwisePoitingTowardsNorth class' category: 'Mars-Rover'!
RotateAntiClockwisePoitingTowardsNorth class
	instanceVariableNames: ''!

!RotateAntiClockwisePoitingTowardsNorth class methodsFor: 'as yet unclassified' stamp: 'iO 5/30/2022 00:41:23'!
newCardinalPoint: aCardinalPoint
	^$W.! !

!RotateAntiClockwisePoitingTowardsNorth class methodsFor: 'as yet unclassified' stamp: 'iO 5/30/2022 14:42:35'!
respondsToInitialCardinalPoint: anInitialCardinalPoint
	^anInitialCardinalPoint = $N.! !

!RotateAntiClockwisePoitingTowardsNorth class methodsFor: 'as yet unclassified' stamp: 'iO 5/30/2022 00:23:24'!
value
	^(0@0).! !


!classDefinition: #RotateAntiClockwisePoitingTowardsSouth category: 'Mars-Rover'!
RotateAntiClockwise subclass: #RotateAntiClockwisePoitingTowardsSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RotateAntiClockwisePoitingTowardsSouth class' category: 'Mars-Rover'!
RotateAntiClockwisePoitingTowardsSouth class
	instanceVariableNames: ''!

!RotateAntiClockwisePoitingTowardsSouth class methodsFor: 'as yet unclassified' stamp: 'iO 5/30/2022 14:41:26'!
newCardinalPoint: aCardinalPoint
	^$E.! !

!RotateAntiClockwisePoitingTowardsSouth class methodsFor: 'as yet unclassified' stamp: 'iO 5/30/2022 14:42:42'!
respondsToInitialCardinalPoint: anInitialCardinalPoint
	^anInitialCardinalPoint = $S.! !

!RotateAntiClockwisePoitingTowardsSouth class methodsFor: 'as yet unclassified' stamp: 'iO 5/30/2022 00:23:33'!
value
	^(0@0).! !


!classDefinition: #RotateAntiClockwisePoitingTowardsWest category: 'Mars-Rover'!
RotateAntiClockwise subclass: #RotateAntiClockwisePoitingTowardsWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RotateAntiClockwisePoitingTowardsWest class' category: 'Mars-Rover'!
RotateAntiClockwisePoitingTowardsWest class
	instanceVariableNames: ''!

!RotateAntiClockwisePoitingTowardsWest class methodsFor: 'as yet unclassified' stamp: 'iO 5/30/2022 14:41:43'!
newCardinalPoint: aCardinalPoint
	^$S.! !

!RotateAntiClockwisePoitingTowardsWest class methodsFor: 'as yet unclassified' stamp: 'iO 5/30/2022 14:42:53'!
respondsToInitialCardinalPoint: anInitialCardinalPoint
	^anInitialCardinalPoint = $W.! !

!RotateAntiClockwisePoitingTowardsWest class methodsFor: 'as yet unclassified' stamp: 'iO 5/30/2022 00:24:23'!
value
	^(0@0).! !


!classDefinition: #RotateClockwise category: 'Mars-Rover'!
MarsRover subclass: #RotateClockwise
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RotateClockwise class' category: 'Mars-Rover'!
RotateClockwise class
	instanceVariableNames: ''!

!RotateClockwise class methodsFor: 'accessing' stamp: 'iO 5/30/2022 00:12:47'!
canHandle: aCommand
	^(aCommand = $r).! !


!RotateClockwise class methodsFor: 'as yet unclassified' stamp: 'iO 5/30/2022 00:19:37'!
newCardinalPoint: aCardinalPoint
	^aCardinalPoint.! !

!RotateClockwise class methodsFor: 'as yet unclassified' stamp: 'iO 5/30/2022 00:17:20'!
respondsToInitialCardinalPoint: aPoint
	^ false.! !


!classDefinition: #RotateClockwisePointingTowardsEast category: 'Mars-Rover'!
RotateClockwise subclass: #RotateClockwisePointingTowardsEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RotateClockwisePointingTowardsEast class' category: 'Mars-Rover'!
RotateClockwisePointingTowardsEast class
	instanceVariableNames: ''!

!RotateClockwisePointingTowardsEast class methodsFor: 'accessing' stamp: 'iO 5/30/2022 00:21:28'!
newCardinalPoint: aCardinalPoint
	^$S.! !

!RotateClockwisePointingTowardsEast class methodsFor: 'accessing' stamp: 'iO 5/30/2022 00:21:19'!
respondsToInitialCardinalPoint: anInitialCardinalPoint
	^anInitialCardinalPoint = $E.! !

!RotateClockwisePointingTowardsEast class methodsFor: 'accessing' stamp: 'iO 5/30/2022 00:21:10'!
value
	^(0@0).! !


!classDefinition: #RotateClockwisePointingTowardsNorth category: 'Mars-Rover'!
RotateClockwise subclass: #RotateClockwisePointingTowardsNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RotateClockwisePointingTowardsNorth class' category: 'Mars-Rover'!
RotateClockwisePointingTowardsNorth class
	instanceVariableNames: ''!

!RotateClockwisePointingTowardsNorth class methodsFor: 'accessing' stamp: 'iO 5/30/2022 00:16:05'!
newCardinalPoint: aCardinalPoint
	^$E.! !

!RotateClockwisePointingTowardsNorth class methodsFor: 'accessing' stamp: 'iO 5/30/2022 14:43:31'!
respondsToInitialCardinalPoint: anInitialCardinalPoint
	^anInitialCardinalPoint = $N.! !

!RotateClockwisePointingTowardsNorth class methodsFor: 'accessing' stamp: 'iO 5/30/2022 00:04:17'!
value
	^(0@0).! !


!classDefinition: #RotateClockwisePointingTowardsSouth category: 'Mars-Rover'!
RotateClockwise subclass: #RotateClockwisePointingTowardsSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RotateClockwisePointingTowardsSouth class' category: 'Mars-Rover'!
RotateClockwisePointingTowardsSouth class
	instanceVariableNames: ''!

!RotateClockwisePointingTowardsSouth class methodsFor: 'accessing' stamp: 'iO 5/30/2022 00:20:54'!
newCardinalPoint: aCardinalPoint
	^$W.! !

!RotateClockwisePointingTowardsSouth class methodsFor: 'accessing' stamp: 'iO 5/30/2022 00:21:01'!
respondsToInitialCardinalPoint: anInitialCardinalPoint
	^anInitialCardinalPoint = $S.! !

!RotateClockwisePointingTowardsSouth class methodsFor: 'accessing' stamp: 'iO 5/30/2022 00:20:23'!
value
	^(0@0).! !


!classDefinition: #RotateClockwisePointingTowardsWest category: 'Mars-Rover'!
RotateClockwise subclass: #RotateClockwisePointingTowardsWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RotateClockwisePointingTowardsWest class' category: 'Mars-Rover'!
RotateClockwisePointingTowardsWest class
	instanceVariableNames: ''!

!RotateClockwisePointingTowardsWest class methodsFor: 'accessing' stamp: 'iO 5/30/2022 00:21:50'!
newCardinalPoint: aCardinalPoint
	^$N.! !

!RotateClockwisePointingTowardsWest class methodsFor: 'accessing' stamp: 'iO 5/30/2022 00:21:54'!
respondsToInitialCardinalPoint: anInitialCardinalPoint
	^anInitialCardinalPoint = $W.! !

!RotateClockwisePointingTowardsWest class methodsFor: 'accessing' stamp: 'iO 5/30/2022 00:21:35'!
value
	^(0@0).! !
