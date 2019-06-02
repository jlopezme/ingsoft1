!classDefinition: #PortfolioTest category: #'PortfolioPrinter-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioPrinter-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'j 5/26/2019 20:37:55'!
test01InitializeEmptyPortfolio

	|portfolio|
	
	portfolio := Portfolio new.
	
	self assert: portfolio balance equals: 0. ! !

!PortfolioTest methodsFor: 'tests' stamp: 'j 5/26/2019 20:37:55'!
test02PortfolioKnowsAddedAccounts

	|portfolio account deposit withdraw |
	
	portfolio := Portfolio new.
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 30 on: account.
	portfolio addAccount: account.
	 
		
	self assert: portfolio portfolio size equals: 1.
	self assert: (portfolio portfolio includes: account).! !

!PortfolioTest methodsFor: 'tests' stamp: 'j 5/26/2019 20:37:55'!
test03PortfolioKnowsAllTransactions

	|portfolio account deposit withdraw |
	
	portfolio := Portfolio new.
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 30 on: account.
	portfolio addAccount: account .
		
	self assert: (portfolio transactions includes: deposit).
	self assert: (portfolio transactions includes: withdraw).! !

!PortfolioTest methodsFor: 'tests' stamp: 'j 5/26/2019 20:37:55'!
test04PortfolioKnowsIfOneOfItsAccountsMadeTransactions

	|portfolio account account2 deposit |
	
	portfolio := Portfolio new.
	
	account := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	portfolio addAccount: account .
	
		
	self assert: (portfolio hasRegistered: account).
	self deny: (portfolio hasRegistered: account2).
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'j 5/26/2019 20:37:55'!
test05APortfolioKnowsItsParentPortfolios

	|portfolioRoot portfolio2a portfolio2b portfolio3 |
	
	portfolioRoot := Portfolio new.
	portfolio2a := Portfolio new.
	portfolio2b := Portfolio new.
	portfolio3 := Portfolio new.
	
	portfolioRoot addPortfolio: portfolio2a.
	portfolioRoot addPortfolio: portfolio2b. 
	portfolio2a  addPortfolio: portfolio3.
	portfolio2b  addPortfolio: portfolio3.
	
		
	self assert: (portfolio2a parentPortfolios includes: portfolioRoot).
	self assert: (portfolio2b parentPortfolios includes: portfolioRoot).
	
	self assert: (portfolio3 parentPortfolios includes: portfolio2a ).
	self assert: (portfolio3 parentPortfolios includes: portfolio2b ).
	 
	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'j 5/26/2019 21:50:22'!
test06CantAddAPortfolioToAnotherOneIfTheyShareAccounts

	|portfolioRoot portfolio2 account |
	
	portfolioRoot := Portfolio new.
	portfolio2 := Portfolio new.
	account := ReceptiveAccount new.
	
	portfolioRoot addAccount: account .
	portfolio2 addAccount: account .
	
	self
		should: [portfolioRoot addPortfolio: portfolio2]
		raise: Error
		withExceptionDo: [:anError | 
			self assert: anError messageText equals: Portfolio accountsAreSharedExceptionMessage].! !

!PortfolioTest methodsFor: 'tests' stamp: 'j 5/26/2019 21:43:46'!
test07CantAddAPortfolioToHierarchyOfPortfoliosInWhichAccountsWouldBeRepeated

	|portfolioRoot portfolio2 portfolio3 portfolio4 account |
	
	portfolioRoot := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	portfolio4 := Portfolio new.
	
	account := ReceptiveAccount new.
	
	portfolioRoot addPortfolio: portfolio2.
	portfolioRoot addPortfolio: portfolio3.
	
	portfolio2 addAccount: account.
	portfolio4 addAccount: account.
	
	
	self
		should: [portfolio3 addPortfolio: portfolio4]
		raise: Error
		withExceptionDo: [:anError | 
			self assert: anError messageText equals: Portfolio accountsAreSharedExceptionMessage].
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'j 5/26/2019 22:11:25'!
test08CantAddAnAccountToHierarchyOfPortfoliosInWhichAccountWouldBeRepeated

	|portfolioRoot portfolio2 portfolio3 portfolio4 account |
	
	portfolioRoot := Portfolio new.
	portfolio2 := Portfolio new.
	portfolio3 := Portfolio new.
	portfolio4 := Portfolio new.
	
	account := ReceptiveAccount new.
	
	portfolioRoot addPortfolio: portfolio2.
	portfolioRoot addPortfolio: portfolio3.
	portfolio3 addPortfolio: portfolio4.
	
	
	portfolio2 addAccount: account.
	
	
	self
		should: [portfolio4 addAccount: account.]
		raise: Error
		withExceptionDo: [:anError | 
			self assert: anError messageText equals: Portfolio accountsAreSharedExceptionMessage].
	! !


