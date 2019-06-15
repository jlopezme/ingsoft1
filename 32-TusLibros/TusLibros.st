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

!CartTest methodsFor: 'tests' stamp: 'cf 6/9/2019 12:26:35'!
test10TicketShowTheCorrectAmountOfAddingItems
	| cart ticket  |
	
	cart := self createCart .
	cart add: 3 of: 'Pelota' .
	ticket := (cart listCart) reset  .
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

!CashierTest methodsFor: 'setUps' stamp: 'cf 6/9/2019 12:45:56'!
cartWithValidPurchases
	|cartWithPurchases|
	cartWithPurchases := self emptyCart .
	cartWithPurchases add: 2 of: 'Goma'.
	cartWithPurchases add: 1 of: 'Pelota'.
	^cartWithPurchases .! !

!CashierTest methodsFor: 'setUps' stamp: 'cf 6/9/2019 10:59:51'!
cashierWithAvalidCartAndCreditCard
	^NewCashier with: self cartWithValidPurchases thisCreditCard: self validCreditCard .! !

!CashierTest methodsFor: 'setUps' stamp: 'cf 6/9/2019 12:55:19'!
cashierWithAvalidCartAndInvalidCreditCard
	^NewCashier with: self cartWithValidPurchases thisCreditCard: self expiredCreditCard .! !

!CashierTest methodsFor: 'setUps' stamp: 'cf 6/9/2019 10:53:14'!
cashierWithEmptyCart 
	^NewCashier with: (self emptyCart) thisCreditCard: (self validCreditCard ).! !

!CashierTest methodsFor: 'setUps' stamp: 'cf 6/8/2019 12:14:18'!
emptyCart
	|catalog|
		catalog := Dictionary new.
		catalog at: 'Pelota' put: (3 * peso ).
		catalog at: 'Goma' put: (4 * peso).
		^ Cart acceptingItemsOf: catalog .! !

!CashierTest methodsFor: 'setUps' stamp: 'cf 6/9/2019 10:02:52'!
expiredCreditCard
	^CreditCard firstname: 'Alan' lastName:'Kay'  expiration:(June of: 1961)  cardNumber: 4378282246310005! !

!CashierTest methodsFor: 'setUps' stamp: 'cf 6/9/2019 10:05:49'!
validCreditCard
	^CreditCard firstname: 'Alan' lastName:'Kay'  expiration:((GregorianMonthOfYear current) next )  cardNumber: 4378282246310005
	! !


!CashierTest methodsFor: 'test' stamp: 'cf 6/9/2019 10:53:44'!
test01CantCreateACashierWithEmptyCart

	self should: [self cashierWithEmptyCart ] 
					raise: Error - MessageNotUnderstood 
	 					description: [:anError|anError messageText = (CashierState errorEmptyCart )]	! !

!CashierTest methodsFor: 'test' stamp: 'cf 6/15/2019 09:20:20'!
test02ACashierEmitsAFormattedTicketWhenItHasAValidCart
	
	|cashier listCart firstItem secondItem|
	cashier := self cashierWithAvalidCartAndCreditCard .
	listCart := cashier listCart.
	listCart reset.
	firstItem := '0|Goma|2'.
	secondItem:= '|Pelota|1'.
	self assert: (firstItem,secondItem) equals: listCart nextLine .! !

!CashierTest methodsFor: 'test' stamp: 'cf 6/9/2019 13:13:23'!
test03CashierEmitsTheRightAmountForPayment
	|cashier purchaseTicket listTicket  total|
	cashier := self cashierWithAvalidCartAndCreditCard .
	total:= cashier cartTotalAmount .
	purchaseTicket := cashier listPurchases .
	listTicket := (cashier listCart) .	
	self assert: ((listTicket nextPutAll: ('|', (total asString )) )reset nextLine )equals: purchaseTicket nextLine .! !

