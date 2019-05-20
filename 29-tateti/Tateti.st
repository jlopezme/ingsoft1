!classDefinition: #TestTerniLapilli category: #Tateti!
TestCase subclass: #TestTerniLapilli
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tateti'!

!TestTerniLapilli methodsFor: 'test' stamp: 'cf 5/20/2019 18:03:19'!
test01
		|tablero|
		tablero := TerniLapilli new.
		tablero putXFila: 2 columna:2.
		self assert: (tablero fichasEnJuego) equals: 1.
		self assert: (tablero fichasDeX ) equals:1.
		self assert: (tablero fichasDeY ) equals: 0.
		self assert: (tablero quienOcupaFila: 2 columna:2 ) equals: $X.! !

!TestTerniLapilli methodsFor: 'test' stamp: 'cf 5/20/2019 18:46:19'!
test02
		|tablero|
		tablero := TerniLapilli new.
		tablero putXFila: 2 columna:2.
		
		self should: [tablero putYFila: 2 columna:2] raise:  Error 
			withExceptionDo:[:anError | anError messageText = TerniLapilli errorDeCasillaOcupada. 
		self assert: (tablero fichasEnJuego) equals: 1.
		self assert: (tablero fichasDeX ) equals:1.
		self assert: (tablero fichasDeY ) equals: 0.
		self assert: (tablero quienOcupaFila: 2 columna:2 ) equals: $X.]! !

!TestTerniLapilli methodsFor: 'test' stamp: 'cf 5/20/2019 18:50:40'!
test03
	|tablero|
		tablero := TerniLapilli new.
		self assert: tablero ultimoMovimiento equals: $Y.
		tablero putXFila: 2 columna:2.
		self assert: tablero ultimoMovimiento equals: $X.
		self assert: (tablero fichasEnJuego) equals: 1.
		self assert: (tablero fichasDeX ) equals:1.
		self assert: (tablero fichasDeY ) equals: 0.
		self assert: (tablero quienOcupaFila: 2 columna:2 ) equals: $X.! !

!TestTerniLapilli methodsFor: 'test' stamp: 'cf 5/20/2019 18:59:31'!
test04
	|tablero|
		tablero := TerniLapilli new.
		self assert: tablero ultimoMovimiento equals: $Y.
		
		self should: [tablero putYFila: 2 columna:2.] raise:  Error 
			withExceptionDo:[:anError | anError messageText = TerniLapilli errorNoEsTuTurno . 
		self assert: (tablero fichasEnJuego) equals: 0.
		self assert: (tablero fichasDeX ) equals:0.
		self assert: (tablero fichasDeY ) equals: 0.
		self assert: (tablero ultimoMovimiento) equals: $Y.]! !

!TestTerniLapilli methodsFor: 'test' stamp: 'cf 5/20/2019 19:55:44'!
test05
	|tablero|
		tablero := TerniLapilli new.
		self assert: tablero ultimoMovimiento equals: $Y.
		
		self should: [tablero putYFila: 5 columna:(-1).] raise:  Error 
			withExceptionDo:[:anError | anError messageText = TerniLapilli errorFueraDeTablero . 
		self assert: (tablero fichasEnJuego) equals: 0.
		self assert: (tablero fichasDeX ) equals:0.
		self assert: (tablero fichasDeY ) equals: 0.
		self assert: (tablero ultimoMovimiento) equals: $Y.]! !


!classDefinition: #TerniLapilli category: #Tateti!
Object subclass: #TerniLapilli
	instanceVariableNames: 'tablero fichasEnJuego cantidadDeFichasDeX cantidadDeFichasDeY ultimoMovimiento'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tateti'!

!TerniLapilli methodsFor: 'initialization' stamp: 'cf 5/20/2019 18:51:54'!
initialize
	|fila1 fila2 fila3|
	fila1 := Array new:3 .
	fila2 := Array new:3 .
	fila3 := Array new:3 .
	tablero := Array with: fila1 with: fila2 with:fila3 .
	cantidadDeFichasDeX :=0.
	cantidadDeFichasDeY :=0.
	ultimoMovimiento := $Y.! !


