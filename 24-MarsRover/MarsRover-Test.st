!classDefinition: #MarsRoverTest category: #'MarsRover-Test'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-Test'!

!MarsRoverTest methodsFor: 'testing' stamp: 'Cf 5/7/2019 17:10:49'!
test00InicializarMarsRover
	| orientacion rover origin |
	origin _ 0@0.
	orientacion _ 'Heading North'.
	rover _ MarsRover withOrigin: origin andOrientation: orientacion.
	
	self assert: origin equals: rover position.
	self assert: orientacion equals: rover orientation.
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'Cf 5/11/2019 17:32:29'!
test01MoverConStringVacio
	| orientacion rover comandos origen |
	origen _ 0@0.
	orientacion _ 'Heading North'.
	rover _ MarsRover withOrigin: origen andOrientation: orientacion.
	
	comandos _ ''.
	rover executeCommands: comandos.
	
	self assert: origen equals: rover position.
	self assert: orientacion equals: rover orientation.
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'Cf 5/11/2019 17:32:36'!
test02RotarDerecha
	| orientacion rover comandos origen |
	origen _ 0@0.
	orientacion _ 'Heading North'.
	rover _ MarsRover withOrigin: origen andOrientation: orientacion.
	
	comandos _ 'r'.
	rover executeCommands: comandos.
	
	self assert: origen equals: rover position.
	self assert: 'Heading East' equals: rover orientation.
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'Cf 5/11/2019 17:32:39'!
test03RotarIzquierda
	| orientacion rover comandos origen |
	origen _ 0@0.
	orientacion _'Heading North'.
	rover _ MarsRover withOrigin: origen andOrientation: orientacion.
	
	comandos _ 'l'.
	rover executeCommands: comandos.
	
	self assert: origen equals: rover position.
	self assert: 'Heading West' equals: rover orientation.
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'Cf 5/11/2019 17:32:43'!
test04MoverAdelante
	| orientacion rover comandos origen |
	origen _ 0@0.
	orientacion _ 'Heading North'.
	rover _ MarsRover withOrigin: origen andOrientation: orientacion.
	
	comandos _ 'f'.
	rover executeCommands: comandos.
	
	self assert: origen + (0@1) equals: rover position.
	self assert: orientacion equals: rover orientation.
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'Cf 5/11/2019 17:32:59'!
test05MoverAtras
	| orientacion rover comandos origen |
	origen _ 0@0.
	orientacion _ 'Heading North'.
	rover _ MarsRover withOrigin: origen andOrientation: orientacion.
	
	comandos _ 'b'.
	rover executeCommands: comandos.
	
	self assert: origen - (0@1) equals: rover position.
	self assert: orientacion equals: rover orientation.
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'Cf 5/11/2019 18:01:01'!
test06ElRoverConUnaSecuenciaValidaTerminaEnElLugarEsperado
	| orientacion rover comandos origen |
	origen _ 0@0.
	orientacion _ 'Heading West'.
	rover _ MarsRover withOrigin: origen andOrientation: orientacion.
	
	comandos _ 'flflfrb'.
	rover executeCommands: comandos.
	
	self assert: origen equals: rover position.
	self assert: 'Heading South' equals: rover orientation.
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'Cf 5/11/2019 18:03:55'!
test07UnComandoInválidoGeneraElerrorComandoInválidoYNoEjecutaMásComandos
	| orientacion rover comandos origen |
	origen _ 23@45.
	orientacion _ 'Heading East'.
	rover _ MarsRover withOrigin: origen andOrientation: orientacion.
	
	comandos _ 'fxf'.
	
	[ [rover executeCommands: comandos ] value.
	self fail ]
		on: Error 
		do: [ :anError |
			self assert: anError messageText equals: MarsRover IsAInvalidCommand.	
			self assert: rover orientation  = orientacion .
			self assert: rover position = (origen + (1@0))] 
	! !
