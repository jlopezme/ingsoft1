!classDefinition: #TestTerniLapilli category: #Tateti!
TestCase subclass: #TestTerniLapilli
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tateti'!

!TestTerniLapilli methodsFor: 'test' stamp: 'cf 5/25/2019 15:13:29'!
test01XpuedePonerUnaPiedraCorrectamente
	|tablero firstMove|
		firstMove := 2@2.
		tablero := TerniLapilli new.
		self assert: tablero ultimoMovimiento equals: $X.
		tablero putXAt: firstMove .
		self assert: tablero ultimoMovimiento equals: $O.
		self assert: (tablero fichasEnJuego) equals: 1.
		self assert: (tablero fichasDeX ) equals:1.
		self assert: (tablero fichasDeO ) equals: 0.
		self assert: (tablero quienOcupaLaPosision:  firstMove ) equals: $X.! !

!TestTerniLapilli methodsFor: 'test' stamp: 'cf 5/25/2019 15:45:59'!
test02DosPiezasNoPuedenOcuparUnaMismaPosicion
		|tablero aPosition|
		aPosition := 2@2.
		tablero := TerniLapilli new.
		tablero putXAt: aPosition.
		
		self should: [tablero putOAt: aPosition.] raise:  Error 
			withExceptionDo:[:anError | anError messageText = BoardState errorDeCasillaOcupada. 
		self assert: (tablero fichasEnJuego) equals: 1.
		self assert: (tablero fichasDeX ) equals:1.
		self assert: (tablero fichasDeO ) equals: 0.
		self assert: (tablero quienOcupaLaPosision: aPosition ) equals: $X.]! !

!TestTerniLapilli methodsFor: 'test' stamp: 'cf 5/25/2019 15:46:06'!
test03SeRespetanLosTurnos
	|tablero firstMove|
		firstMove := 2@2.
		tablero := TerniLapilli new.
		self assert: tablero ultimoMovimiento equals: $X.
		
		self should: [tablero putOAt: firstMove ] raise:  Error 
			withExceptionDo:[:anError | anError messageText = BoardState errorNoEsTuTurno . 
		self assert: (tablero fichasEnJuego) equals: 0.
		self assert: (tablero fichasDeX ) equals:0.
		self assert: (tablero fichasDeO ) equals: 0.
		self assert: (tablero ultimoMovimiento) equals: $X.]! !

!TestTerniLapilli methodsFor: 'test' stamp: 'cf 5/25/2019 15:46:15'!
test04NoPuedesColocarUnaPiezaFueraDelTablero
	|tablero invalidMove|
		tablero := TerniLapilli new.
		invalidMove := 6@(-1).
		self assert: tablero ultimoMovimiento equals: $X.
		
		self should: [tablero putXAt: invalidMove ] raise:  Error 
			withExceptionDo:[:anError | anError messageText = BoardState errorFueraDeTablero . 
		self assert: (tablero fichasEnJuego) equals: 0.
		self assert: (tablero fichasDeX ) equals:0.
		self assert: (tablero fichasDeO ) equals: 0.
		self assert: (tablero ultimoMovimiento) equals: $X.]! !

!TestTerniLapilli methodsFor: 'test' stamp: 'cf 5/25/2019 15:16:06'!
test05SePuedenPonerVariasPiezas
	|tablero firstMove secondMove|
		firstMove := 2@2.
		secondMove := 2@3.
		tablero := TerniLapilli new.
		self assert: tablero ultimoMovimiento equals: $X.
		tablero putXAt: firstMove .
		self assert: tablero ultimoMovimiento equals: $O.
		self assert: (tablero fichasEnJuego) equals: 1.
		self assert: (tablero fichasDeX ) equals:1.
		self assert: (tablero fichasDeO ) equals: 0.
		self assert: (tablero quienOcupaLaPosision:  firstMove ) equals: $X.
		self assert: tablero ultimoMovimiento equals: $O.
		tablero putOAt: secondMove .
		self assert: tablero ultimoMovimiento equals: $O.
		self assert: (tablero fichasEnJuego) equals: 2.
		self assert: (tablero fichasDeX ) equals:1.
		self assert: (tablero fichasDeO ) equals: 1.
		self assert: (tablero quienOcupaLaPosision:  secondMove ) equals: $O.! !

