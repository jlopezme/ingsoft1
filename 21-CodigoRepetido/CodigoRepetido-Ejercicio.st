!classDefinition: #CantSuspend category: #'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: #'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'Cf 4/5/2019 22:36:29'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	"
	| customerBook millisecondsBeforeRunning millisecondsAfterRunning |
	
	customerBook := CustomerBook new.
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	customerBook addCustomerNamed: 'John Lennon'.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (50 * millisecond)
	vamos a parametrizar los test de tiempo como un metodo que toma un clousure(el metodo a probar con sus parametro) y el tiempo limite con su unidad de tiempo
	"
	| customerBook theMethod|.
	customerBook := CustomerBook new.
	theMethod := [customerBook addCustomerNamed: 'John Lennon'].
	self assert: (customerBook timeTestOfMethodWithTimeLimitAndUnitOfLimit: theMethod and: 50   and: millisecond).
	
	
	
	
	
	! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Cf 4/6/2019 20:39:20'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	"| customerBook millisecondsBeforeRunning millisecondsAfterRunning paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	  
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	customerBook removeCustomerNamed: paulMcCartney.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (100 * millisecond)
	"
	|customerBook paulMcCartney theMethodToTets|
	customerBook := CustomerBook  new.
	paulMcCartney := 'Paul McCartney'.
	theMethodToTets := [customerBook removeCustomerNamed:   paulMcCartney].
	customerBook addCustomerNamed: paulMcCartney .
	
	self assert: (customerBook timeTestOfMethodWithTimeLimitAndUnitOfLimit: theMethodToTets  and: 100  and: millisecond ).
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Cf 4/6/2019 20:35:24'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook errorMessage methodToTest colaborations |
	customerBook := CustomerBook new.
	methodToTest := [customerBook addCustomerNamed: ''].
	[customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | errorMessage :=anError messageText ].
	
	colaborations :=[ customerBook isEmpty
					 and: (errorMessage = CustomerBook customerCanNotBeEmptyErrorMessage )].
	self assert: (customerBook testMethodExpectErrorDo: (methodToTest )and: Error and: colaborations ).  
	"
	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]
		cuando se espera un error lo puedo hacer una funcion que toma el metodo, el tipo de mensaje/error,y lo que hacer
		"
		! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Cf 4/6/2019 18:13:02'!
test04CanNotRemoveAnInvalidCustomer
	"
	[ customerBook removeCustomerNamed: 'Paul McCartney'.
	self fail ]
		on: NotFound 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
		devuelta,esto se puede reemplazar por la funcion testMethodExpectErrorDo:
	"
	| customerBook method johnLennon asserts |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	method :=[customerBook removeCustomerNamed: 'Paul McCartney'.].
	asserts := [ (customerBook numberOfCustomers =1) and: (customerBook includesCustomerNamed: johnLennon )].
	self assert: (customerBook testMethodExpectErrorDo: (method) and: NotFound  and: (asserts)). 
	! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Cf 4/6/2019 15:31:53'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney colaborations listToCheck|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	"
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 1 equals: customerBook numberOfSuspendedCustomers.
	self assert: 1 equals: customerBook numberOfCustomers.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	"
	colaborations := [customerBook addAndSuspendACustomer: paulMcCartney].
	listToCheck := [(0 = (customerBook numberOfActiveCustomers)) and:(1 = (customerBook numberOfSuspendedCustomers)) and: (1 = (customerBook numberOfCustomers)) and: (customerBook includesCustomerNamed: paulMcCartney)].
	self assert: (customerBook testClousureAndCheckChecklist: colaborations and: listToCheck ).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Cf 4/6/2019 15:39:59'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney colaborations listToCheck|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	"
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 0 equals: customerBook numberOfSuspendedCustomers.
	self assert: 0 equals: customerBook numberOfCustomers.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).
