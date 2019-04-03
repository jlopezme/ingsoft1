!classDefinition: #LuzDeAlto category: #UnSemaforo!
DenotativeObjectMorph subclass: #LuzDeAlto
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UnSemaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LuzDeAlto class' category: #UnSemaforo!
LuzDeAlto class
	instanceVariableNames: ''!

!LuzDeAlto class methodsFor: 'morph' stamp: 'jl 3/25/2019 19:47:15'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!LuzDeAlto class methodsFor: 'as yet unclassified' stamp: 'j 4/3/2019 15:44:21'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #LuzDeAvanzar category: #UnSemaforo!
LuzDeAlto subclass: #LuzDeAvanzar
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UnSemaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LuzDeAvanzar class' category: #UnSemaforo!
LuzDeAvanzar class
	instanceVariableNames: ''!

!LuzDeAvanzar class methodsFor: 'morph' stamp: 'jl 3/25/2019 19:49:17'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!LuzDeAvanzar class methodsFor: 'as yet unclassified' stamp: 'j 4/3/2019 15:44:21'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #LuzDePrecaucion category: #UnSemaforo!
LuzDeAlto subclass: #LuzDePrecaucion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UnSemaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LuzDePrecaucion class' category: #UnSemaforo!
LuzDePrecaucion class
	instanceVariableNames: ''!

!LuzDePrecaucion class methodsFor: 'morph' stamp: 'jl 3/25/2019 19:49:10'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!LuzDePrecaucion class methodsFor: 'as yet unclassified' stamp: 'j 4/3/2019 15:44:21'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #UnSemaforo category: #UnSemaforo!
DenotativeObject subclass: #UnSemaforo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'UnSemaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UnSemaforo class' category: #UnSemaforo!
UnSemaforo class
	instanceVariableNames: ''!

!UnSemaforo class methodsFor: 'morph' stamp: 'jl 3/28/2019 16:42:08'!
apagar
	LuzDeAvanzar color: Color black.
	LuzDePrecaucion color: Color black.
	LuzDeAlto color: Color black.
	! !

!UnSemaforo class methodsFor: 'morph' stamp: 'jl 3/25/2019 19:50:46'!
createMorph

	^LayoutMorph newColumn
		morphExtent: 60 @ 130;
		yourself
! !

!UnSemaforo class methodsFor: 'morph' stamp: 'j 4/3/2019 15:06:42'!
inicioDeAlto

	LuzDeAlto color: Color red.
	(Delay for: 3*second) wait.! !

!UnSemaforo class methodsFor: 'morph' stamp: 'j 4/3/2019 15:06:37'!
inicioDeAvance
	
	LuzDeAvanzar color: Color green.
	(Delay for: 3*second) wait.
	LuzDeAvanzar color: Color black.! !

!UnSemaforo class methodsFor: 'morph' stamp: 'jl 3/28/2019 17:04:03'!
inicioDePrecaucion
	5 timesRepeat: [
		LuzDePrecaucion color: Color yellow.
		(Delay for: 0.5*second) wait.
		LuzDePrecaucion color: Color black.
		(Delay for: 0.5*second) wait.
	]
	! !

!UnSemaforo class methodsFor: 'morph' stamp: 'j 4/3/2019 12:02:34'!
prender

	LuzDeAlto color: Color black.
	LuzDePrecaucion color: Color black.
	LuzDeAvanzar color: Color black.
	self inicioDePrecaucion.
	self inicioDeAvance.
	self inicioDeAlto.! !

LuzDeAlto initializeAfterFileIn!
LuzDeAvanzar initializeAfterFileIn!
LuzDePrecaucion initializeAfterFileIn!