!TestTerniLapilli methodsFor: 'test' stamp: 'cf 5/25/2019 15:16:41'!
test06XPuedeGanar
	|tablero firstMove secondMove thirdMove fourthMove fifthMove|
		firstMove := 1@1.
		secondMove := 1@2.
		thirdMove := 2@1.
		fourthMove := 2@2.
		fifthMove := 3@1.
		
		tablero := TerniLapilli new.
		tablero putXAt: firstMove.
		tablero putOAt: secondMove.
		tablero putXAt: thirdMove .
		tablero putOAt: fourthMove .
		tablero putXAt: fifthMove .
		
		self assert: tablero winBy equals: 'X'.
		
		! !

!TestTerniLapilli methodsFor: 'test' stamp: 'cf 5/25/2019 15:16:51'!
test07OPuedeGanar
	|tablero firstMove secondMove thirdMove fourthMove fifthMove sixMove|
		firstMove := 1@1.
		secondMove := 1@2.
		thirdMove := 2@1.
		fourthMove := 2@2.
		fifthMove := 3@1.
		sixMove := 3@3.
		tablero := TerniLapilli new.
		tablero putXAt: secondMove .
		tablero putOAt: firstMove .
		tablero putXAt: fourthMove .
		tablero putOAt: thirdMove .
		tablero putXAt: sixMove .
		tablero putOAt: fifthMove .
		
		self assert: tablero winBy equals: 'O'.
		
		! !

!TestTerniLapilli methodsFor: 'test' stamp: 'cf 5/25/2019 15:24:51'!
test08DespuésDeGanarNadiePuedeJugar
	|tablero firstMove secondMove thirdMove fourthMove fifthMove sixMove|
		firstMove := 1@1.
		secondMove := 1@2.
		thirdMove := 2@1.
		fourthMove := 2@2.
		fifthMove := 3@1.
		sixMove := 3@2.
		tablero := TerniLapilli new.
		tablero putXAt: firstMove.
		tablero putOAt: secondMove.
		tablero putXAt: thirdMove .
		tablero putOAt: fourthMove .
		tablero putXAt: fifthMove .		
		self assert: tablero winBy equals: 'X'.
		.
		self should: [tablero putOAt: sixMove ] raise:  Error 
			withExceptionDo:[:anError | anError messageText = BoardState errorGameOver . 
		self assert: (tablero fichasEnJuego) equals: 5.
		self assert: (tablero fichasDeX ) equals:3.
		self assert: (tablero fichasDeO ) equals: 2.]! !

!TestTerniLapilli methodsFor: 'test' stamp: 'cf 5/25/2019 15:59:13'!
test09NoSePuedeDeslizarPiezasAlPrincipio
	|tablero firstPosition secondPosition|
	tablero := TerniLapilli new.
	firstPosition := 2@2.
	secondPosition := 3@2.

	self should: [tablero slideXFrom: firstPosition to: secondPosition ] raise:  Error 
				withExceptionDo:[:anError | anError messageText = BoardState errorEmptyBoard . 
		self assert: (tablero fichasEnJuego) equals: 0.
		self assert: (tablero fichasDeX ) equals:0.
		self assert: (tablero fichasDeO ) equals: 0.]! !