!classDefinition: #ReceptiveAccountTest category: #'PortfolioPrinter-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioPrinter-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:48'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:54'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:02'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:46'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:54'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:21:24'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 100 on: account1.
		
	self assert: 1 equals: account1 transactions size .
	self assert: (account1 transactions includes: deposit1).
! !


!ReceptiveAccountTest methodsFor: 'test Transactions Between Two Accounts' stamp: 'cf 6/1/2019 13:47:26'!
test08AnAccountCanDepositeToAnotherAccount
	| emisorAccount reciverAccount deposit transferDeposit |
	
	emisorAccount := ReceptiveAccount new.
	reciverAccount := ReceptiveAccount new.
	deposit := Deposit register: 100 on: emisorAccount.
	transferDeposit := TransferDeposit from: emisorAccount to: reciverAccount  for: 50.
	self assert: (emisorAccount balance)  equals: 50.
	self assert: (reciverAccount balance)  equals: 50.
	self assert: (emisorAccount hasRegistered: deposit).
	self deny: (reciverAccount hasRegistered:deposit ).
	self assert: (reciverAccount hasRegistered: transferDeposit).! !

!ReceptiveAccountTest methodsFor: 'test Transactions Between Two Accounts' stamp: 'cf 6/1/2019 13:52:42'!
test09AnAccountCanWithdrawToAnotherAccount
	| emisorAccount reciverAccount deposit transferWithdraw |
	
	emisorAccount := ReceptiveAccount new.
	reciverAccount := ReceptiveAccount new.
	deposit := Deposit register: 100 on: emisorAccount.
	transferWithdraw := TransferWithdraw from: reciverAccount to: emisorAccount  for: 50.
	self assert: (emisorAccount balance)  equals: 50.
	self assert: (reciverAccount balance)  equals: 50.
	self assert: (emisorAccount hasRegistered: deposit).
	self assert: (emisorAccount hasRegistered: transferWithdraw).! !

!ReceptiveAccountTest methodsFor: 'test Transactions Between Two Accounts' stamp: 'cf 6/1/2019 14:18:58'!
test10AnAccountCantMakeTransferWithInsufficentFounds
	| emisorAccount reciverAccount  |
	
	emisorAccount := ReceptiveAccount new.
	reciverAccount := ReceptiveAccount new.
	self should: [TransferWithdraw from: reciverAccount to: emisorAccount  for: 50. ] raise:  Error 
			withExceptionDo:[:anError | anError messageText = Transfers errorFondosInsuficientes . 
				self assert: (emisorAccount balance)  equals: 0.
				self assert: (reciverAccount balance)  equals: 0.
		]! !

!ReceptiveAccountTest methodsFor: 'test Transactions Between Two Accounts' stamp: 'cf 6/2/2019 16:22:20'!
test11AnAccountAnswerHisTransactionsInAnAccountSummaryCorrectly
	| emisorAccount reciverAccount deposit transferWithdraw reportOfEmisorAccount reportOfReciverAccount  |
	
	emisorAccount := ReceptiveAccount new.
	reciverAccount := ReceptiveAccount new.
	deposit := Deposit register: 100 on: emisorAccount.
	transferWithdraw := TransferWithdraw from: reciverAccount to: emisorAccount  for: 50.
	reportOfEmisorAccount := ( emisorAccount accountSummary) reset .
	reportOfReciverAccount := (reciverAccount accountSummary ) reset.
	self assert: (emisorAccount balance)  equals: 50.
	self assert: (reciverAccount balance)  equals: 50.
	self assert: (emisorAccount hasRegistered: deposit).
	self assert: (emisorAccount hasRegistered: transferWithdraw).
	self assert: 'Depósito por 100.' equals: (reportOfEmisorAccount nextLine ).
	self assert: 'Salida por transferencia de 50.' equals: (reportOfEmisorAccount nextLine ).
	self assert: 'Balance = 50.' equals: (reportOfEmisorAccount nextLine ).
	self assert: reportOfEmisorAccount atEnd .
	self assert: 'Entrada por transferencia de 50.' equals: (reportOfReciverAccount nextLine ).
	self assert: 'Balance = 50.' equals: (reportOfReciverAccount nextLine ).
	self assert: reportOfReciverAccount atEnd .
	
	! !

