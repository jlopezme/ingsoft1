!classDefinition: #TusLibrosClientWindow category: #TusLibrosClientServerDemo!
Panel subclass: #TusLibrosClientWindow
	instanceVariableNames: 'logButton userIDmorph passUsermorph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibrosClientServerDemo'!

!TusLibrosClientWindow methodsFor: 'initialization' stamp: 'CF 6/29/2019 18:09:02'!
defaultExtent

	^ 315@320! !

!TusLibrosClientWindow methodsFor: 'initialization' stamp: 'CF 6/30/2019 16:08:02'!
initializeWith: aTitle

	self titleMorph showButtonsNamed: #( close collapse ).
	self setLabel: aTitle.
	self model: (TusLibrosClientWindowModel new).
	self morphExtent: (self defaultExtent).
	self buildMorphicWindow.
	self openInWorld.
	self yourself.
			
	"self model when: #newSubstringsArrived send: #refreshSubstringList to: self."! !


!TusLibrosClientWindow methodsFor: 'access' stamp: 'NR 6/25/2019 23:27:24'!
refreshSubstringList
	
	substringsList updateList.
	substringsList setSelectionIndex: 0.
	! !


!TusLibrosClientWindow methodsFor: 'box creation' stamp: 'CF 7/8/2019 17:03:11'!
createPassBox
	|textBox |
	
	textBox := TextModelMorph textProvider: self model textGetter: #userPass  textSetter: #userPass:  . 
	textBox textMorph setProperty: #keyStroke: toValue: [ :key | textBox textMorph acceptContents ] .
	textBox  borderWidth: 1; borderColor: Color black.
	textBox emptyTextDisplayMessage: 'Enter UserPassword' .
	^textBox ! !

!TusLibrosClientWindow methodsFor: 'box creation' stamp: 'CF 7/8/2019 16:53:50'!
createUserBox
	|textBox |
	
	textBox := TextModelMorph textProvider: self model textGetter: #userID  textSetter: #userID:  . 
	textBox textMorph setProperty: #keyStroke: toValue: [ :key | textBox textMorph acceptContents ] .
	textBox  borderWidth: 1; borderColor: Color black.
	textBox emptyTextDisplayMessage: 'Enter UserID' .
	^textBox ! !


!TusLibrosClientWindow methodsFor: 'GUI building' stamp: 'NR 6/25/2019 22:12:15'!
build1stColumn2ndRow
	| firstColumnLayoutOfSecondRow |
	
	substringsList := PluggableListMorph model: self model listGetter: #substringList indexGetter: #substringsListIndex indexSetter: #substringsListIndex:.
	substringsList  borderColor: Color skyBlue.
	substringsList  borderWidth: 1.
		
	firstColumnLayoutOfSecondRow := LayoutMorph newColumn.
	firstColumnLayoutOfSecondRow separation: 5;
	padding: #left;
	addMorph: (StringMorph contents:'Results');
	addMorph: substringsList.
		
	^firstColumnLayoutOfSecondRow.
	! !

!TusLibrosClientWindow methodsFor: 'GUI building' stamp: 'cf 7/1/2019 19:23:53'!
build2ndRow
	"|  secondRowLayout |
	showInTranscriptButton
	showInTranscriptButton := PluggableButtonMorph model: self model stateGetter: nil  action: #showWordInTranscript label: 'Show Selected Word In Transcript'.	
	
	secondRowLayout := LayoutMorph newRow.
	secondRowLayout separation: 25;
	padding: #left;
	addMorph: self build1stColumn2ndRow.
	addMorph: showInTranscriptButton.
	
	^secondRowLayout."
	| secondtRowLayout |
	
	
	passUsermorph := TextModelMorph textProvider: self model textGetter: #sentenceText textSetter: #sentenceText:. 
	passUsermorph textMorph setProperty: #keyStroke: toValue: [ :key | passUsermorph textMorph acceptContents ] .
	passUsermorph  borderWidth: 1; borderColor: Color black.
	passUsermorph emptyTextDisplayMessage: 'Enter user Password'.	
			
	secondtRowLayout := LayoutMorph newRow.
	secondtRowLayout separation: 5;
	padding: #left;
	addMorph: passUsermorph.

	^secondtRowLayout.! !

