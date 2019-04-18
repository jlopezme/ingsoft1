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
	instanceVariableNames: 'FinderWithEmptyStack FinderWithNotEmptyStacks'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'Cf 4/18/2019 20:29:12'!
setUp
	
	|notEmptyStack emptyStack|
	notEmptyStack := OOStack new.
	notEmptyStack push: 'winter is coming'.
	notEmptyStack push: 'winning is everything'.
	notEmptyStack push: 'The winds of Winter' .
	notEmptyStack push: 'Winter is here'.
	FinderWithNotEmptyStacks := SentenceFinderByPrefix with: notEmptyStack .
	emptyStack := OOStack new.
	FinderWithEmptyStack := SentenceFinderByPrefix with: emptyStack.! !


!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'Cf 4/18/2019 20:24:43'!
test01aPrefixCantBeEmpty
	
	|aPrefix|
	aPrefix :=''.
	self
		should: [FinderWithNotEmptyStacks find: aPrefix ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix aPrefixCantBeEmptyErrorDescription ]! !


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

!SentenceFinderByPrefix methodsFor: 'operaciones' stamp: 'Cf 4/18/2019 20:20:41'!
find: aPrefix
 
	|stackThatContainsaPrefix |
	Halt .
	(aPrefix = '') ifTrue: [self signalaPrefixCantBeEmpty ].
	(aPrefix includes: ' ') ifTrue:[self signalaPrefixCantContainSpaces ].
	stackThatContainsaPrefix := OOStack new.
	sizeOfStackWithSentences timesRepeat: [self seeIfTopContainsaPrefix: aPrefix ifContainsPutIn: stackThatContainsaPrefix ].
	self fillstackWithSentenceswithAuxiliarStac.
	^stackThatContainsaPrefix.! !

!SentenceFinderByPrefix methodsFor: 'operaciones' stamp: 'Cf 4/18/2019 19:38:55'!
seeIfTopContainsaPrefix: aPrefix ifContainsPutIn: stackThatContainsaPrefix
	|sentenceToAnalize|
	sentenceToAnalize := stackWithSentences pop.
	( sentenceToAnalize includes: aPrefix ) ifTrue: [ stackThatContainsaPrefix push: sentenceToAnalize].
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


!SentenceFinderByPrefix class methodsFor: 'instance creation' stamp: 'Cf 4/18/2019 20:28:06'!
with: aStack
	^self new initialize: aStack ! !