!TestTerniLapilli methodsFor: 'test' stamp: 'cf 5/25/2019 16:04:58'!
test10NoSePuedeDeslizarPiezasHastaNoLlenarlo
	|tablero firstMove secondMove thirdMove newLocation |
		firstMove := 1@1.
		secondMove := 1@2.
		thirdMove := 2@1.
		newLocation := 3@1.
		
		tablero := TerniLapilli new.
		tablero putXAt: firstMove.
		tablero putOAt: secondMove.
		tablero putXAt: thirdMove .
	

	self should: [tablero slideXFrom: firstMove to: newLocation ] raise:  Error 
				withExceptionDo:[:anError | anError messageText = BoardState errorTheBoardIsNotFullYet . 
		self assert: (tablero fichasEnJuego) equals: 3.
		self assert: (tablero fichasDeX ) equals:2.
		self assert: (tablero fichasDeO ) equals: 1.]! !


!classDefinition: #BoardState category: #Tateti!
Object subclass: #BoardState
	instanceVariableNames: 'board winingPositions xPositions oPositions actualTurn winBy'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tateti'!

!BoardState methodsFor: 'checkings' stamp: 'cf 5/25/2019 12:12:14'!
checkIfValidPosition: aPosition.
	^(((aPosition x) between: 1 and: 3) and:[((aPosition y) between: 1 and: 3)]).! !

!BoardState methodsFor: 'checkings' stamp: 'cf 5/25/2019 12:15:36'!
fichasDeO
	^ oPositions size.! !

!BoardState methodsFor: 'checkings' stamp: 'cf 5/25/2019 12:15:47'!
fichasDex
	^ xPositions size.! !

!BoardState methodsFor: 'checkings' stamp: 'cf 5/25/2019 12:16:37'!
fichasEnJuego
	^ self fichasDeO + self fichasDex .! !

!BoardState methodsFor: 'checkings' stamp: 'cf 5/25/2019 12:24:16'!
quienOcupaLaPosision: aPosition 
	^ (board  at: (aPosition x)) at: (aPosition y).! !


!BoardState methodsFor: 'playing' stamp: 'cf 5/25/2019 15:43:11'!
slideOFrom: aPosition to: newPosition 
	^self subclassResponsibility! !


!BoardState methodsFor: 'error handling' stamp: 'cf 5/25/2019 16:01:14'!
signalBoardIsNotFull
	^self error self class errorTheBoardIsNotFullYet.! !

!BoardState methodsFor: 'error handling' stamp: 'cf 5/25/2019 15:51:29'!
signalEmptyBoard
	^self error self class errorEmptyBoard.! !

!BoardState methodsFor: 'error handling' stamp: 'cf 5/25/2019 15:23:46'!
signalGameIsOver
	^self error self class errorGameOver.! !

!BoardState methodsFor: 'error handling' stamp: 'cf 5/25/2019 13:47:46'!
signalIsNotAValidPosition
	^self error self class errorFueraDeTablero ! !

!BoardState methodsFor: 'error handling' stamp: 'cf 5/25/2019 13:36:45'!
signalPlaceAlreadyTaken
	^self error self class errorDeCasillaOcupada .! !

!BoardState methodsFor: 'error handling' stamp: 'cf 5/25/2019 15:48:41'!
signalTheBoardIsFull
	^self error self class errorElTableroEstaLleno ! !

!BoardState methodsFor: 'error handling' stamp: 'cf 5/25/2019 15:47:54'!
signalXStartFirst
	^ self error self class errorNoEsTuTurno ! !


!BoardState methodsFor: 'boardsQuestions' stamp: 'cf 5/25/2019 13:39:14'!
actualTurn
	^actualTurn! !

!BoardState methodsFor: 'boardsQuestions' stamp: 'cf 5/25/2019 14:06:30'!
whoWins
	^ winBy ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BoardState class' category: #Tateti!
BoardState class
	instanceVariableNames: ''!

!BoardState class methodsFor: 'errorSignals' stamp: 'cf 5/25/2019 13:36:05'!
errorDeCasillaOcupada
	^'La Casilla se encuentra ocupada.'! !

!BoardState class methodsFor: 'errorSignals' stamp: 'cf 5/25/2019 15:46:57'!
errorElTableroEstaLleno
	^'No se pueden agregar más fichas'! !

