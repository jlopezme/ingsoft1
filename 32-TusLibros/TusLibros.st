!classDefinition: #Carrito category: #TusLibros!
Object subclass: #Carrito
	instanceVariableNames: 'catalogo itemcontent listCart totalAmount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Carrito methodsFor: 'signals' stamp: 'cf 6/2/2019 22:02:55'!
signalIsNotAValidItem
	^self error self class errorItemNoPerteneceAlCatalogo.! !

!Carrito methodsFor: 'signals' stamp: 'cf 6/2/2019 22:00:29'!
signalNotAValidCuantity
	^self error self class errorCantidadInvalida.! !


!Carrito methodsFor: 'Operations' stamp: 'cf 6/2/2019 22:21:11'!
addItem: anItem andHisCuantity: cuantity
	( cuantity < 1) ifTrue: [ self signalNotAValidCuantity ].
	( catalogo includesKey: anItem ) ifTrue: [ itemcontent add: anItem withOccurrences: cuantity.
										     listCart nextPutAll: '|' ,anItem , '|', cuantity.
											totalAmount := totalAmount + ((catalogo at: anItem )*cuantity )] ifFalse:[
			self signalIsNotAValidItem.
			]! !

!Carrito methodsFor: 'Operations' stamp: 'cf 6/2/2019 22:12:16'!
listCart
	^listCart 
	! !

!Carrito methodsFor: 'Operations' stamp: 'cf 6/2/2019 22:23:28'!
listPurchases
	|listPurchases|
	listPurchases := self listCart .
	listPurchases nextPutAll: '|', (totalAmount asString).
	^listPurchases ! !


!Carrito methodsFor: 'initialization' stamp: 'cf 6/2/2019 22:17:52'!
catalogoDeProductos: unCatalogo
	catalogo := unCatalogo .
	itemcontent := Bag  new.
	listCart := ReadWriteStream new on: '0'.
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


!classDefinition: #TusLibros category: #TusLibros!
Object subclass: #TusLibros
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!
