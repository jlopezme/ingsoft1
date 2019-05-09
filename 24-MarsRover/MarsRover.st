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


!MarsRover methodsFor: 'verification of Commands' stamp: 'Cf 5/7/2019 18:36:37'!
isaValidCommand: commands at: actualCommand

	^ #($f $b $l $r) includes: (commands at: actualCommand ).! !


!MarsRover methodsFor: 'moving' stamp: 'Cf 5/7/2019 18:51:01'!
excuteCommands: commands
	| lenghtOfCommands actualCommand letterOfActualCommand| 
	lenghtOfCommands := commands size.
	actualCommand  := 1.
	
	[actualCommand <= lenghtOfCommands   and: [self isaValidCommand: commands at: actualCommand ] ] whileTrue: [
					letterOfActualCommand := commands at: actualCommand .
					(#($l $r) includes: letterOfActualCommand ) ifTrue: [ self rotateTo: letterOfActualCommand ].
					(#($f $b) includes:  letterOfActualCommand ) ifTrue: [ self move: letterOfActualCommand ].
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


!StateOfMarsRover methodsFor: 'Location/Orientation' stamp: 'Cf 5/7/2019 15:20:23'!
location
	^self subclassResponsibility.! !

!StateOfMarsRover methodsFor: 'Location/Orientation' stamp: 'Cf 5/7/2019 15:20:49'!
orientation
	^self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StateOfMarsRover class' category: #MarsRover!
StateOfMarsRover class
	instanceVariableNames: ''!

!StateOfMarsRover class methodsFor: 'creation' stamp: 'Cf 5/7/2019 18:42:29'!
usePoint: aLocation andUseThisOrientation: anOrientation 
	(anOrientation = 'Heading North') ifTrue: [ ^ HeadingNorht usingThisLocation: aLocation  andUsingThisOrientation: anOrientation ].
	(anOrientation = 'Heading West') ifTrue: [ ^ HeadingWest usingThisLocation: aLocation  andUsingThisOrientation: anOrientation ].
	(anOrientation = 'Heading East') ifTrue: [ ^ HeadingEast usingThisLocation: aLocation  andUsingThisOrientation: anOrientation ].
	(anOrientation = 'Heading South') ifTrue: [^ HeadingSouth usingThisLocation: aLocation  andUsingThisOrientation: anOrientation ].! !


!classDefinition: #HeadingEast category: #MarsRover!
StateOfMarsRover subclass: #HeadingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!


!HeadingEast methodsFor: 'Location/Orientation' stamp: 'Cf 5/7/2019 18:52:20'!
location
	^currentLocation ! !

!HeadingEast methodsFor: 'Location/Orientation' stamp: 'Cf 5/7/2019 18:52:34'!
orientation
	^currentOrientation ! !


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


!classDefinition: #HeadingNorht category: #MarsRover!
StateOfMarsRover subclass: #HeadingNorht
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!HeadingNorht methodsFor: 'Location/Orientation' stamp: 'Cf 5/7/2019 17:22:36'!
location
	^currentLocation.! !

!HeadingNorht methodsFor: 'Location/Orientation' stamp: 'Cf 5/7/2019 17:22:50'!
orientation
	^currentOrientation .! !


!HeadingNorht methodsFor: 'Operations' stamp: 'Cf 5/7/2019 18:08:09'!
moveTo: aDirection
	(aDirection = 'f') ifTrue: [ currentLocation + (0@1)].
	currentLocation - (0@1).
	! !

!HeadingNorht methodsFor: 'Operations' stamp: 'Cf 5/7/2019 18:46:37'!
rotateTo: aDirection
	(aDirection = 'l') ifTrue: [ ^ HeadingWest usingThisLocation: self location andUsingThisOrientation: 'Heading West' ].
	^ HeadingEast usingThisLocation: self location andUsingThisOrientation: 'Heading East'.! !


!HeadingNorht methodsFor: 'initialization' stamp: 'Cf 5/7/2019 17:15:19'!
createUsingThisLocation: aLocation andUsingThisOrientation: anOrientation 
	currentLocation := aLocation.
	currentOrientation := anOrientation.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'HeadingNorht class' category: #MarsRover!
HeadingNorht class
	instanceVariableNames: ''!

!HeadingNorht class methodsFor: 'creation' stamp: 'Cf 5/7/2019 17:41:12'!
usingThisLocation: location andUsingThisOrientation: orientation 
	^self new createUsingThisLocation: location andUsingThisOrientation: orientation.! !


!classDefinition: #HeadingSouth category: #MarsRover!
StateOfMarsRover subclass: #HeadingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!


!classDefinition: #HeadingWest category: #MarsRover!
StateOfMarsRover subclass: #HeadingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!
