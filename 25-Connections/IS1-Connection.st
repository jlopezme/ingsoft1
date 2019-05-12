!classDefinition: #ConnectionTest category: #'IS1-Connection'!
TestCase subclass: #ConnectionTest
	instanceVariableNames: 'logStream'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-Connection'!

!ConnectionTest methodsFor: 'tests' stamp: 'HAW 5/8/2019 10:57:57'!
test01

	| connection sent sentString | 
	
	sentString := 'hello!!'.
	connection := self createConnection.
	connection send: sentString.
	
	sent := ReadStream on: connection sentContents.
	
	self assert: sentString equals: sent nextLine.
	self assert: sent atEnd! !

!ConnectionTest methodsFor: 'tests' stamp: 'HAW 5/8/2019 17:46:16'!
test02

	| connection sent sentString | 
	
	sentString := 'hello!!'.
	connection := self createTracedConnection.
	connection send: sentString.
	
	sent := ReadStream on: connection sentContents.
	self assert: sentString equals: sent nextLine.
	self assert: sent atEnd.
	
	logStream reset.
	self assert: '[2019-01-01T10:20:30+00:00] ',sentString equals: logStream nextLine.
	self assert: logStream atEnd! !

!ConnectionTest methodsFor: 'tests' stamp: 'HAW 5/8/2019 10:58:42'!
test03

	| connection sent sentString | 
	
	sentString := 'hello!!'.
	connection := self createZippedConnection.
	connection send: sentString.
	
	sent := ReadStream on: connection sentContents.
	self assert: 'zipped[',sentString,']' equals: sent nextLine.
	self assert: sent atEnd.
	
	! !

!ConnectionTest methodsFor: 'tests' stamp: 'HAW 5/8/2019 10:59:43'!
test04

	| connection sent sentString | 
	
	sentString := 'hello!!'.
	connection := self createEncryptedConnection.
	connection send: sentString.
	
	sent := ReadStream on: connection sentContents.
	self assert: 'encrypted[',sentString,']' equals: sent nextLine.
	self assert: sent atEnd.
	
	! !

!ConnectionTest methodsFor: 'tests' stamp: 'HAW 5/8/2019 11:00:51'!
test05

	| connection sent sentString | 
	
	sentString := 'hello!!'.
	connection := self createZippedEncryptedConnection.
	connection send: sentString.
	
	sent := ReadStream on: connection sentContents.
	self assert: 'zipped[encrypted[',sentString,']]' equals: sent nextLine.
	self assert: sent atEnd.
	
	! !

!ConnectionTest methodsFor: 'tests' stamp: 'HAW 5/8/2019 17:46:39'!
test06

	| connection sent sentString | 
	
	sentString := 'hello!!'.
	connection := self createZippedEncryptedTracedConnection.
	connection send: sentString.
	
	sent := ReadStream on: connection sentContents.
	self assert: 'zipped[encrypted[',sentString,']]' equals: sent nextLine.
	self assert: sent atEnd.
	
	logStream reset.
	self assert: '[2019-01-01T10:20:30+00:00] ',sentString equals: logStream nextLine.
	self assert: logStream atEnd! !

!ConnectionTest methodsFor: 'tests' stamp: 'HAW 5/8/2019 18:15:26'!
test07

	| connection sent sentString | 
	
	sentString := 'hello!!'.
	connection := self createTracedZippedConnection.
	connection send: sentString.
	
	sent := ReadStream on: connection sentContents.
	self assert: 'zipped[',sentString,']' equals: sent nextLine.
	self assert: sent atEnd.
	
	logStream reset.
	self assert: '[2019-01-01T10:20:30+00:00] zipped[',sentString,']' equals: logStream nextLine.
	self assert: logStream atEnd! !

!ConnectionTest methodsFor: 'tests' stamp: 'HAW 5/8/2019 18:15:32'!
test08

	| connection sent sentString | 
	
	sentString := 'hello!!'.
	connection := self createTracedEncryptedConnection.
	connection send: sentString.
	
	sent := ReadStream on: connection sentContents.
	self assert: 'encrypted[',sentString,']' equals: sent nextLine.
	self assert: sent atEnd.
	
	logStream reset.
	self assert: '[2019-01-01T10:20:30+00:00] encrypted[',sentString,']' equals: logStream nextLine.
	self assert: logStream atEnd! !


!ConnectionTest methodsFor: 'connection creation' stamp: 'HAW 5/8/2019 10:58:06'!
createConnection
	
	^Connection new! !