!BoardState class methodsFor: 'errorSignals' stamp: 'cf 5/25/2019 15:53:01'!
errorEmptyBoard
	^'El tablero esta vació'! !

!BoardState class methodsFor: 'errorSignals' stamp: 'cf 5/25/2019 13:36:15'!
errorFueraDeTablero
	^'Pusiste la ficha fuera del tablero'! !

!BoardState class methodsFor: 'errorSignals' stamp: 'cf 5/25/2019 15:24:10'!
errorGameOver
	^'This game is Over'.! !

!BoardState class methodsFor: 'errorSignals' stamp: 'cf 5/25/2019 13:36:25'!
errorNoEsTuTurno
	^'No es tu turno de jugar'! !

!BoardState class methodsFor: 'errorSignals' stamp: 'cf 5/25/2019 16:01:43'!
errorTheBoardIsNotFullYet
	^'Todavía no esta lleno el tablero'.! !


!classDefinition: #Full category: #Tateti!
BoardState subclass: #Full
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tateti'!

!Full methodsFor: 'playing' stamp: 'cf 5/25/2019 15:49:05'!
putOAt: aPosition
	^self signalTheBoardIsFull ! !

!Full methodsFor: 'playing' stamp: 'cf 5/25/2019 15:49:11'!
putXAt: aPosition
	^self signalTheBoardIsFull ! !

!Full methodsFor: 'playing' stamp: 'cf 5/25/2019 15:43:47'!
slideOFrom: aPosition to: newPosition ! !

!Full methodsFor: 'playing' stamp: 'cf 5/25/2019 15:43:50'!
slideXFrom: aPosition to: newPosition ! !


!Full methodsFor: 'initialization' stamp: 'cf 5/25/2019 15:38:11'!
playingWith: thisBoard next:next xposition: xpositions oposition:opositions WiningPosition: winingpositions .
	board := thisBoard .
	actualTurn := next .
	xPositions := xpositions .
	oPositions := opositions .
	winingPositions := winingpositions .
	winBy := 'none'.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Full class' category: #Tateti!
Full class
	instanceVariableNames: ''!

!Full class methodsFor: 'class creation' stamp: 'cf 5/25/2019 15:36:45'!
withThisBoard: thisBoard nextTurn: next xpositions: xPositions opositions:oPositions andWiningPositions: winingPositions
	^Full new playingWith: thisBoard next:next xposition: xPositions oposition:oPositions WiningPosition: winingPositions .
	! !


!classDefinition: #NotFull category: #Tateti!
BoardState subclass: #NotFull
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tateti'!

!NotFull methodsFor: 'playing' stamp: 'cf 5/25/2019 15:34:01'!
putOAt: aPosition
	|positionHolder|
	positionHolder := self quienOcupaLaPosision: aPosition .
	((positionHolder = $X) or:[ positionHolder = $O] ) ifTrue: 
		[self signalPlaceAlreadyTaken]
		 ifFalse: [ (board at: (aPosition x)) at: (aPosition y) put: $O.
			oPositions add: aPosition.
			( oPositions size =3) ifTrue: [ (winingPositions includes: oPositions) ifTrue:
				 [^Winned by: 'O' withThisBoard: board andXPositions: xPositions  andOPositions: oPositions  andWiningPosition: winingPositions ]
				ifFalse: [^Full  withThisBoard:board nextTurn: 'X' xpositions: xPositions opositions:oPositions andWiningPositions: winingPositions  ]
				]. ]! !

!NotFull methodsFor: 'playing' stamp: 'cf 5/25/2019 15:06:44'!
putXAt: aPosition
	|positionHolder|
	positionHolder := self quienOcupaLaPosision: aPosition .
	((positionHolder = $X) or:[ positionHolder = $O] ) ifTrue: 
		[self signalPlaceAlreadyTaken]
		 ifFalse: [ (board at: (aPosition x)) at: (aPosition y) put: $X.
					xPositions add: aPosition.
					( xPositions size =3) ifTrue: [ (winingPositions includes: xPositions) ifTrue: [^Winned by: 'X' withThisBoard: board andXPositions: xPositions  andOPositions: oPositions  andWiningPosition: winingPositions ]]. ]! !