!CashierTest methodsFor: 'test' stamp: 'cf 6/15/2019 09:21:17'!
test04CantPayWithInvalidCrediCard
	
	
	|cashier|
	cashier := self cashierWithAvalidCartAndInvalidCreditCard .
	
	self should: [cashier checkOutCart ] 
		 raise: Error - MessageNotUnderstood 
	 	 withExceptionDo: [:anError|
			self assert: anError messageText = (NewCashier errorTarjetaVencida )]	! !

!CashierTest methodsFor: 'test' stamp: 'cf 6/15/2019 09:55:37'!
test05ConsultACashierBeforeCheckOutIndicates0AsTotalCharged
	
	|cashier|
	cashier := self cashierWithAvalidCartAndInvalidCreditCard .
	self assert: (cashier totalCharged) equals: (0*peso). 	! !

!CashierTest methodsFor: 'test' stamp: 'cf 6/15/2019 09:49:58'!
test06AfterTheCheckOutTheCashierRememberHowMuchHasCharged
	|cashier totalToCharge|
	cashier := self cashierWithAvalidCartAndCreditCard .
	totalToCharge := cashier cartTotalAmount .
	cashier checkOutCart .
	self assert: (cashier totalCharged ) equals: totalToCharge .! !


!classDefinition: #CreditCardTest category: #TusLibros!
TestCase subclass: #CreditCardTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCardTest methodsFor: 'test' stamp: 'cf 6/8/2019 22:24:38'!
test01CreditCardKnowsItsOwnerAndNumber

	|card|
	
	card := self validCreditCard .
	
	self assert: (card ownerName ) equals: 'Alan'.
	self assert: (card ownerLastName ) equals: 'Kay'.
	self assert: card cardNumber equals: '4378282246310005'.! !

!CreditCardTest methodsFor: 'test' stamp: 'cf 6/9/2019 10:04:47'!
test02ACardCansaidIfItsExpiredAccordingToADate

	|notExpiredCard expiredCard actualMonth  |
	
	notExpiredCard := self validCreditCard .
	expiredCard := self expiredCard.
	
	actualMonth := (GregorianMonthOfYear current).
	
	self deny: (notExpiredCard isItExpired: actualMonth ).
	self assert: (expiredCard isItExpired: actualMonth )! !

!CreditCardTest methodsFor: 'test' stamp: 'cf 6/9/2019 10:36:38'!
test03CanCreateAcreditCardWithEmptyNameOrLastName
	self should: [^CreditCard firstname: '' lastName:''  expiration:((GregorianMonthOfYear current) next )  cardNumber: 4378282246310005]
							 raise: Error 
								description: [:anError| anError messageText = CreditCard new signalEmptyNames ]! !

!CreditCardTest methodsFor: 'test' stamp: 'cf 6/9/2019 10:48:22'!
test04CantCreateACreditCardWithWrongCreditNumber
	self should: [^CreditCard firstname: 'Alan' lastName:'Kay'  expiration:((GregorianMonthOfYear current) next )  cardNumber: 0]
							 raise: Error 
								description: [:anError| anError messageText = CreditCard new signalInvalidNumber ]! !


!CreditCardTest methodsFor: 'setUp' stamp: 'cf 6/8/2019 22:23:14'!
expiredCard
	^CreditCard firstname: 'Alan' lastName:'Kay'  expiration:(June of: 1961)  cardNumber: 4378282246310005! !

!CreditCardTest methodsFor: 'setUp' stamp: 'cf 6/9/2019 10:04:28'!
validCreditCard
	^CreditCard firstname: 'Alan' lastName:'Kay'  expiration:((GregorianMonthOfYear current) next )  cardNumber: 4378282246310005
	! !


!classDefinition: #RestInterfaceTest category: #TusLibros!
TestCase subclass: #RestInterfaceTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!


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


!Cart methodsFor: 'queries' stamp: 'cf 6/9/2019 12:59:58'!
cartTotalAmount
	^self calculateTotalWithShopingList:  (self listCart reset) .! !

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

