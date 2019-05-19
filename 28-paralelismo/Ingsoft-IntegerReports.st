!classDefinition: #IntegerReportTest category: #'Ingsoft-IntegerReports'!
TestCase subclass: #IntegerReportTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ingsoft-IntegerReports'!

!IntegerReportTest methodsFor: 'tests' stamp: 'HAW 5/12/2019 20:03:16'!
test01

	| lines report  integerToAnalize |
	
	integerToAnalize := 100.
	report := BasicIntegerPropertiesReport for: integerToAnalize.
	lines := ReadStream on: report value.
	
	self assert: 'Factorial: ', integerToAnalize factorial printString equals: lines next.
	self assert: 'Roman: ''', integerToAnalize printStringRoman, '''' equals: lines next.
	self assert: 'Ln: ', integerToAnalize ln printString equals: lines next.
	self assert: lines atEnd.
	
 ! !

!IntegerReportTest methodsFor: 'tests' stamp: 'HAW 5/12/2019 20:03:37'!
test02

	| lines report integerToAnalize |
	
	integerToAnalize := 200.
	report := IntegerOnDifferentBasesReport for: integerToAnalize.
	lines := ReadStream on: report value.
	
	self assert: 'Binary: ', (integerToAnalize storeStringBase: 2) equals: lines next.
	self assert: 'Octal: ', (integerToAnalize storeStringBase: 8) equals: lines next.
	self assert: 'Hexadecimal: ', (integerToAnalize storeStringBase: 16) equals: lines next.
	self assert: lines atEnd.
	
! !

!IntegerReportTest methodsFor: 'tests' stamp: 'cf 5/19/2019 12:26:33'!
test03

	| lines report  integerToAnalize |
	
	integerToAnalize := 300.
	report := ComplexIntegerPropertiesReport for: integerToAnalize.
	lines := ReadStream on: report value.
	
	self assert: 'Prime?: ', integerToAnalize isPrime printString equals: lines next.
	self assert: 'Next Prime: ', integerToAnalize nextPrime printString equals: lines next.
	self assert: 'Sqrt: ', integerToAnalize sqrt printString equals: lines next.
	self assert: lines atEnd.
	
 ! !

!IntegerReportTest methodsFor: 'tests' stamp: 'HAW 5/12/2019 20:06:01'!
test04

	| lines report  integerToAnalize |
	
	integerToAnalize := 300.
	report := CombinedIntegerPropertiesReport for: integerToAnalize.
	self 
		shouldnt: [ lines := ReadStream on: report value ]
		takeMoreThan: 1.5*second.
		
	self assert: 'Factorial: ', integerToAnalize factorial printString equals: lines next.
	self assert: 'Roman: ''', integerToAnalize printStringRoman, '''' equals: lines next.
	self assert: 'Ln: ', integerToAnalize ln printString equals: lines next.
	self assert: 'Prime?: ', integerToAnalize isPrime printString equals: lines next.
	self assert: 'Next Prime: ', integerToAnalize nextPrime printString equals: lines next.
	self assert: 'Sqrt: ', integerToAnalize sqrt printString equals: lines next.
	self assert: lines atEnd.
	
 ! !

!IntegerReportTest methodsFor: 'tests' stamp: 'HAW 5/12/2019 20:08:26'!
test05

	| lines report  integerToAnalize |
	
	integerToAnalize := 300.
	report := CompleteIntegerReport for: integerToAnalize.
	self 
		shouldnt: [ lines := ReadStream on: report value ]
		takeMoreThan: 1.5*second.

	self assert: 'Factorial: ', integerToAnalize factorial printString equals: lines next.
	self assert: 'Roman: ''', integerToAnalize printStringRoman, '''' equals: lines next.
	self assert: 'Ln: ', integerToAnalize ln printString equals: lines next.
	self assert: 'Prime?: ', integerToAnalize isPrime printString equals: lines next.
	self assert: 'Next Prime: ', integerToAnalize nextPrime printString equals: lines next.
	self assert: 'Sqrt: ', integerToAnalize sqrt printString equals: lines next.
	self assert: 'Binary: ', (integerToAnalize storeStringBase: 2) equals: lines next.
	self assert: 'Octal: ', (integerToAnalize storeStringBase: 8) equals: lines next.
	self assert: 'Hexadecimal: ', (integerToAnalize storeStringBase: 16) equals: lines next.
	self assert: lines atEnd.
	
 ! !


!IntegerReportTest methodsFor: 'assertions' stamp: 'HAW 5/12/2019 19:20:40'!
shouldnt: aClosureToMeasure takeMoreThan: aTimeLimit

	| elapsedTime |
	
	elapsedTime :=  aClosureToMeasure timeToRun * millisecond.
	
	self assert: elapsedTime <= aTimeLimit 
	
! !


!classDefinition: #IntegerReport category: #'Ingsoft-IntegerReports'!
Object subclass: #IntegerReport
	instanceVariableNames: 'integerToAnalize'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ingsoft-IntegerReports'!

!IntegerReport methodsFor: 'initialization' stamp: 'HAW 5/12/2019 19:11:29'!
initializeFor: anIntegerToAnalize

	integerToAnalize := anIntegerToAnalize ! !


!IntegerReport methodsFor: 'reporting' stamp: 'cf 5/19/2019 12:37:03'!
firstProcces: firstProccess titleForFirstProcces: firstproccesTitle  secondProcces: secondProcces titleForSecondProcces: secondproccesTitle  thirdProcces: thridProcces titleForThirdProcces: thirdproccesTitle
	
| lines firstLineProcces secondLineProcces thridLineProcces semaforo  |
	self wait.
	lines := OrderedCollection new.
	firstLineProcces := OrderedCollection new.
	secondLineProcces  := OrderedCollection new.
	thridLineProcces  := OrderedCollection new.
	semaforo := Semaphore new.	
	
		[semaforo signal .
			(self addLineTo: firstLineProcces title: firstproccesTitle with: firstProccess )]fork.
		
		[(self addLineTo: secondLineProcces title: secondproccesTitle with: secondProcces )] fork.
		
		[(self addLineTo: thridLineProcces title: thirdproccesTitle with: thridProcces )] fork.
		 semaforo wait .
		lines add: (firstLineProcces at:1).
		lines add: (secondLineProcces at:1).
		lines add: (thridLineProcces at:1).
	^lines! !

!IntegerReport methodsFor: 'reporting' stamp: 'HAW 5/12/2019 19:12:35'!
value

	self subclassResponsibility ! !


!IntegerReport methodsFor: 'time consuption simulation' stamp: 'HAW 5/12/2019 19:14:02'!
wait

	(Delay forSeconds: 1) wait.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IntegerReport class' category: #'Ingsoft-IntegerReports'!
IntegerReport class
	instanceVariableNames: ''!

!IntegerReport class methodsFor: 'instance creation' stamp: 'HAW 5/12/2019 19:11:34'!
for: anIntegerToAnalize

	^self new initializeFor: anIntegerToAnalize ! !


!classDefinition: #CombinedIntegerPropertiesReport category: #'Ingsoft-IntegerReports'!
IntegerReport subclass: #CombinedIntegerPropertiesReport
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ingsoft-IntegerReports'!

!CombinedIntegerPropertiesReport methodsFor: 'reporting' stamp: 'HAW 5/12/2019 20:12:03'!
value

	| basicPropertiesLines complexPropertiesLines lines |
	
	lines := OrderedCollection new.
	basicPropertiesLines := (BasicIntegerPropertiesReport for: integerToAnalize) value.
	complexPropertiesLines := (ComplexIntegerPropertiesReport for: integerToAnalize) value.

	lines 
		addAll: basicPropertiesLines;
		addAll: complexPropertiesLines.
		
	^lines! !


!classDefinition: #CompleteIntegerReport category: #'Ingsoft-IntegerReports'!
IntegerReport subclass: #CompleteIntegerReport
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ingsoft-IntegerReports'!

!CompleteIntegerReport methodsFor: 'reporting' stamp: 'HAW 5/12/2019 20:12:17'!
value

	| combinedPropertiesLines differentBasesLines lines |
	
	lines := OrderedCollection new.	
	combinedPropertiesLines := (CombinedIntegerPropertiesReport for: integerToAnalize) value.
	differentBasesLines := (IntegerOnDifferentBasesReport for: integerToAnalize) value.
		
	lines
		addAll: combinedPropertiesLines;
		addAll: differentBasesLines.
		
	^lines! !


!classDefinition: #IntegerOnDifferentBasesReport category: #'Ingsoft-IntegerReports'!
IntegerReport subclass: #IntegerOnDifferentBasesReport
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ingsoft-IntegerReports'!

!IntegerOnDifferentBasesReport methodsFor: 'reporting - private' stamp: 'HAW 5/12/2019 20:04:56'!
addNumberInBase: aBase to: lines title: aTitle

	lines add: aTitle, ': ', (integerToAnalize storeStringBase: aBase).
	
	! !


!IntegerOnDifferentBasesReport methodsFor: 'reporting' stamp: 'cf 5/19/2019 11:52:16'!
value

	| lines binaryBase octogonalBase hexadecimalBase semaforo|
	
	self wait.
	lines := OrderedCollection new.
	binaryBase  := OrderedCollection new.
	octogonalBase  := OrderedCollection new.
	hexadecimalBase  := OrderedCollection new.
	semaforo := Semaphore new.
	"self 
		addNumberInBase: 2 to: lines title: 'Binary';
		addNumberInBase: 8 to: lines title: 'Octal';
		addNumberInBase: 16 to: lines title: 'Hexadecimal'."
		[semaforo signal.
			(self addNumberInBase: 2 to: binaryBase  title: 'Binary')] fork.
		[(self addNumberInBase: 8 to: octogonalBase  title: 'Octal')]fork.
		[(self addNumberInBase: 16to: hexadecimalBase  title: 'Hexadecimal')]fork.
		semaforo wait.
		lines add: (binaryBase at: 1).
		lines add: (octogonalBase at:1).
		lines add: (hexadecimalBase at:1).
		
	^lines! !


!classDefinition: #IntegerPropertiesReport category: #'Ingsoft-IntegerReports'!
IntegerReport subclass: #IntegerPropertiesReport
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ingsoft-IntegerReports'!

!IntegerPropertiesReport methodsFor: 'reporting - private' stamp: 'HAW 5/12/2019 20:02:54'!
addLineTo: lines title: aTitle with: anIntegerClosure

	lines add: aTitle, ': ', anIntegerClosure value printString
! !


!classDefinition: #BasicIntegerPropertiesReport category: #'Ingsoft-IntegerReports'!
IntegerPropertiesReport subclass: #BasicIntegerPropertiesReport
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ingsoft-IntegerReports'!

!BasicIntegerPropertiesReport methodsFor: 'reporting' stamp: 'cf 5/19/2019 12:24:47'!
value

	|factorialProcces asRomanProcces naturalLogProcces  |
			
		factorialProcces := [ integerToAnalize factorial ].
		asRomanProcces :=  [ integerToAnalize printStringRoman ].
		naturalLogProcces := [ integerToAnalize ln ].
		
	^self firstProcces: factorialProcces titleForFirstProcces: 'Factorial' secondProcces: asRomanProcces  titleForSecondProcces: 'Roman' thirdProcces: naturalLogProcces titleForThirdProcces: 'Ln'.! !


!classDefinition: #ComplexIntegerPropertiesReport category: #'Ingsoft-IntegerReports'!
IntegerPropertiesReport subclass: #ComplexIntegerPropertiesReport
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ingsoft-IntegerReports'!

!ComplexIntegerPropertiesReport methodsFor: 'reporting' stamp: 'cf 5/19/2019 12:31:29'!
value

	| primeProcces nextPrimeProcces sqrtProcces|
	primeProcces := [ integerToAnalize isPrime].
	nextPrimeProcces := [ integerToAnalize nextPrime ].
	sqrtProcces := [ integerToAnalize sqrt ].
	^ self firstProcces:  primeProcces titleForFirstProcces: 'Prime?' secondProcces: nextPrimeProcces titleForSecondProcces: 'Next Prime'   thirdProcces: sqrtProcces titleForThirdProcces: 'Sqrt' .! !
