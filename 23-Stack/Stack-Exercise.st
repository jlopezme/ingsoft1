!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:31'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/8/2012 08:20'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:33'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'First'.
	secondPushedObject := 'Second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:35'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:36'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:36'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: #'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'FinderWithEmptyStack FinderWithNotEmptyStacks emptyPrefix notEmptyPrefix prefixWithSpaces'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'Cf 4/20/2019 16:17:47'!
setUp
	
	
	|notEmptyStack emptyStack|
	emptyPrefix := ''.
	prefixWithSpaces := 'hola mundo hola'.
	notEmptyStack := OOStack new.
	notEmptyStack push: 'winter is coming'.
	notEmptyStack push: 'winning is everything'.
	notEmptyStack push: 'The winds of Winter' .
	notEmptyStack push: 'Winter is here'.
	FinderWithNotEmptyStacks := SentenceFinderByPrefix with: notEmptyStack .
	emptyStack := OOStack new.
	FinderWithEmptyStack := SentenceFinderByPrefix with: emptyStack.! !


!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'Cf 4/20/2019 16:13:02'!
test01aPrefixCantBeEmpty
	
	self thisBlock: [FinderWithNotEmptyStacks find: emptyPrefix] shouldRaise: SentenceFinderByPrefix 	aPrefixCantBeEmptyErrorDescription.
! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'Cf 4/20/2019 16:22:29'!
test02aPrefixCantContainSpaces
	
	self thisBlock: [FinderWithNotEmptyStacks find: prefixWithSpaces] shouldRaise: SentenceFinderByPrefix 	aPrefixCantContainSpacesErrorDescription
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'Cf 4/20/2019 16:46:30'!
test03anEmptyStackWithAnyValidPrefixShouldReturnEmptyString
	self assert: (FinderWithEmptyStack find: notEmptyPrefix ) equals: emptyPrefix .
	self assert: (FinderWithEmptyStack find: prefixWithSpaces ) equals: emptyPrefix .! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'Cf 4/21/2019 11:00:50'!
test04ifOneSentenceStartWithPrefixItWillBeReturn
	self assert: (FinderWithNotEmptyStacks find: 'Win') equals: 'Winter is here '.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'Cf 4/20/2019 16:10:42'!
thisBlock: aBlock shouldRaise: errorType 

	self 
		should: aBlock
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | self assert: anError messageText equals: errorType ]! !


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'top last stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'operacionesDelStack' stamp: 'Cf 4/18/2019 15:17:14'!
isEmpty
	^ self size = 0.! !

!OOStack methodsFor: 'operacionesDelStack' stamp: 'Cf 4/18/2019 15:48:09'!
pop
	top := top - 1.
	^stack removeLast value.
! !

!OOStack methodsFor: 'operacionesDelStack' stamp: 'Cf 4/18/2019 15:26:17'!
push: newTop
	stack addLast: newTop.
	top := top +1.! !

!OOStack methodsFor: 'operacionesDelStack' stamp: 'Cf 4/18/2019 15:50:45'!
signalPopCantBeUsedInEmptyStack
	self error: self class stackEmptyErrorDescription.! !

!OOStack methodsFor: 'operacionesDelStack' stamp: 'Cf 4/18/2019 15:25:55'!
size
	^ top - last.! !

!OOStack methodsFor: 'operacionesDelStack' stamp: 'Cf 4/18/2019 15:50:26'!
top
	^(stack at: top) value.! !


!OOStack methodsFor: 'initialization' stamp: 'Cf 4/18/2019 15:46:46'!
initialize
	top:=1.
	last:=1.
	stack := OrderedCollection new.
	stack addFirst: [self signalPopCantBeUsedInEmptyStack].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: #'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stackWithSentences auxiliarStack sizeOfStackWithSentences'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'Cf 4/18/2019 17:10:18'!
initialize: aStack
	stackWithSentences := aStack.
	auxiliarStack := OOStack new.
	sizeOfStackWithSentences := aStack size.! !


!SentenceFinderByPrefix methodsFor: 'operaciones' stamp: 'Cf 4/18/2019 19:40:39'!
fillstackWithSentenceswithAuxiliarStac
	sizeOfStackWithSentences timesRepeat: [ stackWithSentences push:(auxiliarStack pop)].! !

!SentenceFinderByPrefix methodsFor: 'operaciones' stamp: 'Cf 4/20/2019 16:44:00'!
find: aPrefix
	^(SentenceFinderByPrefix createSFBYUsing: aPrefix and: stackWithSentences) lookFor: aPrefix. ! !

!SentenceFinderByPrefix methodsFor: 'operaciones' stamp: 'Cf 4/20/2019 13:51:02'!
lookFor: aPrefix
	self subclassResponsibility.! !

!SentenceFinderByPrefix methodsFor: 'operaciones' stamp: 'Cf 4/21/2019 10:53:29'!
seeIf:aSentence starWith: thisPrefix
	|shortestWordsize subSentenceWithShortestWordSize |
	shortestWordsize := (aSentence size ) min: (thisPrefix size ).
	subSentenceWithShortestWordSize := aSentence copyFrom: 1 to: shortestWordsize .
	^ subSentenceWithShortestWordSize = thisPrefix.! !

