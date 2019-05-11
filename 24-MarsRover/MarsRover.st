!classDefinition: #MarsRover category: #MarsRover!
Object subclass: #MarsRover
	instanceVariableNames: 'estado'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'initialization' stamp: 'Cf 5/7/2019 17:05:43'!
initializeWithOrigin: deployPoint andOrientation: deployOrientation 
	estado := StateOfMarsRover usePoint: deployPoint andUseThisOrientation: deployOrientation .! !


!MarsRover methodsFor: 'accessing' stamp: 'Cf 5/7/2019 17:37:24'!
orientation
	^ estado orientation.! !

!MarsRover methodsFor: 'accessing' stamp: 'Cf 5/7/2019 17:37:14'!
position
	^ estado location   .! !


!MarsRover methodsFor: 'validation/Errors' stamp: 'Cf 5/11/2019 17:36:10'!
signalIsNotaValidCommand
	^self error: self class IsAInvalidCommand. 
! !


!MarsRover methodsFor: 'moving' stamp: 'Cf 5/11/2019 17:31:41'!
executeActualCommand: aCommand
	(#($l $r) includes: aCommand ) ifTrue: [ ^self rotateTo: aCommand ].
	(#($f $b) includes:  aCommand ) ifTrue: [ ^self move: aCommand ].
	^ self signalIsNotaValidCommand.! !

!MarsRover methodsFor: 'moving' stamp: 'Cf 5/11/2019 17:31:41'!
executeCommands: commands
	| lenghtOfCommands actualCommand letterOfActualCommand| 
	lenghtOfCommands := commands size.
	actualCommand  := 1.
	
	[actualCommand <= lenghtOfCommands ] whileTrue: [
					letterOfActualCommand := commands at: actualCommand .
					self executeActualCommand: letterOfActualCommand .
					actualCommand := actualCommand +1.				
		]! !

!MarsRover methodsFor: 'moving' stamp: 'Cf 5/7/2019 18:03:20'!
move: aDirection
	estado := estado moveTo: aDirection.! !

!MarsRover methodsFor: 'moving' stamp: 'Cf 5/7/2019 18:03:52'!
rotateTo: aDirection
	estado := estado rotateTo: aDirection.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #MarsRover!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'errors' stamp: 'Cf 5/11/2019 17:20:44'!
IsAInvalidCommand
	^'I receive an Invalid Command'.! !


!MarsRover class methodsFor: 'creation' stamp: 'EB 5/6/2019 20:31:23'!
withOrigin: aPoint andOrientation: aSymbol 
	^self new initializeWithOrigin: aPoint andOrientation: aSymbol.! !


!classDefinition: #StateOfMarsRover category: #MarsRover!
Object subclass: #StateOfMarsRover
	instanceVariableNames: 'currentLocation currentOrientation'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!StateOfMarsRover methodsFor: 'Operations' stamp: 'Cf 5/7/2019 15:18:19'!
move: aDirection
	^self subclassResponsibility.! !

!StateOfMarsRover methodsFor: 'Operations' stamp: 'Cf 5/7/2019 18:39:38'!
rotateTo: anOrientation
	^self subclassResponsibility.! !


!StateOfMarsRover methodsFor: 'Location/Orientation' stamp: 'Cf 5/11/2019 17:01:59'!
location
	^currentLocation ! !

!StateOfMarsRover methodsFor: 'Location/Orientation' stamp: 'Cf 5/11/2019 17:01:53'!
orientation
	^currentOrientation ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StateOfMarsRover class' category: #MarsRover!
StateOfMarsRover class
	instanceVariableNames: ''!

!StateOfMarsRover class methodsFor: 'creation' stamp: 'Cf 5/11/2019 17:31:58'!
usePoint: aLocation andUseThisOrientation: anOrientation 
	(anOrientation = 'Heading North') ifTrue: [ ^ HeadingNorth usingThisLocation: aLocation  andUsingThisOrientation: anOrientation ].
	(anOrientation = 'Heading West') ifTrue: [ ^ HeadingWest usingThisLocation: aLocation  andUsingThisOrientation: anOrientation ].
	(anOrientation = 'Heading East') ifTrue: [ ^ HeadingEast usingThisLocation: aLocation  andUsingThisOrientation: anOrientation ].
	(anOrientation = 'Heading South') ifTrue: [^ HeadingSouth usingThisLocation: aLocation  andUsingThisOrientation: anOrientation ].! !


!classDefinition: #HeadingEast category: #MarsRover!
StateOfMarsRover subclass: #HeadingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!HeadingEast methodsFor: 'Operations' stamp: 'Cf 5/11/2019 16:54:14'!
moveTo: aDirection
	(aDirection = $f) ifTrue: [ currentLocation := currentLocation + (1@0)]
	ifFalse: [currentLocation := currentLocation - (1@0)].! !

!HeadingEast methodsFor: 'Operations' stamp: 'Cf 5/11/2019 17:31:58'!
rotateTo: aDirection
	(aDirection = $l) ifTrue: [ ^ HeadingNorth usingThisLocation: self location andUsingThisOrientation: 'Heading North' ].
	^ HeadingSouth usingThisLocation: self location andUsingThisOrientation: 'Heading South'.! !


!HeadingEast methodsFor: 'initialization' stamp: 'Cf 5/7/2019 18:48:36'!
createUsingThisLocation: aLocation andUsingThisOrientation: anOrientation 
	currentLocation := aLocation.
	currentOrientation := anOrientation.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'HeadingEast class' category: #MarsRover!
HeadingEast class
	instanceVariableNames: ''!

!HeadingEast class methodsFor: 'creation' stamp: 'Cf 5/7/2019 18:47:45'!
usingThisLocation: location andUsingThisOrientation: orientation 
	^self new createUsingThisLocation: location andUsingThisOrientation: orientation.! !


!classDefinition: #HeadingNorth category: #MarsRover!
StateOfMarsRover subclass: #HeadingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!HeadingNorth methodsFor: 'Operations' stamp: 'Cf 5/11/2019 16:36:02'!
moveTo: aDirection
	(aDirection = $f) ifTrue: [ currentLocation := currentLocation + (0@1)]
	ifFalse: [currentLocation := currentLocation - (0@1)].
	! !

!HeadingNorth methodsFor: 'Operations' stamp: 'Cf 5/11/2019 16:22:55'!
rotateTo: aDirection
	(aDirection = $l) ifTrue: [ ^ HeadingWest usingThisLocation: self location andUsingThisOrientation: 'Heading West' ].
	^ HeadingEast usingThisLocation: self location andUsingThisOrientation: 'Heading East'.! !


!HeadingNorth methodsFor: 'initialization' stamp: 'Cf 5/7/2019 17:15:19'!
createUsingThisLocation: aLocation andUsingThisOrientation: anOrientation 
	currentLocation := aLocation.
	currentOrientation := anOrientation.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'HeadingNorth class' category: #MarsRover!
HeadingNorth class
	instanceVariableNames: ''!

!HeadingNorth class methodsFor: 'creation' stamp: 'Cf 5/7/2019 17:41:12'!
usingThisLocation: location andUsingThisOrientation: orientation 
	^self new createUsingThisLocation: location andUsingThisOrientation: orientation.! !


!classDefinition: #HeadingSouth category: #MarsRover!
StateOfMarsRover subclass: #HeadingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!HeadingSouth methodsFor: 'Operations' stamp: 'Cf 5/11/2019 16:57:46'!
moveTo: aDirection
	(aDirection = $f) ifTrue: [ currentLocation := currentLocation - (0@1)]
	ifFalse: [currentLocation := currentLocation + (0@1)].! !

!HeadingSouth methodsFor: 'Operations' stamp: 'Cf 5/11/2019 16:59:02'!
rotateTo: aDirection
	(aDirection = $l) ifTrue: [ ^ HeadingEast usingThisLocation: self location andUsingThisOrientation: 'Heading East' ].
	^ HeadingWest usingThisLocation: self location andUsingThisOrientation: 'Heading West'.! !


!HeadingSouth methodsFor: 'initialization' stamp: 'Cf 5/11/2019 16:39:15'!
createUsingThisLocation: aLocation andUsingThisOrientation: anOrientation 
	currentLocation := aLocation.
	currentOrientation := anOrientation.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'HeadingSouth class' category: #MarsRover!
HeadingSouth class
	instanceVariableNames: ''!

!HeadingSouth class methodsFor: 'creation' stamp: 'Cf 5/11/2019 16:39:30'!
usingThisLocation: location andUsingThisOrientation: orientation 
	^self new createUsingThisLocation: location andUsingThisOrientation: orientation.! !


!classDefinition: #HeadingWest category: #MarsRover!
StateOfMarsRover subclass: #HeadingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!HeadingWest methodsFor: 'initialization' stamp: 'Cf 5/11/2019 16:26:32'!
createUsingThisLocation: aLocation andUsingThisOrientation: anOrientation 
	currentLocation := aLocation.
	currentOrientation := anOrientation.! !


!HeadingWest methodsFor: 'Operations' stamp: 'Cf 5/11/2019 16:55:59'!
moveTo: aDirection
	(aDirection = $f) ifTrue: [ currentLocation := currentLocation - (1@0)]
	ifFalse: [currentLocation := currentLocation + (1@0)].! !

!HeadingWest methodsFor: 'Operations' stamp: 'Cf 5/11/2019 17:31:58'!
rotateTo: aDirection
	(aDirection = $l) ifTrue: [ ^ HeadingSouth usingThisLocation: self location andUsingThisOrientation: 'Heading South' ].
	^ HeadingNorth usingThisLocation: self location andUsingThisOrientation: 'Heading North'.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'HeadingWest class' category: #MarsRover!
HeadingWest class
	instanceVariableNames: ''!

!HeadingWest class methodsFor: 'creation' stamp: 'Cf 5/11/2019 16:25:55'!
usingThisLocation: location andUsingThisOrientation: orientation 
	^self new createUsingThisLocation: location andUsingThisOrientation: orientation.! !