!ReceptiveAccountTest methodsFor: 'test Transactions Between Two Accounts' stamp: 'cf 6/2/2019 16:39:41'!
test12AnAccountAnswerHisTransferNetCorrectly
	| emisorAccount reciverAccount deposit transferWithdraw  |
	
	emisorAccount := ReceptiveAccount new.
	reciverAccount := ReceptiveAccount new.
	deposit := Deposit register: 100 on: emisorAccount.
	transferWithdraw := TransferWithdraw from: reciverAccount to: emisorAccount  for: 50.
	self assert: (emisorAccount balance)  equals: 50.
	self assert: (reciverAccount balance)  equals: 50.
	self assert: (emisorAccount hasRegistered: deposit).
	self assert: (emisorAccount hasRegistered: transferWithdraw).
	self assert: (emisorAccount transferNet ) equals: (-50).
	self assert: (reciverAccount transferNet ) equals: (50).	
	
	! !


!classDefinition: #AccountTransaction category: #'PortfolioPrinter-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioPrinter-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'PortfolioPrinter-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'cf 6/1/2019 11:47:09'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
	self registerOnReport: account for: aValue.	
	^ transaction! !


!AccountTransaction class methodsFor: 'Report' stamp: 'cf 6/1/2019 11:12:51'!
registerOnReport: aReceptiveAccount for: amount 
	self subclassResponsibility ! !


!classDefinition: #Deposit category: #'PortfolioPrinter-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioPrinter-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'j 5/25/2019 16:28:57'!
transactionalValue

	^ value! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'PortfolioPrinter-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'Report' stamp: 'cf 6/1/2019 11:18:34'!
registerOnReport: aReceptiveAccount for: amount 
	aReceptiveAccount reportDepositFor: amount .! !


!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Transfers category: #'PortfolioPrinter-Ejercicio'!
AccountTransaction subclass: #Transfers
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioPrinter-Ejercicio'!

!Transfers methodsFor: 'value' stamp: 'cf 6/1/2019 10:24:44'!
value
	^self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfers class' category: #'PortfolioPrinter-Ejercicio'!
Transfers class
	instanceVariableNames: ''!

!Transfers class methodsFor: 'instance creation' stamp: 'cf 6/2/2019 16:33:11'!
from: firstAcount to: secondAcount  for: transferAmount
	| transaction secondTransaction|
	(self checkIfAccountsHaveFounds:firstAcount and: secondAcount with: transferAmount )ifTrue:[ ^self signalTransactionError.].
	transaction := self anotherselffor: transferAmount .
	secondTransaction := self for: transferAmount .
	firstAcount register: transaction.
	secondAcount register: secondTransaction .
	self selfRegisterOnReport: firstAcount for: transferAmount .
	self anotherSeflRegisterOnReport: secondAcount for: transferAmount .
	firstAcount registerTransfer: transaction.
	secondAcount registerTransfer: secondTransaction .
	^secondTransaction ! !


!Transfers class methodsFor: 'error handling' stamp: 'cf 6/1/2019 14:02:01'!
checkIfAccountsHaveFounds: aReceptiveAccount and: aReceptiveAccount2 with: aSmallInteger 
	self subclassResponsibility ! !

!Transfers class methodsFor: 'error handling' stamp: 'cf 6/1/2019 14:07:54'!
errorFondosInsuficientes
	^'La Cuenta No tiene Fondos como para efectuar la transacción.'! !

!Transfers class methodsFor: 'error handling' stamp: 'cf 6/1/2019 14:16:39'!
signalTransactionError
	^self error self errorFondosInsuficientes.! !


