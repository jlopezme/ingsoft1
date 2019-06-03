!classDefinition: #CarritoTest category: #TusLibros!
TestCase subclass: #CarritoTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CarritoTest methodsFor: 'as yet unclassified' stamp: 'j 6/3/2019 13:30:45'!
test01CreateCartCreatesAValidCart

	|carrito catalogoVacio listado|
	
	
	catalogoVacio  := OrderedCollection new.
	carrito := Carrito with: catalogoVacio .
	
	listado := (carrito listCart) reset .
	
	self assert: '0' equals: listado nextLine.
! !

!CarritoTest methodsFor: 'as yet unclassified' stamp: 'j 6/3/2019 13:53:02'!
test02AddingItemsToCartAddsTheItems

	|carrito catalogo listado|
	
	
	catalogo  := Dictionary new.
	catalogo at: 'Dune' put: 10.    
	carrito := Carrito with: catalogo.
	
	carrito addItem: 'Dune' andHisCuantity: 1. 
	
	listado := (carrito listCart) reset.
	
	self assert: '0|Dune|1' equals: listado nextLine.
! !

!CarritoTest methodsFor: 'as yet unclassified' stamp: 'j 6/3/2019 14:10:50'!
test03AddingNegativeItemsToCartIsNotAllowed

	|carrito catalogo|
	
	
	catalogo  := Dictionary new.
	catalogo at: 'Dune' put: 10.    
	carrito := Carrito with: catalogo.
	
	
	
	self
		should: [carrito addItem: 'Dune' andHisCuantity: -1.]
		raise: Error
		withExceptionDo: [:anError | 
			self assert: anError messageText equals: Carrito errorCantidadInvalida ].! !

!CarritoTest methodsFor: 'as yet unclassified' stamp: 'j 6/3/2019 14:10:33'!
test04AddingInvalidItemsToCartIsNotAllowed

	|carrito catalogo|
	
	
	catalogo  := Dictionary new.
	catalogo at: 'Dune' put: 10.    
	carrito := Carrito with: catalogo.
	
	
	
	self
		should: [carrito addItem: 'Neuromancer' andHisCuantity: 1.]
		raise: Error
		withExceptionDo: [:anError | 
			self assert: anError messageText equals: Carrito errorItemNoPerteneceAlCatalogo ].! !


!classDefinition: #Carrito category: #TusLibros!
Object subclass: #Carrito
	instanceVariableNames: 'catalogo itemcontent listCart totalAmount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Carrito methodsFor: 'signals' stamp: 'j 6/3/2019 14:08:51'!
signalIsNotAValidItem
	^self error: self class errorItemNoPerteneceAlCatalogo.! !

!Carrito methodsFor: 'signals' stamp: 'j 6/3/2019 14:08:55'!
signalNotAValidCuantity
	^self error: self class errorCantidadInvalida.! !


!Carrito methodsFor: 'Operations' stamp: 'j 6/3/2019 14:07:37'!
addItem: anItem andHisCuantity: cuantity
	( cuantity < 1) ifTrue: [ ^self signalNotAValidCuantity ].
	( catalogo includesKey: anItem ) ifTrue: [ itemcontent add: anItem withOccurrences: cuantity.
										     listCart nextPutAll: '|' ,anItem , '|', (cuantity asString).
											totalAmount := totalAmount + ((catalogo at: anItem )*cuantity )] 
									   ifFalse:[ ^self signalIsNotAValidItem.
			]! !

!Carrito methodsFor: 'Operations' stamp: 'cf 6/2/2019 22:12:16'!
listCart
	^listCart 
	! !


!Carrito methodsFor: 'initialization' stamp: 'j 6/3/2019 13:36:20'!
initializeWith: unCatalogo
	catalogo := unCatalogo .
	itemcontent := Bag  new.
	listCart := ReadWriteStream on: String new.
	listCart nextPutAll: '0'.
	totalAmount :=0.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Carrito class' category: #TusLibros!
Carrito class
	instanceVariableNames: ''!

!Carrito class methodsFor: 'errors' stamp: 'cf 6/2/2019 22:01:23'!
errorCantidadInvalida
	^'La cantidad Ingresada, no es válida.'! !

!Carrito class methodsFor: 'errors' stamp: 'cf 6/2/2019 22:03:22'!
errorItemNoPerteneceAlCatalogo
	^'El item que intentaste agregar, no pertenece al cátalogo.'! !

!Carrito class methodsFor: 'errors' stamp: 'j 6/3/2019 13:00:48'!
with: aCatalogue

	^self new initializeWith: aCatalogue ! !


!classDefinition: #TusLibros category: #TusLibros!
Object subclass: #TusLibros
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!