!NotFull methodsFor: 'playing' stamp: 'cf 5/25/2019 16:00:31'!
slideOFrom: aPosition to: newPosition 
	^self signalBoardIsNotFull.! !

!NotFull methodsFor: 'playing' stamp: 'cf 5/25/2019 16:00:40'!
slideXFrom: aPosition to: newPosition 
	^self signalBoardIsNotFull.! !



!NotFull methodsFor: 'initialization' stamp: 'cf 5/25/2019 14:03:37'!
initializeWith: winingpositions and: aPosition and: thisBoard 
	winingPositions := winingpositions .
	xPositions := OrderedCollection with: aPosition .
	oPositions := OrderedCollection new.
	board := thisBoard.
	(board at: (aPosition x)) at: (aPosition y) put: $X.
	actualTurn := $O.
	winBy := 'none'.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NotFull class' category: #Tateti!
NotFull class
	instanceVariableNames: ''!

!NotFull class methodsFor: 'class initialization' stamp: 'cf 5/25/2019 13:19:46'!
with: winingpositions  and: aPosition with: board
	^NotFull new initializeWith: winingpositions and: aPosition and: board  .! !


!classDefinition: #Started category: #Tateti!
BoardState subclass: #Started
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tateti'!

!Started methodsFor: 'playing' stamp: 'cf 5/25/2019 12:28:51'!
putOAt: aPosition
	^self signalXStartFirst.! !

!Started methodsFor: 'playing' stamp: 'cf 5/25/2019 13:21:12'!
putXAt: aPosition
	(self checkIfValidPosition: aPosition) ifTrue: [ ^NotFull  with: winingPositions and: aPosition  with: board .]
	 ifFalse: [self signalIsNotAValidPosition].! !

!Started methodsFor: 'playing' stamp: 'cf 5/25/2019 15:53:16'!
slideOFrom: aPosition to: newPosition 
	^self signalEmptyBoard ! !

!Started methodsFor: 'playing' stamp: 'cf 5/25/2019 15:51:54'!
slideXFrom: aPosition to: newPosition 
	^self signalEmptyBoard ! !


!Started methodsFor: 'initialization' stamp: 'cf 5/25/2019 14:03:17'!
initialize
	|fila1 fila2 fila3 topHoriz midHoriz lowHoriz firstColumn secondColumn thirdColumn leftToRightDiag rightToLeftDiag |
	topHoriz:= OrderedCollection with: (1@1) with:(1@2) with: (1@3). 
	midHoriz := OrderedCollection with: (2@1) with:(2@2) with: (2@3). 
	lowHoriz := OrderedCollection with: (3@1) with:(3@2) with: (3@3).
	firstColumn:= OrderedCollection with: (1@1) with:(2@1) with: (3@1).
	secondColumn := OrderedCollection with: (1@2) with:(2@2) with: (3@2).
	thirdColumn := OrderedCollection with: (1@3) with:(2@3) with: (3@3).
	leftToRightDiag := OrderedCollection with: (1@1) with:(2@2) with: (3@3).
	rightToLeftDiag := OrderedCollection with: (1@3) with:(2@2) with: (3@1).
	fila1:= OrderedCollection with: nil with: nil with: nil .
	fila2:= OrderedCollection with: nil with: nil with: nil.
	fila3:= OrderedCollection with: nil with: nil with: nil.
	board := OrderedCollection with: fila1 with:fila2 with: fila3 .
	oPositions:= OrderedCollection new. 
	xPositions:= OrderedCollection new.
	
	winingPositions := OrderedCollection with: topHoriz  with: midHoriz with:lowHoriz with:firstColumn with: secondColumn with:thirdColumn.
	winingPositions add: leftToRightDiag; add:rightToLeftDiag.
	actualTurn := $X.
	winBy := 'none'.! !