!Cart methodsFor: 'privates' stamp: 'cf 6/9/2019 12:59:58'!
makeTicketIn: aShopList 
	| total |
	total := self cartTotalAmount .
	aShopList nextPutAll: (total asString).
	aShopList reset.! !

!Cart methodsFor: 'privates' stamp: 'cf 6/9/2019 12:22:45'!
putItemsInaList: itemList 
	items keysDo:  [ :item | itemList nextPutAll: (item asString ).
					    itemList newLine.	
					    itemList nextPutAll: (self occurrencesOf: item) asString.
					    itemList newLine.].
	itemList .	! !


!Cart methodsFor: 'Operations' stamp: 'cf 6/9/2019 12:26:02'!
listCart
	|itemList  |
	itemList := ReadWriteStream on: String new.
	self putItemsInaList: itemList .				
	^itemList .				! !

!Cart methodsFor: 'Operations' stamp: 'cf 6/9/2019 12:59:58'!
listPurchases
	| listshop |
	
	listshop := self listCart.
	listshop nextPutAll: (self cartTotalAmount ) asString.
	listshop reset.
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


!classDefinition: #CashierState category: #TusLibros!
Object subclass: #CashierState
	instanceVariableNames: 'aCart aCreditCard aMerchantProcessor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierState methodsFor: 'charging' stamp: 'cf 6/8/2019 21:22:31'!
checkOutCart
	^self subclassResponsibility ! !


!CashierState methodsFor: 'consults' stamp: 'cf 6/9/2019 12:05:37'!
cartTotalAmount
	^ aCart cartTotalAmount.! !

!CashierState methodsFor: 'consults' stamp: 'cf 6/9/2019 13:01:56'!
listCart
	"0|ISBN_1|QUANTITY_1|ISBN_2|QUANTITY_2|....|ISBN_N|QUANTITY_N"
	|listCart listCartFormated|
	listCartFormated := ReadWriteStream on: String new.
	listCart := aCart listCart .
	listCartFormated nextPutAll: '0'.
	listCart reset.
	[(listCart peek) notNil ]whileTrue: [
				listCartFormated nextPutAll: '|', (listCart nextLine) , '|', (listCart nextLine ).].
	^listCartFormated 			! !

!CashierState methodsFor: 'consults' stamp: 'cf 6/9/2019 12:04:03'!
listPurchases
	"0|ISBN_1|QUANTITY_1|ISBN_2|QUANTITY_2|....|ISBN_N|QUANTITY_N|TOTAL_AMOUNT"
	|cashierList totalAmount|
	cashierList := self listCart .
	totalAmount := self cartTotalAmount .
	cashierList nextPutAll: '|', (totalAmount ) asString.
	^cashierList reset.! !


!CashierState methodsFor: 'signals' stamp: 'cf 6/9/2019 10:19:19'!
signalEmptyCart
	^self error: self class errorEmptyCart ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CashierState class' category: #TusLibros!
CashierState class
	instanceVariableNames: ''!

!CashierState class methodsFor: 'error' stamp: 'cf 6/9/2019 10:12:55'!
errorEmptyCart
	^'No se puede usar un carrito vacio para el cajero'.! !


!classDefinition: #NewCashier category: #TusLibros!
CashierState subclass: #NewCashier
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!NewCashier methodsFor: 'charging' stamp: 'cf 6/15/2019 10:09:08'!
checkOutCart
	
	self checkForExpiredCard.
	
	aMerchantProcessor checkCreditCard: aCreditCard andAmount: self cartTotalAmount .

	[self become: (UsedCashier with: aCart thisCreditCard: aCreditCard )]
		on:MethodInCallStackToBecomeInvalid
		do: [ :anError | anError resume ]
	! !


!NewCashier methodsFor: 'consults' stamp: 'cf 6/15/2019 09:19:16'!
checkForExpiredCard
	(aCreditCard isItExpired: (GregorianMonthOfYear current))ifTrue: [^self signalTheCardIsExpired]! !

