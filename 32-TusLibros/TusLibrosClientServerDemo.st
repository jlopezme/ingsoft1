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


!TusLibrosClientWindow methodsFor: 'access' stamp: 'CF 6/30/2019 16:15:14'!
login
	! !

!TusLibrosClientWindow methodsFor: 'access' stamp: 'NR 6/25/2019 23:27:24'!
refreshSubstringList
	
	substringsList updateList.
	substringsList setSelectionIndex: 0.
	! !


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

!TusLibrosClientWindow methodsFor: 'GUI building' stamp: 'cf 7/1/2019 19:32:50'!
buildMorphicWindow
	userIDmorph := self createTextBoxWithTextPlaceHolder:'Enter User ID'.
	passUsermorph := self createTextBoxWithTextPlaceHolder: 'Enter User Password'.
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

!TusLibrosClientWindow methodsFor: 'GUI building' stamp: 'cf 7/1/2019 19:28:25'!
createTextBoxWithTextPlaceHolder: textPlaceHolder
	|textBox|
	textBox := TextModelMorph textProvider: self model textGetter: #userIDText textSetter: #userIDText:. 
	textBox textMorph setProperty: #keyStroke: toValue: [ :key | textBox textMorph acceptContents ] .
	textBox  borderWidth: 1; borderColor: Color black.
	textBox emptyTextDisplayMessage: textPlaceHolder .
	^textBox ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TusLibrosClientWindow class' category: #TusLibrosClientServerDemo!
TusLibrosClientWindow class
	instanceVariableNames: ''!

!TusLibrosClientWindow class methodsFor: 'instance creation' stamp: 'CF 6/29/2019 16:46:46'!
open
	
	^self new initializeWith: 'Tus Libros loggin'.! !


!classDefinition: #TusLibrosClientWindowModel category: #TusLibrosClientServerDemo!
Object subclass: #TusLibrosClientWindowModel
	instanceVariableNames: 'webClient listOfWords sentence selectedIndex userID userPass'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibrosClientServerDemo'!

!TusLibrosClientWindowModel methodsFor: 'PluggableListSelectors' stamp: 'NR 6/24/2019 06:26:32'!
substringList
	
	^listOfWords.
! !

!TusLibrosClientWindowModel methodsFor: 'PluggableListSelectors' stamp: 'NR 6/25/2019 21:44:28'!
substringsListIndex
	
	^selectedIndex.! !

!TusLibrosClientWindowModel methodsFor: 'PluggableListSelectors' stamp: 'NR 6/25/2019 21:45:21'!
substringsListIndex: anIndex
	
	selectedIndex := anIndex.! !


!TusLibrosClientWindowModel methodsFor: 'initialization' stamp: 'cf 7/1/2019 19:29:21'!
initialize

	listOfWords := OrderedCollection new.
	sentence:=''.
	selectedIndex:=0.
	webClient := TusLibrosWebClient new.
	userID := ''.
	userPass := '1234'.! !


!TusLibrosClientWindowModel methodsFor: 'TextModelMorphSelectors' stamp: 'NR 6/25/2019 21:43:32'!
sentenceText
	
	^sentence.! !

!TusLibrosClientWindowModel methodsFor: 'TextModelMorphSelectors' stamp: 'NR 6/25/2019 21:43:51'!
sentenceText: aSentence

	sentence:=aSentence.
	^true.! !

!TusLibrosClientWindowModel methodsFor: 'TextModelMorphSelectors' stamp: 'cf 7/1/2019 19:27:15'!
userIDText
	
	^sentence.! !

!TusLibrosClientWindowModel methodsFor: 'TextModelMorphSelectors' stamp: 'cf 7/1/2019 19:27:46'!
userIDText: userText
	userID := userText.
	^true.! !


!TusLibrosClientWindowModel methodsFor: 'PluggableButtonSelectors' stamp: 'cf 7/1/2019 19:33:22'!
login
	self halt .! !

!TusLibrosClientWindowModel methodsFor: 'PluggableButtonSelectors' stamp: 'CF 6/30/2019 15:57:24'!
sendSubtringsRequest

	listOfWords := webClient sendRequest: sentence.
	
	self triggerEvent: #newSubstringsArrived with: self.
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


!classDefinition: #TusLibrosServerController category: #TusLibrosClientServerDemo!
Object subclass: #TusLibrosServerController
	instanceVariableNames: 'webServer port hiList'
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


!TusLibrosServerController methodsFor: 'initialization' stamp: 'NR 6/25/2019 19:15:47'!
initialize

	hiList := self hiList.
	
	webServer := WebServer new listenOn: self port.
	
	webServer addService: '/sayHi' action:[:request |	
		
		request send200Response: (self sayRandomHi)].
	
	webServer addService: '/substrings' action:[:request | |substringsAsJson sentence substrings |
		
		[sentence := (request fields at:'sentence').
		substrings := sentence substrings.
		substringsAsJson:= WebUtils jsonEncode: (substrings).
		request send200Response: (substringsAsJson)
		 ] 
		on: Error 
		do: [ :anError |
			request send404Response: (anError messageText) ]].
	
! !

!TusLibrosServerController methodsFor: 'initialization' stamp: 'NR 6/25/2019 22:14:59'!
port
	"Use a random port to minimise chances of concurrently running test suites clashing."
	"^ port
		ifNil: [port := (10000 to: 50000) atRandom]"
	
	^port ifNil: [port:=8080].
	
	! !


!TusLibrosServerController methodsFor: 'private' stamp: 'NR 6/24/2019 07:16:54'!
hiList
	
	^OrderedCollection with: 'Hi!!' with: 'Hodor!!' with: 'I am Groot!!' with: 'My name is Homer Simp... Doh!!' with: 'I am inevitable...' with: 'Because Im Baaaatman!!'.
	
	! !

!TusLibrosServerController methodsFor: 'private' stamp: 'NR 6/24/2019 07:15:43'!
sayRandomHi
	
	^hiList at: (hiList size atRandom).
	! !


!classDefinition: #TusLibrosWebClient category: #TusLibrosClientServerDemo!
Object subclass: #TusLibrosWebClient
	instanceVariableNames: 'port'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibrosClientServerDemo'!

!TusLibrosWebClient methodsFor: 'sending requests' stamp: 'NR 6/25/2019 22:25:36'!
correctlyEncodeSpacesForUrlRequestParameter: aParameter
	
	^ aParameter copyReplaceAll: ' ' with: '%20'. ! !

!TusLibrosWebClient methodsFor: 'sending requests' stamp: 'CF 6/30/2019 16:09:41'!
loginwithUserID: userID andPass: userPass
! !

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
