!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:08'!
test01NewCartsAreCreatedEmpty

	self assert: self createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'cf 6/8/2019 10:20:13'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [ cart add: 1 of: 'Cuchillo' ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'cf 6/8/2019 10:20:33'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := self createCart.
	
	cart add: 1 of: 'Pelota' .
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'cf 6/8/2019 10:20:53'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 0 of: 'Pelota' .]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'cf 6/8/2019 09:59:08'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 2 of: 'Cuchillo'  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'cf 6/8/2019 10:21:09'!
test06CartRemembersAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: 1 of: 'Pelota' .
	self assert: (cart includes: 'Pelota')! !

!CartTest methodsFor: 'tests' stamp: 'cf 6/8/2019 10:00:19'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := self createCart.
	
	self deny: (cart includes: 'Pelota')! !

!CartTest methodsFor: 'tests' stamp: 'cf 6/8/2019 10:00:33'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: 2 of: 'Pelota'.
	self assert: (cart occurrencesOf: 'Pelota') = 2! !

!CartTest methodsFor: 'tests' stamp: 'cf 6/8/2019 09:28:56'!
test09YouCantCreateACartWithAnEmptyCatalog

	| cart anEmptyCatalog |
	
	anEmptyCatalog := Dictionary new.
	self 
		should: [ cart := Cart acceptingItemsOf: anEmptyCatalog ]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText  = Cart errorCatalogoVacio .]! !

!CartTest methodsFor: 'tests' stamp: 'cf 6/8/2019 12:08:24'!
test10TicketShowTheCorrectAmountOfAddingItems
	| cart ticket  |
	
	cart := self createCart .
	cart add: 3 of: 'Pelota' .
	ticket := cart listCart  .
	self assert: (ticket nextLine ) equals: 'Pelota'.
	self assert: (ticket nextLine ) equals: '3'.! !

!CartTest methodsFor: 'tests' stamp: 'cf 6/8/2019 11:49:34'!
test11CheckoutEmitACorrectTicket
	| cart ticket  |
	
	cart := self createCart .
	cart add: 3 of: 'Pelota' .
	ticket := cart listPurchases .
	self assert: (ticket nextLine ) equals: 'Pelota'.
	self assert: (ticket nextLine ) equals: '3'.
	self assert: (ticket nextLine ) equals: '9 pesos'.! !


!CartTest methodsFor: 'support' stamp: 'cf 6/8/2019 09:55:23'!
createCart
	
	^Cart acceptingItemsOf: self createCatalogWithProducts ! !

!CartTest methodsFor: 'support' stamp: 'cf 6/8/2019 09:58:00'!
createCatalogWithProducts
		|catalog|
		catalog := Dictionary new.
		catalog at: 'Pelota' put: (3 * peso ).
		catalog at: 'Goma' put: (4 * peso).
		^catalog ! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!


!CashierTest methodsFor: 'test' stamp: 'cf 6/8/2019 11:59:01'!
test01
	"el cashier no se puede crear con un carrito vacio"! !

!CashierTest methodsFor: 'test' stamp: 'cf 6/8/2019 12:00:44'!
test02
	"con un carrito válido cobra bien"! !

!CashierTest methodsFor: 'test' stamp: 'cf 6/8/2019 12:01:35'!
test03
	"al tratar de vender con una tarjeta mala dice error"! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !

!Cart methodsFor: 'error messages' stamp: 'cf 6/8/2019 09:22:52'!
signalEmptyCatalouge
	^self error: Cart errorCatalogoVacio.! !


!Cart methodsFor: 'assertions' stamp: 'cf 6/8/2019 09:54:07'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'cf 6/8/2019 10:36:13'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := Dictionary new.! !


!Cart methodsFor: 'queries' stamp: 'cf 6/8/2019 10:41:26'!
occurrencesOf: anItem

	^items at: anItem ! !


!Cart methodsFor: 'testing' stamp: 'cf 6/8/2019 10:37:19'!
includes: anItem

	^items includesKey: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'adding' stamp: 'cf 6/8/2019 10:36:45'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	items at: anItem put: aQuantity .! !


!Cart methodsFor: 'privates' stamp: 'cf 6/8/2019 12:06:40'!
calculateTotalWithShopingList:  aShopList
	|item itemAmount total|
	total:=0.
	item:= String new.
	itemAmount := 0.
	[(aShopList peek)notNil]  whileTrue: [  item := aShopList nextLine.
													itemAmount _ self occurrencesOf: item.
													aShopList nextLine.
													total := total + (itemAmount * (catalog at: item)). ].
	^total ! !

!Cart methodsFor: 'privates' stamp: 'cf 6/8/2019 12:04:58'!
makeTicketIn: aShopList 
	| total |
	total := self calculateTotalWithShopingList: aShopList .
	aShopList nextPutAll: (total asString).
	aShopList reset.! !

!Cart methodsFor: 'privates' stamp: 'cf 6/8/2019 11:26:44'!
putItemsInaList: itemList 
	items keysDo:  [ :item | itemList nextPutAll: (item asString ).
					    itemList newLine.	
					    itemList nextPutAll: (self occurrencesOf: item) asString.
					    itemList newLine.].
	itemList reset.	! !


!Cart methodsFor: 'Operations' stamp: 'cf 6/8/2019 11:49:00'!
listCart
	|itemList  |
	itemList := ReadWriteStream on: String new.
	self putItemsInaList: itemList .				
	^itemList.				! !

!Cart methodsFor: 'Operations' stamp: 'cf 6/8/2019 11:49:23'!
listPurchases
	| listshop |
	
	listshop := self listCart.
	self makeTicketIn: listshop  .
	^listshop 												
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'cf 6/8/2019 09:21:19'!
acceptingItemsOf: aCatalog
	(aCatalog isEmpty ) ifTrue: [^ Cart new signalEmptyCatalouge ].
	^self new initializeAcceptingItemsOf: aCatalog ! !


!Cart class methodsFor: 'errors' stamp: 'cf 6/8/2019 09:19:38'!
errorCatalogoVacio
	^'No puedes crear un carrito con un catalogo vacio'.! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'aCart aCreditCard aMerchantProccesor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'Privates' stamp: 'cf 6/8/2019 11:42:51'!
requestCart
	^aCart ! !


!Cashier methodsFor: 'consults' stamp: 'cf 6/8/2019 11:56:44'!
listCart
	^aCart listCart! !

!Cashier methodsFor: 'consults' stamp: 'cf 6/8/2019 11:56:19'!
listPurchases
	^ aCart listPurchases ! !


!Cashier methodsFor: 'charging' stamp: 'cf 6/8/2019 11:57:32'!
checkOutCart
	"con mi carrito,mi tarjeta de credito y el merchantProccesor emito el cashier o el error  "! !