!SentenceFinderByPrefix methodsFor: 'operaciones' stamp: 'Cf 4/21/2019 10:44:48'!
seeIfTopContainsaPrefix: aPrefix ifContainsPutIn: stackThatContainsaPrefix
	|sentenceToAnalize|
	sentenceToAnalize := stackWithSentences pop.
	( self seeIf: sentenceToAnalize  starWith: aPrefix ) ifTrue: [ stackThatContainsaPrefix push: sentenceToAnalize].
	auxiliarStack push: sentenceToAnalize.
	! !

!SentenceFinderByPrefix methodsFor: 'operaciones' stamp: 'Cf 4/18/2019 20:12:54'!
signalaPrefixCantBeEmpty
	self error: self class aPrefixCantBeEmptyErrorDescription.! !

!SentenceFinderByPrefix methodsFor: 'operaciones' stamp: 'Cf 4/18/2019 20:14:05'!
signalaPrefixCantContainSpaces
		self error: self class aPrefixCantContainSpacesErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: #'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'Errors' stamp: 'Cf 4/18/2019 20:10:02'!
aPrefixCantBeEmptyErrorDescription
	^'a Prefix cant be empty'! !

!SentenceFinderByPrefix class methodsFor: 'Errors' stamp: 'Cf 4/18/2019 20:14:05'!
aPrefixCantContainSpacesErrorDescription	
	^'a Prefix cant contain spaces'! !


!SentenceFinderByPrefix class methodsFor: 'instance creation' stamp: 'Cf 4/20/2019 16:43:32'!
createSFBYUsing: thisPrefix and: thisStack
	(thisPrefix= '') ifTrue: [^ EmptyPrefix new].
	(thisStack isEmpty ) ifTrue: [^WithaEmptyStack new].
	((thisPrefix indexOf: $ ) = 0) ifFalse: [^ PrefixWithSpace new].
	^ WithNotEmptyStack with: thisStack.
	! !

!SentenceFinderByPrefix class methodsFor: 'instance creation' stamp: 'Cf 4/20/2019 13:23:04'!
with: aStack
	^self new initialize: aStack ! !


!classDefinition: #EmptyPrefix category: #'Stack-Exercise'!
SentenceFinderByPrefix subclass: #EmptyPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyPrefix methodsFor: 'as yet unclassified' stamp: 'Cf 4/20/2019 13:29:01'!
lookFor: aPrefix
	self signalaPrefixCantBeEmpty! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyPrefix class' category: #'Stack-Exercise'!
EmptyPrefix class
	instanceVariableNames: 'uniqueInstance'!

!EmptyPrefix class methodsFor: 'as yet unclassified' stamp: 'Cf 4/20/2019 15:52:35'!
with: aStack
	^self new initialize: aStack.! !


!classDefinition: #NotEmptyPrefix category: #'Stack-Exercise'!
SentenceFinderByPrefix subclass: #NotEmptyPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #WithNotEmptyStack category: #'Stack-Exercise'!
NotEmptyPrefix subclass: #WithNotEmptyStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!WithNotEmptyStack methodsFor: 'as yet unclassified' stamp: 'Cf 4/21/2019 11:01:54'!
lookFor: aPrefix
	|stackThatContainsaPrefix numberOfSentencesThatContainsaPrefix |
	stackThatContainsaPrefix := OOStack new.
	sizeOfStackWithSentences timesRepeat: [self seeIfTopContainsaPrefix: aPrefix ifContainsPutIn: stackThatContainsaPrefix ].
	self fillstackWithSentenceswithAuxiliarStac.
	numberOfSentencesThatContainsaPrefix := stackThatContainsaPrefix size.
	^ '' , (numberOfSentencesThatContainsaPrefix timesRepeat: [^stackThatContainsaPrefix pop
		, ' ']).
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WithNotEmptyStack class' category: #'Stack-Exercise'!
WithNotEmptyStack class
	instanceVariableNames: ''!

!WithNotEmptyStack class methodsFor: 'as yet unclassified' stamp: 'Cf 4/20/2019 15:55:52'!
with: aStack
	^self new initialize: aStack.! !


!classDefinition: #WithaEmptyStack category: #'Stack-Exercise'!
NotEmptyPrefix subclass: #WithaEmptyStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!WithaEmptyStack methodsFor: 'as yet unclassified' stamp: 'Cf 4/20/2019 13:33:07'!
lookFor: aPrefix
	^''.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WithaEmptyStack class' category: #'Stack-Exercise'!
WithaEmptyStack class
	instanceVariableNames: ''!

!WithaEmptyStack class methodsFor: 'as yet unclassified' stamp: 'Cf 4/20/2019 15:55:59'!
with: aStack
	^self new initialize: aStack.! !


!classDefinition: #PrefixWithSpace category: #'Stack-Exercise'!
SentenceFinderByPrefix subclass: #PrefixWithSpace
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!PrefixWithSpace methodsFor: 'as yet unclassified' stamp: 'Cf 4/20/2019 16:20:35'!
lookFor: aPrefix
	Halt.
	^ self signalaPrefixCantContainSpaces.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PrefixWithSpace class' category: #'Stack-Exercise'!
PrefixWithSpace class
	instanceVariableNames: ''!

!PrefixWithSpace class methodsFor: 'as yet unclassified' stamp: 'Cf 4/20/2019 15:56:06'!
with: aStack
	^self new initialize: aStack.! !