!classDefinition: #Winned category: #Tateti!
BoardState subclass: #Winned
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tateti'!

!Winned methodsFor: 'playing' stamp: 'cf 5/25/2019 15:23:03'!
putOAt: aPosition
	^self signalGameIsOver ! !

!Winned methodsFor: 'playing' stamp: 'cf 5/25/2019 15:23:08'!
putXAt: aPosition
	^self signalGameIsOver ! !

!Winned methodsFor: 'playing' stamp: 'cf 5/25/2019 15:44:28'!
slideOFrom: aPosition to: newPosition ! !

!Winned methodsFor: 'playing' stamp: 'cf 5/25/2019 15:44:31'!
slideXFrom: aPosition to: newPosition ! !


!Winned methodsFor: 'initialization' stamp: 'cf 5/25/2019 15:06:04'!
whoWins: winner withThisBoard: thisBoard xPosition:xpositions oPosition: opositions andWinningPositions: winingpositions 
	winBy := winner .
	board := thisBoard .
	xPositions := xpositions .
	oPositions := opositions .
	winingPositions := winingpositions .
	actualTurn := 'finished'.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Winned class' category: #Tateti!
Winned class
	instanceVariableNames: ''!

!Winned class methodsFor: 'class initialization' stamp: 'cf 5/25/2019 15:02:30'!
by: winner withThisBoard: board andXPositions: xpositions andOPositions: opositions andWiningPosition: winingpositions
	^Winned new whoWins: winner withThisBoard: board xPosition:xpositions oPosition: opositions andWinningPositions: winingpositions .! !


!classDefinition: #TerniLapilli category: #Tateti!
Object subclass: #TerniLapilli
	instanceVariableNames: 'board'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tateti'!

!TerniLapilli methodsFor: 'initialization' stamp: 'cf 5/25/2019 11:12:41'!
initialize
	board := Started new.! !


!TerniLapilli methodsFor: 'playing' stamp: 'cf 5/25/2019 13:28:06'!
putOAt: aPosition
 
	^board := board putOAt: aPosition .! !

!TerniLapilli methodsFor: 'playing' stamp: 'cf 5/25/2019 11:35:07'!
putXAt: aPosition
	board := board putXAt: aPosition .! !

!TerniLapilli methodsFor: 'playing' stamp: 'cf 5/25/2019 15:42:15'!
slidingO: aPosition destination: newPosition
	board := board slideOFrom: aPosition to: newPosition .! !

!TerniLapilli methodsFor: 'playing' stamp: 'cf 5/25/2019 15:42:36'!
slidingX: aPosition destination: newPosition
	board := board slideXFrom: aPosition to: newPosition .! !


!TerniLapilli methodsFor: 'boardQuestions' stamp: 'cf 5/25/2019 12:20:01'!
fichasDeO
	^ board fichasDeO. ! !

!TerniLapilli methodsFor: 'boardQuestions' stamp: 'cf 5/25/2019 12:18:50'!
fichasDeX
	^ board fichasDex ! !

!TerniLapilli methodsFor: 'boardQuestions' stamp: 'cf 5/25/2019 12:16:51'!
fichasEnJuego
	^board fichasEnJuego .! !

!TerniLapilli methodsFor: 'boardQuestions' stamp: 'cf 5/25/2019 12:22:08'!
quienOcupaLaPosision: aPosition
	^board quienOcupaLaPosision: aPosition .! !

!TerniLapilli methodsFor: 'boardQuestions' stamp: 'cf 5/25/2019 13:38:47'!
ultimoMovimiento
	^board actualTurn.! !

!TerniLapilli methodsFor: 'boardQuestions' stamp: 'cf 5/25/2019 14:05:57'!
winBy
	^board whoWins.! !