!ConnectionTest methodsFor: 'connection creation' stamp: 'Cf 5/12/2019 14:01:11'!
createEncryptedConnection
	^ self createConnection encript.
	! !

!ConnectionTest methodsFor: 'connection creation' stamp: 'HAW 5/8/2019 17:50:56'!
createLogStream
	
	logStream := ReadWriteStream on: String new.
	^logStream 
	! !

!ConnectionTest methodsFor: 'connection creation' stamp: 'Cf 5/12/2019 13:18:56'!
createTracedConnection
	
	"^TracedConnection loggingInto: self createLogStream clock: self"
	"|tracedConection|
	tracedConection := self createConnection.
	tracedConection traceWithThisLog:self createLogStream andThisClock: self now asString .
	^tracedConection "
	^ self createConnection traceWithThisLog: self createLogStream andThisClock: self now asString.! !

!ConnectionTest methodsFor: 'connection creation' stamp: 'Cf 5/12/2019 20:19:30'!
createTracedEncryptedConnection
	
	"^TracedEncryptedConnection loggingInto: self createLogStream clock: self"
	^ self createTracedConnection encript.! !

!ConnectionTest methodsFor: 'connection creation' stamp: 'Cf 5/12/2019 15:20:35'!
createTracedZippedConnection
	
	"^TracedZippedConnection loggingInto: self createLogStream clock: self"
	"^ self createZippedConnection traceWithThisLog: self createLogStream andThisClock: self now asString "
	^ self createTracedConnection zippConection ! !

!ConnectionTest methodsFor: 'connection creation' stamp: 'Cf 5/12/2019 13:21:45'!
createZippedConnection
	
	"^ZippedConnection new."
	^ self createConnection zippConection.! !

!ConnectionTest methodsFor: 'connection creation' stamp: 'Cf 5/12/2019 14:52:56'!
createZippedEncryptedConnection
	
	^ self createZippedConnection encript ! !

!ConnectionTest methodsFor: 'connection creation' stamp: 'Cf 5/12/2019 15:38:55'!
createZippedEncryptedTracedConnection
	
	"^ZippedEncryptedTracedConnection loggingInto: self createLogStream clock: self"
	^ self createZippedEncryptedConnection traceWithThisLog:  self createLogStream andThisClock: self now asString . 
	 ! !


!ConnectionTest methodsFor: 'clock' stamp: 'HAW 5/8/2019 10:14:32'!
now
	
	^DateAndTime year: 2019 day: 1 hour: 10 minute: 20 second: 30
! !


!classDefinition: #Connection category: #'IS1-Connection'!
Object subclass: #Connection
	instanceVariableNames: 'stream logStream starts ends isTraced logStarts logEnds'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'IS1-Connection'!

!Connection methodsFor: 'sending' stamp: 'Cf 5/12/2019 20:21:04'!
send: aPackage
	
	stream nextPutAll: aPackage.! !

!Connection methodsFor: 'sending' stamp: 'Cf 5/12/2019 20:17:36'!
sentContents
	logStream nextPutAll: logStarts contents , stream contents , logEnds contents.
	^starts contents , stream contents, ends contents.! !


!Connection methodsFor: 'initialization' stamp: 'Cf 5/12/2019 20:10:15'!
initialize
	starts :=WriteStream on: String new.
	ends := WriteStream on: String new.
	isTraced := false.
	logStarts :=WriteStream on: String new.
	logEnds := WriteStream on: String new.
	stream := WriteStream on: String new.
	logStream := ReadWriteStream on: String new.

	! !


!Connection methodsFor: 'tracedConections' stamp: 'Cf 5/12/2019 20:10:09'!
traceWithThisLog: logTracer andThisClock: nowClock 
	logTracer nextPutAll: '[', nowClock , '] '.
	logStream := logTracer.
	isTraced := true.! !


!Connection methodsFor: 'Conection Operations' stamp: 'Cf 5/12/2019 20:11:54'!
zippConection
	starts nextPutAll: 'zipped['.
	ends nextPutAll: ']'.	
	isTraced ifTrue: [
		logStarts nextPutAll: 'zipped['.
		logEnds nextPutAll: ']'.
		].! !


!Connection methodsFor: 'Encrypted Connections' stamp: 'Cf 5/12/2019 20:12:17'!
encript
	starts nextPutAll: 'encrypted['.
	ends nextPutAll: ']'.	
	isTraced ifTrue: [
		logStarts nextPutAll: 'encrypted['.
		logEnds nextPutAll: ']'.
		].! !