!classDefinition: #TransferDeposit category: #'PortfolioPrinter-Ejercicio'!
Transfers subclass: #TransferDeposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioPrinter-Ejercicio'!

!TransferDeposit methodsFor: 'value' stamp: 'cf 6/1/2019 13:16:20'!
transactionalValue

	^ value  ! !

!TransferDeposit methodsFor: 'value' stamp: 'cf 6/1/2019 12:18:09'!
value
	^ value! !


!TransferDeposit methodsFor: 'initialization' stamp: 'cf 6/1/2019 11:49:55'!
initializeFor: aValue

	value := aValue ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferDeposit class' category: #'PortfolioPrinter-Ejercicio'!
TransferDeposit class
	instanceVariableNames: ''!

!TransferDeposit class methodsFor: 'error handling' stamp: 'cf 6/1/2019 14:04:23'!
checkIfAccountsHaveFounds: emisorAccount and: reciverAccount with: amount 
	^ (emisorAccount balance ) < amount .! !


!TransferDeposit class methodsFor: 'instance creation' stamp: 'cf 6/1/2019 10:27:22'!
for: aValue
	^ self new initializeFor: aValue ! !


!TransferDeposit class methodsFor: 'Report' stamp: 'cf 6/1/2019 12:38:43'!
registerOnReport: aReceptiveAccount for: amount 
	aReceptiveAccount registerATransferWithdrawFor: amount .! !


!TransferDeposit class methodsFor: 'as yet unclassified' stamp: 'cf 6/1/2019 12:50:05'!
anotherselffor: transferAmount
	^ TransferWithdraw for:transferAmount .! !


!TransferDeposit class methodsFor: 'reports' stamp: 'cf 6/1/2019 13:03:16'!
anotherSeflRegisterOnReport: reciverAccount for: depositTransferAmount
	reciverAccount registerATransferDepositFor: depositTransferAmount .! !

!TransferDeposit class methodsFor: 'reports' stamp: 'cf 6/1/2019 13:01:30'!
selfRegisterOnReport: aReceptiveAccount for: withdrawTransferAmount 
	aReceptiveAccount registerATransferWithdrawFor: withdrawTransferAmount .! !


!classDefinition: #TransferWithdraw category: #'PortfolioPrinter-Ejercicio'!
Transfers subclass: #TransferWithdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioPrinter-Ejercicio'!

!TransferWithdraw methodsFor: 'value' stamp: 'cf 6/1/2019 13:16:27'!
transactionalValue

	^ value negated .! !

!TransferWithdraw methodsFor: 'value' stamp: 'cf 6/1/2019 12:18:15'!
value
	^ value! !


!TransferWithdraw methodsFor: 'initialization' stamp: 'cf 6/1/2019 11:50:00'!
initializeFor: aValue

	value := aValue ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferWithdraw class' category: #'PortfolioPrinter-Ejercicio'!
TransferWithdraw class
	instanceVariableNames: ''!

!TransferWithdraw class methodsFor: 'instance creation' stamp: 'cf 6/1/2019 10:27:28'!
for: aValue
	^ self new initializeFor: aValue ! !


!TransferWithdraw class methodsFor: 'Report' stamp: 'cf 6/1/2019 13:39:43'!
anotherSeflRegisterOnReport: aReceptiveAccount for: depositTransferAmount
	aReceptiveAccount registerATransferWithdrawFor: depositTransferAmount .! !

!TransferWithdraw class methodsFor: 'Report' stamp: 'cf 6/1/2019 12:20:06'!
registerOnReport: aReceptiveAccount for: amount ! !

!TransferWithdraw class methodsFor: 'Report' stamp: 'cf 6/1/2019 13:36:36'!
selfRegisterOnReport: aReceptiveAccount for: transferDepositAmount 
	aReceptiveAccount registerATransferDepositFor: transferDepositAmount .! !


!TransferWithdraw class methodsFor: 'as yet unclassified' stamp: 'cf 6/1/2019 13:33:14'!
anotherselffor: aTransferWithdrawAmount 
	^ TransferDeposit for:aTransferWithdrawAmount .! !