!NewCashier methodsFor: 'consults' stamp: 'cf 6/15/2019 09:55:08'!
totalCharged
	^0*peso! !


!NewCashier methodsFor: 'signals' stamp: 'cf 6/15/2019 09:17:46'!
signalTheCardIsExpired
	^self error: self class errorTarjetaVencida.! !


!NewCashier methodsFor: 'initialization' stamp: 'j 6/9/2019 22:20:31'!
initializeWith: thisCart andThis: creditCard
	aCart := thisCart .
	aCreditCard := creditCard .
	aMerchantProcessor  := MerchantProcessorProxy new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NewCashier class' category: #TusLibros!
NewCashier class
	instanceVariableNames: ''!

!NewCashier class methodsFor: 'instance creation' stamp: 'cf 6/9/2019 10:19:36'!
with: thisCart thisCreditCard: creditCard 
	(thisCart isEmpty) ifTrue: [^CashierState new signalEmptyCart ].
	^self new initializeWith: thisCart andThis: creditCard ! !


!NewCashier class methodsFor: 'error' stamp: 'cf 6/15/2019 09:18:14'!
errorTarjetaVencida
	^'La tarjeta se encuentra vencida'.! !


!classDefinition: #UsedCashier category: #TusLibros!
CashierState subclass: #UsedCashier
	instanceVariableNames: 'sellBook'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!UsedCashier methodsFor: 'signals' stamp: 'cf 6/9/2019 09:56:53'!
signalItsAlreadyCheckOut
	^self error: self class errorCarritoyacobrado.! !


!UsedCashier methodsFor: 'consults' stamp: 'cf 6/15/2019 09:25:56'!
totalCharged
	^ sellBook .! !


!UsedCashier methodsFor: 'charging' stamp: 'cf 6/8/2019 21:23:20'!
checkOutCart
	^self signalItsAlreadyCheckOut! !


!UsedCashier methodsFor: 'initialization' stamp: 'cf 6/15/2019 09:25:15'!
initializeWith: thisCart andThis: creditCard
	aCart := thisCart .
	aCreditCard := creditCard .
	sellBook := aCart cartTotalAmount .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'UsedCashier class' category: #TusLibros!
UsedCashier class
	instanceVariableNames: ''!

!UsedCashier class methodsFor: 'error' stamp: 'cf 6/9/2019 09:57:58'!
errorCarritoyacobrado
	^'Este Cajero ya cobro a su carrito'.! !


!UsedCashier class methodsFor: 'instance creation' stamp: 'cf 6/8/2019 21:30:00'!
with: thisCart thisCreditCard: creditCard 
	^self new initializeWith: thisCart andThis: creditCard ! !


!classDefinition: #CreditCard category: #TusLibros!
Object subclass: #CreditCard
	instanceVariableNames: 'ownerfirstName ownerLastName expDate cardNumber'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'initialization' stamp: 'cf 6/8/2019 22:21:06'!
ownerName: ownersName  ownerLastName: ownerlastName expiration: expirationDate number: number
	cardNumber := number .
	ownerfirstName := ownersName.
	ownerLastName := ownerlastName .
	expDate := expirationDate.! !


!CreditCard methodsFor: 'signals' stamp: 'cf 6/9/2019 10:28:13'!
signalEmptyNames
	^self error: self class errorNombresVacios.! !

!CreditCard methodsFor: 'signals' stamp: 'cf 6/9/2019 10:35:27'!
signalInvalidNumber
	^self error: self class errorNumeroDeTarjetaInvalido.! !


!CreditCard methodsFor: 'consults' stamp: 'j 6/8/2019 17:28:11'!
cardNumber
	^cardNumber asString ! !

!CreditCard methodsFor: 'consults' stamp: 'cf 6/8/2019 21:51:36'!
isItExpired: actualDate
	^ expDate < actualDate 														! !

!CreditCard methodsFor: 'consults' stamp: 'cf 6/8/2019 22:24:07'!
ownerLastName

	^ownerLastName ! !