"
	colaborations := [customerBook addAndSuspendACustomer: paulMcCartney .
						customerBook removeCustomerNamed: paulMcCartney .].
					
	listToCheck := [(0= (customerBook numberOfActiveCustomers)) and:(0= (customerBook numberOfSuspendedCustomers )) and: (0=(customerBook numberOfCustomers )) and: ((customerBook includesCustomerNamed: paulMcCartney)not)].
	
	self assert: (customerBook testClousureAndCheckChecklist: colaborations and: (listToCheck)). 				


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Cf 4/6/2019 18:34:24'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon methodToTest listToCheck |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	methodToTest :=[customerBook suspendCustomerNamed: 'Paul McCartney'].
	listToCheck := [(customerBook numberOfCustomers = 1) and: (customerBook includesCustomerNamed: johnLennon )].
	[customerBook suspendCustomerNamed: 'Paul McCartney'.
		self fail]
		on: CantSuspend
			do: [self assert: (customerBook testMethodExpectErrorDo:methodToTest  and: CantSuspend  and: listToCheck )].
		
	"
	[ customerBook suspendCustomerNamed: 'Paul McCartney'.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]"
	
	! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Cf 4/6/2019 20:53:08'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon methodToTest listToCheck  |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook  addAndSuspendACustomer: johnLennon .
	methodToTest := [customerBook suspendCustomerNamed: johnLennon ].
	listToCheck := [(customerBook numberOfCustomers = 1) and: (customerBook includesCustomerNamed: johnLennon)].
	self assert: (customerBook testMethodExpectErrorDo: methodToTest  and: CantSuspend and: listToCheck ).
	"
	[ customerBook suspendCustomerNamed: johnLennon.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]"
		
! !


!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'Cf 4/6/2019 15:24:02'!
addAndSuspendACustomer: aName
	self addCustomerNamed: aName .
	self suspendCustomerNamed: aName .! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'Cf 4/5/2019 21:56:19'!
isEmpty
	
	"^active isEmpty and: [ suspended isEmpty ]"
	^(self numberOfCustomers =0)! !

!CustomerBook methodsFor: 'testing' stamp: 'Cf 4/6/2019 15:31:12'!
testClousureAndCheckChecklist: aClosure and: aChecklist
	aClosure value.
	^(aChecklist value).! !

!CustomerBook methodsFor: 'testing' stamp: 'Cf 4/6/2019 20:44:20'!
testMethodExpectErrorDo: aMethod and: typeOfMessage and: aClosure
	"
	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]
		cuando se espera un error lo puedo hacer una metodo que toma el metodo, el tipo de mensaje/error,y lo que hacer
		"
		[aMethod value. self fail]
			on:typeOfMessage 
			do: [:anError| 
				^aClosure value.].! !

!CustomerBook methodsFor: 'testing' stamp: 'Cf 4/5/2019 22:05:41'!
timeTestOfMethodWithTimeLimitAndUnitOfLimit: aClousure and: aTimeLimit and: aUnitMeasure
	|timeBefore timeAfter totalTime|
	timeBefore:= Time millisecondClockValue  * aUnitMeasure .
	aClousure value.
	timeAfter := Time millisecondClockValue * aUnitMeasure.
	totalTime  := timeAfter  - timeBefore .
	^totalTime  < (aTimeLimit * aUnitMeasure ).
	! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'Cf 4/5/2019 21:55:48'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	"aca se puede parametrizar los includes en active y suspended en un solo metodo para evitar usar el or y   quedar mas          declarativo "
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'Cf 4/5/2019 19:09:56'!
numberOfCustomers
	"Se cambio size por los metodos implementados"
	^ self numberOfActiveCustomers  + self numberOfSuspendedCustomers ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'Cf 4/5/2019 21:14:30'!
removeCustomerFrom:aName and: set
	1 to: set size do: 
	[ :index |
		aName = (set at: index)
			ifTrue: [
				set removeAt: index.
				^ aName 
			] 
	].! !

!CustomerBook methodsFor: 'customer management' stamp: 'Cf 4/5/2019 21:15:22'!
removeCustomerFromActiveAndSuspended: aName 
	
	self removeCustomerFrom: aName and: active.
	self removeCustomerFrom: aName and: suspended .
	! !

!CustomerBook methodsFor: 'customer management' stamp: 'Cf 4/5/2019 21:10:54'!
removeCustomerNamed: aName 
 	"En lugar de poner los dos ciclos que recorren ambos conjuntos,usamos las herramientas de active y suspended. Para esto,creamos un metodo que solo toma aName y remueve el cliente de self(el customerbook en cuestion)"
	"1 to: active size do: 
	[ :index |
		aName = (active at: index)
			ifTrue: [
				active removeAt: index.
				^ aName 
			] 
	].

	1 to: suspended size do: 	
	[ :index |
		aName = (suspended at: index)
			ifTrue: [
				suspended removeAt: index.
				^ aName 
			] 
	].
	"
	|numberofCustomersBefore|.
	numberofCustomersBefore  _ self numberOfCustomers .
	 self removeCustomerFromActiveAndSuspended: aName.
	(numberofCustomersBefore  = self numberOfCustomers ) ifFalse: [^aName].
	^ NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/3/2019 10:16:22'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/3/2019 10:16:31'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