!TusLibrosClientWindow methodsFor: 'GUI building' stamp: 'CF 7/8/2019 16:55:16'!
buildMorphicWindow
	userIDmorph := self createUserBox .
	passUsermorph := self createPassBox .
	self layoutMorph beColumn;
	separation: 1;
	padding: #center;
	addMorph: (self createRowWith: userIDmorph separationOf: 5  PaddingOf: #center);
	addMorph: (self createRowWith: passUsermorph separationOf: 5  PaddingOf: #center);
	addMorph: (PluggableButtonMorph model: self model stateGetter: nil  action: #login  label: 'Log in').
	
	! !

!TusLibrosClientWindow methodsFor: 'GUI building' stamp: 'CF 6/29/2019 17:53:28'!
createRowWith: layotToAdd separationOf: separationAmount PaddingOf: paddingOrientation
	|rowLayout|
	rowLayout := LayoutMorph newRow.
	rowLayout separation: separationAmount ;
	padding: paddingOrientation ;
	addMorph: layotToAdd .

	^rowLayout.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosClientWindow class' category: #TusLibrosClientServerDemo!
TusLibrosClientWindow class
	instanceVariableNames: ''!

!TusLibrosClientWindow class methodsFor: 'instance creation' stamp: 'CF 6/29/2019 16:46:46'!
open
	
	^self new initializeWith: 'Tus Libros loggin'.! !


!classDefinition: #ErrorWindow category: #TusLibrosClientServerDemo!
TusLibrosClientWindow subclass: #ErrorWindow
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibrosClientServerDemo'!


!classDefinition: #SessionWindow category: #TusLibrosClientServerDemo!
TusLibrosClientWindow subclass: #SessionWindow
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibrosClientServerDemo'!


!classDefinition: #TusLibrosClientWindowModel category: #TusLibrosClientServerDemo!
Object subclass: #TusLibrosClientWindowModel
	instanceVariableNames: 'webClient selectedIndex userID userPass tusLibrosSystem'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibrosClientServerDemo'!

!TusLibrosClientWindowModel methodsFor: 'PluggableListSelectors' stamp: 'NR 6/25/2019 21:44:28'!
substringsListIndex
	
	^selectedIndex.! !

!TusLibrosClientWindowModel methodsFor: 'PluggableListSelectors' stamp: 'NR 6/25/2019 21:45:21'!
substringsListIndex: anIndex
	
	selectedIndex := anIndex.! !


!TusLibrosClientWindowModel methodsFor: 'initialization' stamp: 'CF 7/8/2019 17:21:51'!
initialize

	listOfWords := OrderedCollection new.
	sentence:=''.
	selectedIndex:=0.
	webClient := TusLibrosWebClient new.
	userID := ''.
	userPass := ''.
	tusLibrosSystem := TusLibrosSystemFacadeTest new setUp .! !


!TusLibrosClientWindowModel methodsFor: 'TextModelMorphSelectors' stamp: 'CF 7/8/2019 16:44:19'!
userID
	
	^userID .! !

!TusLibrosClientWindowModel methodsFor: 'TextModelMorphSelectors' stamp: 'CF 7/8/2019 16:44:37'!
userID: userText
	userID := userText.
	^true.! !

!TusLibrosClientWindowModel methodsFor: 'TextModelMorphSelectors' stamp: 'CF 7/8/2019 17:02:43'!
userPass
	^userPass ! !

!TusLibrosClientWindowModel methodsFor: 'TextModelMorphSelectors' stamp: 'CF 7/8/2019 17:02:50'!
userPass: userText
	userPass := userText . 
	^true.! !


!TusLibrosClientWindowModel methodsFor: 'PluggableButtonSelectors' stamp: 'CF 7/11/2019 15:28:27'!
login
	

	[SessionWindow with: (tusLibrosSystem createCart: userID withPass: userPass) open. ]
	on:Error
	do: [:anError|
		(ErrorWindow with: (anError messageText )) open.]
	! !

!TusLibrosClientWindowModel methodsFor: 'PluggableButtonSelectors' stamp: 'NR 6/25/2019 22:13:32'!
showWordInTranscript
	
	(selectedIndex = 0) ifFalse: 
		[TranscriptWindow openTranscript.
		Transcript clear.
		Transcript show: 'The word selected is: '.
		Transcript show: (listOfWords at: selectedIndex).
		Transcript show: ' '.].
! !


!classDefinition: #SessionWindowModel category: #TusLibrosClientServerDemo!
TusLibrosClientWindowModel subclass: #SessionWindowModel
	instanceVariableNames: 'actualCartID'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibrosClientServerDemo'!

!SessionWindowModel methodsFor: 'initialization' stamp: 'CF 7/8/2019 17:22:25'!
initialize
	actualCartID := 0.! !


!classDefinition: #TusLibrosServerController category: #TusLibrosClientServerDemo!
Object subclass: #TusLibrosServerController
	instanceVariableNames: 'webServer port tusLibrosSystem'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibrosClientServerDemo'!

!TusLibrosServerController methodsFor: 'enabling services' stamp: 'NR 6/24/2019 06:51:52'!
destroy
	
	webServer ifNotNil:[webServer destroy].! !

!TusLibrosServerController methodsFor: 'enabling services' stamp: 'NR 6/24/2019 06:52:06'!
startListening
	
	webServer startListener ! !

!TusLibrosServerController methodsFor: 'enabling services' stamp: 'NR 6/24/2019 06:52:12'!
stopListening
	
	webServer stopListener! !


!TusLibrosServerController methodsFor: 'initialization' stamp: 'CF 7/11/2019 15:25:36'!
initialize


	webServer := WebServer new listenOn: self port.
	
	tusLibrosSystem := TusLibrosSystemFacadeTest new setUp .
	
	webServer addService: '/createCart' action: [:request| |fields userID userPass message |
	
			[fields:= (request fields at:'fields') substrings.
			userID := fields at: 1.
			userPass := fields at: 2.
			message := (self createCart: userID withPass: userPass) asString .
			
			request send200Response: (self succesMessage: ('|', message)).
			]
			on:Error 
			do: [ :anError |
			request send404Response: ( self errorMessage: (anError messageText)) ]
					].
					
	webServer addService: '/addToCart' action:[
			:request| |fields cartId bookIsbn bookQuantity |
	
			[fields:= (request fields at:'fields') substrings.
			cartId := (fields at: 1) asNumber .
			bookIsbn := fields at: 2.
			bookQuantity := (fields at: 3) asNumber  .
			self addToCart: cartId  bookIsbn: bookIsbn bookQuantity: bookQuantity .
			
			request send200Response: (self succesMessage: '|OK').
			]
			on:Error 
			do: [ :anError |
			request send404Response: ( self errorMessage: (anError messageText)) ]
					].
	
					
	webServer addService: '/listCart' action: [
			:request| |fields cartId message  |
			[fields:= (request fields at:'fields') substrings.
			cartId := (fields at: 1) asNumber .
			message := self listCart: cartId .			
			request send200Response: (self succesMessage: message ).
			]
			on:Error 
			do: [ :anError |
			request send404Response: ( self errorMessage: (anError messageText)) ]
		
		].		
		
	webServer addService: '/checkOutCart' action: [
			:request| |fields cartId ccn cced ccedMonth ccedYear cco message  |
			[fields:= (request fields at:'fields') substrings.
			cartId := (fields at: 1) asNumber .
			ccn := (fields at: 2).
			ccedMonth := (fields at: 3) asString .
			ccedYear := (fields at: 4) asNumber .
			cced := Month month: ccedMonth year: ccedYear .
			cco := (fields at: 5),' ',(fields at: 6).
			message := (self checkOutCart: cartId ccn: ccn  cceed: cced  cco: cco) asString .
						
			request send200Response: (self succesMessage: ('|',message )).
			]
			on:Error 
			do: [ :anError |
			request send404Response: ( self errorMessage: (anError messageText)) ]
		
		].	
	
		webServer addService: '/listPurchases' action: [
			:request| |fields clientID clientPass message  |
			[fields:= (request fields at:'fields') substrings.
			clientID := (fields at: 1) .
			clientPass := (fields at:2).
			message := self listPurchases: clientID password: clientPass .			
			request send200Response: (self succesMessage: message ).
			]
			on:Error 
			do: [ :anError |
			request send404Response: ( self errorMessage: (anError messageText)) ]
		
		].		

	
! !

!TusLibrosServerController methodsFor: 'initialization' stamp: 'NR 6/25/2019 22:14:59'!
port
	"Use a random port to minimise chances of concurrently running test suites clashing."
	"^ port
		ifNil: [port := (10000 to: 50000) atRandom]"
	
	^port ifNil: [port:=8080].
	
	! !


!TusLibrosServerController methodsFor: 'private' stamp: 'CF 7/2/2019 13:49:40'!
addToCart: cartId  bookIsbn: bookIsbn bookQuantity: bookQuantity 
	^tusLibrosSystem addToCart: cartId bookIsbn: bookIsbn  bookQuantity: bookQuantity ! !

!TusLibrosServerController methodsFor: 'private' stamp: 'CF 7/6/2019 15:52:14'!
checkOutCart: cartId ccn: creditCardNumber cceed: ccExpirationDate cco:ccOwner
	^ tusLibrosSystem checkOutCart: cartId ccn: creditCardNumber  cceed: ccExpirationDate  cco: ccOwner 
	! !

!TusLibrosServerController methodsFor: 'private' stamp: 'CF 7/2/2019 11:24:56'!
createCart: userID withPass: userPass
	^tusLibrosSystem createCart: userID withPass: userPass ! !

!TusLibrosServerController methodsFor: 'private' stamp: 'CF 7/8/2019 11:47:31'!
listCart: cartID
	
	|content cartList|
	
	content :=tusLibrosSystem listCart: cartID .
	cartList := ''.
	content keysDo: [:aKey | 
 	cartList := cartList , '|', aKey ,'|', ((content at: aKey ) asString ).].
	^cartList .! !

!TusLibrosServerController methodsFor: 'private' stamp: 'CF 7/8/2019 11:46:54'!
listPurchases: clientId password: password
	|purchases sales ticket total  |
	purchases :=tusLibrosSystem listPurchases: clientId password: password .
	sales := tusLibrosSystem salesDoneBy: clientId .
	ticket :=''.
	ticket := self createTicketWithSales: sales .
	total :=0.
	purchases keysDo: [:item |total :=total +(purchases at:item).].						
	ticket := ticket , '|' , (total asString).
	^ticket .! !


!TusLibrosServerController methodsFor: 'operation messages' stamp: 'CF 7/2/2019 11:33:47'!
errorMessage:message
	^'1|',message ! !

!TusLibrosServerController methodsFor: 'operation messages' stamp: 'CF 7/3/2019 11:21:46'!
succesMessage: message
	^'0',message .! !


!TusLibrosServerController methodsFor: 'formatting' stamp: 'CF 7/8/2019 11:43:30'!
createTicketWithSales: sales
	|ticket|
	ticket:=''.
	sales do: [:sale| sale lineItemsDo: [:lineItem| ticket :=ticket,'|', (lineItem item) ,'|', ((lineItem quantity )asString ).]] .
	^ticket .! !


!classDefinition: #TusLibrosWebClient category: #TusLibrosClientServerDemo!
Object subclass: #TusLibrosWebClient
	instanceVariableNames: 'port'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibrosClientServerDemo'!

!TusLibrosWebClient methodsFor: 'sending requests' stamp: 'NR 6/25/2019 22:25:36'!
correctlyEncodeSpacesForUrlRequestParameter: aParameter
	
	^ aParameter copyReplaceAll: ' ' with: '%20'. ! !

!TusLibrosWebClient methodsFor: 'sending requests' stamp: 'NR 6/25/2019 22:25:21'!
sendRequest: sentence

	| fieldDict resp urlEncodedSentence |
	
	urlEncodedSentence := self correctlyEncodeSpacesForUrlRequestParameter: sentence.	
	fieldDict := Dictionary newFromPairs: {'sentence'. urlEncodedSentence.}.		
	
	resp:= WebClient htmlSubmit: (self url,'/substrings') fields: fieldDict.
	
	resp isSuccess 
		ifTrue:[^(WebUtils jsonDecode: ((resp content) readStream)) asOrderedCollection .] 
		ifFalse:[^self error: resp content].! !


!TusLibrosWebClient methodsFor: 'initialization' stamp: 'NR 6/25/2019 22:15:16'!
port
	
	^port ifNil: [port:=8080].! !

!TusLibrosWebClient methodsFor: 'initialization' stamp: 'NR 6/24/2019 06:52:37'!
url
	
	^'http://localhost:', self port asString! !