!CreditCard methodsFor: 'consults' stamp: 'cf 6/8/2019 22:23:54'!
ownerName

	^ownerfirstName ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'errors' stamp: 'cf 6/9/2019 10:28:46'!
errorNombresVacios
	^'No se pueden crear tarjetas con nombres vacios'.! !

!CreditCard class methodsFor: 'errors' stamp: 'cf 6/9/2019 10:35:47'!
errorNumeroDeTarjetaInvalido
	^'Numero de tarjeta invalido'.! !


!CreditCard class methodsFor: 'instance creation' stamp: 'cf 6/9/2019 10:42:03'!
firstname: ownerName lastName: ownerLastName expiration: expirationDate cardNumber: number
	self assertIfOwnerHasAvalidName: ownerName and: ownerLastName .
	self assertIfOwnerHasAvalidCreditNumber: number.
	^self new ownerName: ownerName  ownerLastName: ownerLastName expiration: expirationDate number: number! !


!CreditCard class methodsFor: 'asserts' stamp: 'cf 6/9/2019 10:49:08'!
assertIfOwnerHasAvalidCreditNumber: number
	|rightLong isValidType|
	rightLong := (((number asString) size) =16).
	isValidType := (number isKindOf: SmallInteger ).
	(rightLong and:[isValidType]) ifFalse: [^CreditCard new signalInvalidNumber]. ! !

!CreditCard class methodsFor: 'asserts' stamp: 'cf 6/9/2019 10:40:02'!
assertIfOwnerHasAvalidName: ownerName and: ownerLastName
	(((ownerName isEmpty ) or: [ownerLastName isEmpty ]))ifTrue: [ ^CreditCard new signalEmptyNames .].! !


!classDefinition: #MerchantProcessorProxy category: #TusLibros!
Object subclass: #MerchantProcessorProxy
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!MerchantProcessorProxy methodsFor: 'errorMessages' stamp: 'j 6/10/2019 00:46:41'!
cardIsExpiredErrorMessage

	^self error: MerchantProcessorProxy cardIsExpiredError.
		
	! !

!MerchantProcessorProxy methodsFor: 'errorMessages' stamp: 'j 6/9/2019 22:52:40'!
invalidAmountErrorMessage

	^'the amount that you are trying to pay is not allowed'
	
	

	! !

!MerchantProcessorProxy methodsFor: 'errorMessages' stamp: 'j 6/9/2019 22:57:15'!
invalidCreditCardOwnerNameErrorMessage
	
	^'the name of the credit card owner is too long'
	! !


!MerchantProcessorProxy methodsFor: 'verifications' stamp: 'j 6/10/2019 00:47:42'!
verifyCardExpirationDate: aCard

	(aCard isItExpired: GregorianMonthOfYear current) ifTrue: [self cardIsExpiredErrorMessage ]
		
	! !

!MerchantProcessorProxy methodsFor: 'verifications' stamp: 'j 6/9/2019 22:48:57'!
verifyCardNumber: cardNumber

	"checkea si el numero de tarjeta es valido"
	! !

!MerchantProcessorProxy methodsFor: 'verifications' stamp: 'j 6/10/2019 00:40:49'!
verifyCreditCardDetails: aCreditCard.
	

		self verifyCardExpirationDate: aCreditCard.
		self verifyOwnerName: aCreditCard .
		self verifyCardNumber: aCreditCard cardNumber.		
	! !

!MerchantProcessorProxy methodsFor: 'verifications' stamp: 'cf 6/15/2019 09:38:53'!
verifyIfItsAValidAmount: anAmount

	(anAmount > (999999999999999*peso)) ifTrue: [self error: self invalidAmountErrorMessage].
	
	

	! !

!MerchantProcessorProxy methodsFor: 'verifications' stamp: 'j 6/9/2019 22:57:29'!
verifyOwnerName: aCard

	|fullName|
	
	fullName := (aCard ownerName) append: aCard ownerLastName.
	
	(fullName size > 30) ifTrue: [self error: self invalidCreditCardOwnerNameErrorMessage ]
	! !


