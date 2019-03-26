!classDefinition: #LuzAmarilla category: #Semaforo!
DenotativeObjectMorph subclass: #LuzAmarilla
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LuzAmarilla class' category: #Semaforo!
LuzAmarilla class
	instanceVariableNames: ''!

!LuzAmarilla class methodsFor: 'morph' stamp: 'jl 3/25/2019 19:49:10'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!LuzAmarilla class methodsFor: 'as yet unclassified' stamp: 'jl 3/25/2019 20:56:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #LuzRoja category: #Semaforo!
DenotativeObjectMorph subclass: #LuzRoja
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LuzRoja class' category: #Semaforo!
LuzRoja class
	instanceVariableNames: ''!

!LuzRoja class methodsFor: 'morph' stamp: 'jl 3/25/2019 19:47:15'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!LuzRoja class methodsFor: 'as yet unclassified' stamp: 'jl 3/25/2019 20:56:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #LuzVerde category: #Semaforo!
DenotativeObjectMorph subclass: #LuzVerde
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LuzVerde class' category: #Semaforo!
LuzVerde class
	instanceVariableNames: ''!

!LuzVerde class methodsFor: 'morph' stamp: 'jl 3/25/2019 19:49:17'!
createMorph

	^EllipseMorph new
		color: Color black;
		yourself! !


!LuzVerde class methodsFor: 'as yet unclassified' stamp: 'jl 3/25/2019 20:56:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !


!classDefinition: #Semaforo category: #Semaforo!
DenotativeObjectMorph subclass: #Semaforo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Semaforo'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Semaforo class' category: #Semaforo!
Semaforo class
	instanceVariableNames: ''!

!Semaforo class methodsFor: 'morph' stamp: 'jl 3/25/2019 20:39:47'!
apagar
	LuzVerde color: Color black.
	LuzAmarilla color: Color black.
	LuzRoja color: Color black.
	! !

!Semaforo class methodsFor: 'morph' stamp: 'jl 3/25/2019 19:50:46'!
createMorph

	^LayoutMorph newColumn
		morphExtent: 60 @ 130;
		yourself
! !

!Semaforo class methodsFor: 'morph' stamp: 'jl 3/25/2019 20:41:14'!
prender
	LuzRoja color: Color black.
	LuzAmarilla color: Color black.
	LuzVerde color: Color black.
	(Delay for: 0.5*second) wait.
	LuzAmarilla color: Color yellow.
	(Delay for: 0.5*second) wait.
	LuzAmarilla color: Color black.
	(Delay for: 0.5*second) wait.
	LuzAmarilla color: Color yellow.
	(Delay for: 0.5*second) wait.
	LuzAmarilla color: Color black.
	(Delay for: 0.5*second) wait.
	LuzAmarilla color: Color yellow.
	(Delay for: 0.5*second) wait.
	LuzAmarilla color: Color black.
	(Delay for: 0.5*second) wait.
	LuzAmarilla color: Color yellow.
	(Delay for: 0.5*second) wait.
	LuzAmarilla color: Color black.
	(Delay for: 0.5*second) wait.
	LuzAmarilla color: Color yellow.
	(Delay for: 0.5*second) wait.
	LuzRoja color: Color red.
	LuzAmarilla color: Color yellow.
	LuzVerde color: Color green.
	! !


!Semaforo class methodsFor: 'as yet unclassified' stamp: 'jl 3/25/2019 20:56:53'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	morph := nil.! !

LuzAmarilla initializeAfterFileIn!
LuzRoja initializeAfterFileIn!
LuzVerde initializeAfterFileIn!
Semaforo initializeAfterFileIn!