!TerniLapilli methodsFor: 'Operations' stamp: 'cf 5/20/2019 19:59:16'!
putXFila: fila columna: columna 
	(self ultimoMovimiento = $X) ifTrue: [self signalNoEsTuTurno].
	(1 <= fila <= 3) ifFalse: [self signalFueraDelTablero ].
	(1 <= columna <= 3) ifFalse: [self signalFueraDelTablero ].
	(self estaOcupado:fila y:columna) ifTrue: [ ^self signalCasillaOcupada ].
	
	(tablero at: fila)at: columna put:$X. 
	cantidadDeFichasDeX := cantidadDeFichasDeX +1.
	ultimoMovimiento := $X.! !

!TerniLapilli methodsFor: 'Operations' stamp: 'cf 5/20/2019 19:59:28'!
putYFila: fila columna:columna
	(self ultimoMovimiento = $Y) ifTrue: [self signalNoEsTuTurno].
	(1 <= fila <= 3) ifFalse: [self signalFueraDelTablero ].
	(1 <= columna <= 3) ifFalse: [self signalFueraDelTablero ].
	(self estaOcupado:fila y:columna) ifTrue: [ ^self signalCasillaOcupada ].
	(tablero at: fila)at: columna put:$X. 
	cantidadDeFichasDeX := cantidadDeFichasDeX +1.
	ultimoMovimiento := $Y.! !


!TerniLapilli methodsFor: 'signals' stamp: 'cf 5/20/2019 18:29:16'!
signalCasillaOcupada
	^ self error: self class errorDeCasillaOcupada.! !

!TerniLapilli methodsFor: 'signals' stamp: 'cf 5/20/2019 19:57:40'!
signalFueraDelTablero
	^ self error: self class errorFueraDeTablero.! !

!TerniLapilli methodsFor: 'signals' stamp: 'cf 5/20/2019 18:55:07'!
signalNoEsTuTurno
	^ self error: self class errorNoEsTuTurno.! !


!TerniLapilli methodsFor: 'consultas' stamp: 'cf 5/20/2019 18:35:41'!
estaOcupado:fila y:columna
	
	^((self quienOcupaFila: fila columna: columna) = $X) or: [(self quienOcupaFila: fila columna: columna) = $Y].! !

!TerniLapilli methodsFor: 'consultas' stamp: 'cf 5/20/2019 17:59:55'!
fichasDeX
	^cantidadDeFichasDeX.! !

!TerniLapilli methodsFor: 'consultas' stamp: 'cf 5/20/2019 18:00:16'!
fichasDeY
	^cantidadDeFichasDeY.! !

!TerniLapilli methodsFor: 'consultas' stamp: 'cf 5/20/2019 18:00:40'!
fichasEnJuego
	^self fichasDeX + self fichasDeY .! !

!TerniLapilli methodsFor: 'consultas' stamp: 'cf 5/20/2019 18:19:40'!
quienOcupaFila: fila columna:columna
	^(tablero at: fila) at: columna .! !

!TerniLapilli methodsFor: 'consultas' stamp: 'cf 5/20/2019 18:51:41'!
ultimoMovimiento
	^ ultimoMovimiento! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: #Tateti!
TerniLapilli class
	instanceVariableNames: ''!

!TerniLapilli class methodsFor: 'errors' stamp: 'cf 5/20/2019 18:29:59'!
errorDeCasillaOcupada
	^'La Casilla se encuentra ocupada.'! !

!TerniLapilli class methodsFor: 'errors' stamp: 'cf 5/20/2019 19:57:04'!
errorFueraDeTablero
	^'Pusiste la ficha fuera del tablero'! !

!TerniLapilli class methodsFor: 'errors' stamp: 'cf 5/20/2019 18:56:19'!
errorNoEsTuTurno
	^'No es tu turno de jugar'! !