!MerchantProcessorProxy methodsFor: 'operations' stamp: 'cf 6/15/2019 09:36:51'!
checkCreditCard: aCreditCard andAmount: anAmount

	self verifyCreditCardDetails: aCreditCard.
	self verifyIfItsAValidAmount:  (anAmount ).

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MerchantProcessorProxy class' category: #TusLibros!
MerchantProcessorProxy class
	instanceVariableNames: ''!

!MerchantProcessorProxy class methodsFor: 'as yet unclassified' stamp: 'j 6/10/2019 00:47:06'!
cardIsExpiredError

	^'the credit card has expired already'! !


!classDefinition: #RestInterface category: #TusLibros!
Object subclass: #RestInterface
	instanceVariableNames: 'currentID cartsByID lastTimeUSedByID catalogue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!RestInterface methodsFor: 'initialization' stamp: 'cf 6/15/2019 11:09:02'!
usingThisCatalouge: aCatalogue
	catalogue := aCatalogue .
	currentID :=1.
	cartsByID := Dictionary new.
	lastTimeUSedByID := Dictionary new.! !


!RestInterface methodsFor: 'resources' stamp: 'cf 6/15/2019 11:54:52'!
addToCart:cartID isbnProduct:isbn productQuantity: quantity
	"la interfaz debe chequear que el cartID debe ser valido,si trato de agregar un producto invalido lo hago saltar a la interfaz"
	"En caso de éxito: 0|OK
	 En caso de error: 1|DESCRIPCION_DE_ERROR"
	|cartForID|
	self checkForValidID: cartID .
	cartForID := cartsByID at: cartID .
	(self checkIsbn:isbn ) ifTrue:[
		cartForID add:quantity of:isbn .
		lastTimeUSedByID at:cartID put: (Date now).
		^self succesMessageWith:'OK'. ] 
		 ifFalse: [
			|errorMessage|
			errorMessage := (cartForID add:quantity of:isbn ) messageText .
			self createErrorWithDescription: errorMessage ].
	! !

!RestInterface methodsFor: 'resources' stamp: 'cf 6/15/2019 10:17:02'!
checkOutCart: cartId ccn: creditCardNumber cced: creditCardExpirationDate cco: creditCardOwner! !

!RestInterface methodsFor: 'resources' stamp: 'cf 6/15/2019 11:14:02'!
createCart
	|newCart cartID|
	newCart := Cart acceptingItemsOf: catalogue .
	cartID := currentID .
	self nextValidID.
	cartID at: cartID put: newCart .
	lastTimeUSedByID at: cartID put: (Date now).
	^cartID.! !

!RestInterface methodsFor: 'resources' stamp: 'cf 6/15/2019 10:15:09'!
listCart:cartId ! !

!RestInterface methodsFor: 'resources' stamp: 'cf 6/15/2019 10:18:03'!
listPurchases: clientId  password: passwordClient! !



!RestInterface methodsFor: 'validations' stamp: 'cf 6/15/2019 11:35:14'!
checkForValidID: cartID 
	(cartsByID includesKey: cartID ) ifFalse: [^self createErrorWithDescription:'Invalid ID']! !


!RestInterface methodsFor: 'private' stamp: 'cf 6/15/2019 11:48:55'!
checkIsbn: isbn
	^ catalogue includesKey: isbn .! !

!RestInterface methodsFor: 'private' stamp: 'cf 6/15/2019 11:35:35'!
createErrorWithDescription: errorMessage
	^'1|',errorMessage ! !

!RestInterface methodsFor: 'private' stamp: 'cf 6/15/2019 11:13:36'!
nextValidID
	currentID := currentID +1.! !

!RestInterface methodsFor: 'private' stamp: 'cf 6/15/2019 11:49:35'!
succesMessageWith: thisMessage
	^'0|', thisMessage .! !
