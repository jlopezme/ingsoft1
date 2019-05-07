!classDefinition: #MarsRoverTest category: #'MarsRover-Test'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Test'!

!MarsRoverTest methodsFor: 'testing' stamp: 'Cf 5/7/2019 15:16:48'!
test00InicializarMarsRover
	| orientacion rover origin |
	origin _ 0@0.
	orientacion _ #HeadingNorht.
	rover _ MarsRover withOrigin: origin andOrientation: orientacion.
	
	self assert: origin equals: rover position.
	self assert: orientacion equals: rover orientation.
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'Cf 5/7/2019 15:16:48'!
test01MoverConStringVacio
	| orientacion rover comandos origen |
	origen _ 0@0.
	orientacion _ #HeadingNorht.
	rover _ MarsRover withOrigin: origen andOrientation: orientacion.
	
	comandos _ ''.
	rover move: comandos.
	
	self assert: origen equals: rover position.
	self assert: orientacion equals: rover orientation.
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'Cf 5/7/2019 15:16:48'!
test02RotarDerecha
	| orientacion rover comandos origen |
	origen _ 0@0.
	orientacion _ #HeadingNorht.
	rover _ MarsRover withOrigin: origen andOrientation: orientacion.
	
	comandos _ 'r'.
	rover move: comandos.
	
	self assert: origen equals: rover position.
	self assert: #East equals: rover orientation.
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'Cf 5/7/2019 15:16:48'!
test03RotarIzquierda
	| orientacion rover comandos origen |
	origen _ 0@0.
	orientacion _ #HeadingNorht.
	rover _ MarsRover withOrigin: origen andOrientation: orientacion.
	
	comandos _ 'l'.
	rover move: comandos.
	
	self assert: origen equals: rover position.
	self assert: #West equals: rover orientation.
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'Cf 5/7/2019 15:16:48'!
test04MoverAdelante
	| orientacion rover comandos origen |
	origen _ 0@0.
	orientacion _ #HeadingNorht.
	rover _ MarsRover withOrigin: origen andOrientation: orientacion.
	
	comandos _ 'f'.
	rover move: comandos.
	
	self assert: origen + (0@1) equals: rover position.
	self assert: orientacion equals: rover orientation.
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'Cf 5/7/2019 15:16:48'!
test05MoverAtras
	| orientacion rover comandos origen |
	origen _ 0@0.
	orientacion _ #HeadingNorht.
	rover _ MarsRover withOrigin: origen andOrientation: orientacion.
	
	comandos _ 'b'.
	rover move: comandos.
	
	self assert: origen - (0@1) equals: rover position.
	self assert: orientacion equals: rover orientation.
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'Cf 5/7/2019 15:16:48'!
test06RotarIzquierdaDosVeces
	| orientacion rover comandos origen |
	origen _ 0@0.
	orientacion _ #HeadingNorht.
	rover _ MarsRover withOrigin: origen andOrientation: orientacion.
	
	comandos _ 'll'.
	rover move: comandos.
	
	self assert: origen equals: rover position.
	self assert: #South equals: rover orientation.
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'EB 5/6/2019 21:56:54'!
test07MoverAdelanteMirandoAlSur
	| orientacion rover comandos origen |
	origen _ 0@0.
	orientacion _ #South.
	rover _ MarsRover withOrigin: origen andOrientation: orientacion.
	
	comandos _ 'f'.
	rover move: comandos.
	
	self assert: origen + (0 @ -1) equals: rover position.
	self assert: orientacion equals: rover orientation.
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'EB 5/6/2019 21:57:02'!
test08MoverAdelanteMirandoAlEste
	| orientacion rover comandos origen |
	origen _ 23@45.
	orientacion _ #East.
	rover _ MarsRover withOrigin: origen andOrientation: orientacion.
	
	comandos _ 'f'.
	rover move: comandos.
	
	self assert: origen + (1 @ 0) equals: rover position.
	self assert: orientacion equals: rover orientation.
	! !
