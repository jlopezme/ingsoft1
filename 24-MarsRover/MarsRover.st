!classDefinition: #MarsRover category: #MarsRover!
Object subclass: #MarsRover
	instanceVariableNames: 'estado'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'initialization' stamp: 'Cf 5/7/2019 15:14:09'!
initializeWithOrigin: deployPoing andOrientation: deployOrientation 
	! !


!MarsRover methodsFor: 'accessing' stamp: 'Cf 5/7/2019 15:14:15'!
orientation
	! !

!MarsRover methodsFor: 'accessing' stamp: 'Cf 5/7/2019 15:14:19'!
position
	! !


!MarsRover methodsFor: 'moving' stamp: 'Cf 5/7/2019 15:15:58'!
move: commands
	
	! !

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

!StateOfMarsRover methodsFor: 'Operations' stamp: 'Cf 5/7/2019 15:21:09'!
rotate: aOrientation
	^self subclassResponsibility.! !


!StateOfMarsRover methodsFor: 'Location/Orientation' stamp: 'Cf 5/7/2019 15:20:23'!
location
	^self subclassResponsibility.! !

!StateOfMarsRover methodsFor: 'Location/Orientation' stamp: 'Cf 5/7/2019 15:20:49'!
orientation
	^self subclassResponsibility ! !


!classDefinition: #HeadingEast category: #MarsRover!
StateOfMarsRover subclass: #HeadingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!


!classDefinition: #HeadingNorht category: #MarsRover!
StateOfMarsRover subclass: #HeadingNorht
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!


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