!TransferWithdraw class methodsFor: 'error handling' stamp: 'cf 6/1/2019 14:05:21'!
checkIfAccountsHaveFounds: reciverAccount and: emisorAccount with: amount 
	^(emisorAccount balance ) < amount .! !


!classDefinition: #Withdraw category: #'PortfolioPrinter-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioPrinter-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'j 5/25/2019 16:26:48'!
initializeFor: aValue

	value := aValue.! !


!Withdraw methodsFor: 'value' stamp: 'j 5/25/2019 16:28:38'!
transactionalValue

	^ value negated.! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'PortfolioPrinter-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'Report' stamp: 'cf 6/1/2019 11:21:15'!
registerOnReport: aReceptiveAccount for: amount 
	aReceptiveAccount registerAWithdrawFor: amount.! !


!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: #'PortfolioPrinter-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'parentPortfolios portfolio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioPrinter-Ejercicio'!

!Portfolio methodsFor: 'operations' stamp: 'j 5/26/2019 21:58:38'!
addAccount: aReceptiveAccount 

	(self isItValidToAddAccount: aReceptiveAccount ) 
		ifTrue: [portfolio add: aReceptiveAccount ] 
		
		ifFalse: [^self error: self class accountsAreSharedExceptionMessage ]! !

!Portfolio methodsFor: 'operations' stamp: 'j 5/26/2019 19:38:09'!
addParentPortfolio: aParent

	parentPortfolios add: aParent.! !

!Portfolio methodsFor: 'operations' stamp: 'j 5/26/2019 21:34:22'!
addPortfolio: aPortfolio 

	(self isItValidToAdd: aPortfolio) 
		ifTrue: [portfolio add: aPortfolio.
				aPortfolio addParentPortfolio: self] 
		
		ifFalse: [^self error: self class accountsAreSharedExceptionMessage ]
		
		! !

!Portfolio methodsFor: 'operations' stamp: 'j 5/25/2019 15:55:38'!
balance
	
	^portfolio sum: [:anElement | anElement balance ] ifEmpty: [0].! !

!Portfolio methodsFor: 'operations' stamp: 'j 5/26/2019 18:55:52'!
hasRegistered: anAccount

	(anAccount transactions size = 0) ifTrue: [^false] ifFalse: [^true]. 

	 
	! !

!Portfolio methodsFor: 'operations' stamp: 'j 5/26/2019 19:26:01'!
parentPortfolios

	^parentPortfolios! !

!Portfolio methodsFor: 'operations' stamp: 'j 5/25/2019 16:43:45'!
portfolio
	
	^portfolio copy! !

!Portfolio methodsFor: 'operations' stamp: 'j 5/26/2019 18:34:49'!
transactions
	
	|allTransactions|
	
	allTransactions := OrderedCollection new.
	
	portfolio do: [:anAccount | allTransactions addAllFirst: (anAccount transactions) ].
	
	^allTransactions copy.! !


!Portfolio methodsFor: 'privateOperations' stamp: 'j 5/26/2019 20:31:53'!
allAccounts
	
	|allAccounts|
	
	allAccounts  := OrderedCollection new.
	
	portfolio do: [:element | 
			(element isKindOf: ReceptiveAccount) 
				ifTrue: [allAccounts add: element ]  
				ifFalse: [allAccounts addAllLast: (element allAccounts)]
		].
	
	^allAccounts .
		
		! !

!Portfolio methodsFor: 'privateOperations' stamp: 'j 5/26/2019 22:08:50'!
containsAccount: anAccount

	(self allAccounts includes: anAccount) ifTrue: [^true].
	^false.! !

!Portfolio methodsFor: 'privateOperations' stamp: 'j 5/26/2019 21:31:28'!
findAllRootPortfolios

	|rootPortfolio|
	
	rootPortfolio := OrderedCollection new.
	
	self parentPortfolios do: [:aParent | 
		(aParent isRoot) 
			ifTrue: [rootPortfolio add: aParent]
			ifFalse: [rootPortfolio addAllFirst:  aParent findAllRootPortfolios ]
		].
	
	^rootPortfolio 
	
	! !

!Portfolio methodsFor: 'privateOperations' stamp: 'j 5/26/2019 21:50:08'!
isItValidToAdd: aPortfolio
		
		|rootPortfolios|
		
		(self sharesAccountsWith: aPortfolio) ifTrue: [^false].
		
		rootPortfolios := self findAllRootPortfolios.
		
		rootPortfolios do: [:aRoot | 
			(aRoot sharesAccountsWith: aPortfolio)
					ifTrue: [^false] 
			].
		
		
		
		^true.
! !

!Portfolio methodsFor: 'privateOperations' stamp: 'j 5/26/2019 22:10:03'!
isItValidToAddAccount: anAccount
		
		|rootPortfolios|
		
		(self containsAccount: anAccount ) ifTrue: [^false].
		
		rootPortfolios := self findAllRootPortfolios.
		
		rootPortfolios do: [:aRoot | 
			((aRoot allAccounts) includes: anAccount)
					ifTrue: [^false] 
			].
		
		^true.
! !

!Portfolio methodsFor: 'privateOperations' stamp: 'j 5/26/2019 21:23:54'!
isRoot

	(parentPortfolios size = 0) ifTrue: [^true].
	^false
	
	! !

!Portfolio methodsFor: 'privateOperations' stamp: 'j 5/26/2019 21:14:41'!
sharesAccountsWith: aPortfolio
		
		aPortfolio allAccounts do: [:account | (self allAccounts includes: account) ifTrue: [^true]].
		
		^false.! !


!Portfolio methodsFor: 'initialization' stamp: 'j 5/25/2019 15:37:04'!
initialize

	parentPortfolios := OrderedCollection new.
	portfolio := OrderedCollection new.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'PortfolioPrinter-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'j 5/26/2019 19:54:59'!
accountsAreSharedExceptionMessage

	^'You cant add this Portfolio because it has accounts that already belong to this one.'! !


!classDefinition: #ReceptiveAccount category: #'PortfolioPrinter-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions accountSummary transferNetBalance'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioPrinter-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'cf 6/2/2019 16:37:28'!
initialize

	super initialize.
	transactions := OrderedCollection new.
	accountSummary := ReadWriteStream on: String new.
	transferNetBalance := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'cf 6/2/2019 16:35:03'!
registerTransfer: aTransferWithdraw 
	transferNetBalance add: aTransferWithdraw ! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'j 5/25/2019 16:29:06'!
balance

	^transactions sum: [ :aTransaction | aTransaction transactionalValue ] ifEmpty: [ 0 ]! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 10/11/2018 16:53:54'!
hasRegistered: aTtransaction

	^ transactions includes: aTtransaction 
! !


!ReceptiveAccount methodsFor: 'Report' stamp: 'cf 6/2/2019 15:50:40'!
accountSummary
	|report|
	
	report := accountSummary .
	
	report nextPutAll: 'Balance = ', (self balance asString ), '.'.
	
	^report .! !

!ReceptiveAccount methodsFor: 'Report' stamp: 'cf 6/2/2019 15:45:12'!
registerATransferDepositFor: aDepositAmount
	accountSummary nextPutAll: 'Entrada por transferencia de ', (aDepositAmount asString ), '.'.
	accountSummary newLine .! !

!ReceptiveAccount methodsFor: 'Report' stamp: 'cf 6/2/2019 15:45:12'!
registerATransferWithdrawFor: transferWithdrawAmount 
	accountSummary nextPutAll: 'Salida por transferencia de ', (transferWithdrawAmount asString ), '.'.
	accountSummary newLine.! !

!ReceptiveAccount methodsFor: 'Report' stamp: 'cf 6/2/2019 15:45:12'!
registerAWithdrawFor: withdrawAmount 
	accountSummary nextPutAll: 'Extracción por ', (withdrawAmount asString ), '.'.
	accountSummary newLine .! !

!ReceptiveAccount methodsFor: 'Report' stamp: 'cf 6/2/2019 15:45:12'!
reportDepositFor: depositAmount 
	accountSummary nextPutAll: 'Depósito por ', (depositAmount asString ) , '.'.
	accountSummary newLine .! !

!ReceptiveAccount methodsFor: 'Report' stamp: 'cf 6/2/2019 16:28:40'!
transferNet
		^transferNetBalance sum: [ :aTransaction | aTransaction transactionalValue ] ifEmpty: [ 0 ]! !
