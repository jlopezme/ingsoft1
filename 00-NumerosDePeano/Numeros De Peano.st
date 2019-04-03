!classDefinition: #I category: #'Numeros De Peano'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros De Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #'Numeros De Peano'!
I class
	instanceVariableNames: 'size next tamaño'!

!I class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 09:38:51'!
* unNumerodePeano

	^unNumerodePeano.! !

!I class methodsFor: 'as yet unclassified' stamp: 'ARM 3/28/2019 17:51:46'!
+ unNumeroDePeano

	^unNumeroDePeano next

	! !

!I class methodsFor: 'as yet unclassified' stamp: 'Cf 3/31/2019 14:13:54'!
- unNumerodePeano
	Error signal: self descripcionDeErrorDeNumerosNegativosNoSoportados .! !

!I class methodsFor: 'as yet unclassified' stamp: 'Cf 3/31/2019 14:19:20'!
/ unnumerodePeano

	self=unnumerodePeano  ifTrue: [^self].
	Error signal: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor.! !

!I class methodsFor: 'as yet unclassified' stamp: 'Cf 3/31/2019 14:26:22'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor.
 ^'El resultado de esta operacion,no es un numero de Peano'.! !

!I class methodsFor: 'as yet unclassified' stamp: 'Cf 3/31/2019 14:29:30'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^'El resultado de esta operacion,no es un numero de Peano'! !

!I class methodsFor: 'as yet unclassified' stamp: 'Cf 4/2/2019 10:33:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	size := nil.
	next := II.
	tamaño := nil.! !

!I class methodsFor: 'as yet unclassified' stamp: 'ARM 3/28/2019 17:40:14'!
next

	^next! !


!classDefinition: #II category: #'Numeros De Peano'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros De Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #'Numeros De Peano'!
II class
	instanceVariableNames: 'next previous'!

!II class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:21:04'!
* unNumerodePeano
	(unNumerodePeano = I) ifTrue: [^self]
	 ifFalse: [^self+(self*(unNumerodePeano -I))].! !

!II class methodsFor: 'as yet unclassified' stamp: 'ARM 3/28/2019 17:54:12'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!II class methodsFor: 'as yet unclassified' stamp: 'ARM 3/28/2019 18:16:26'!
- unNumeroDePeano

	unNumeroDePeano = I ifTrue: [ ^self previous].
	^self previous - unNumeroDePeano previous! !

!II class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:24:11'!
/ unNumerodePeano
	
	self = unNumerodePeano  ifTrue: [^I].
	^self - unNumerodePeano / unNumerodePeano + I.! !

!II class methodsFor: 'as yet unclassified' stamp: 'Cf 3/31/2019 14:20:56'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor.
^'El resultado de esta operacion,no es un numero de Peano'.! !

!II class methodsFor: 'as yet unclassified' stamp: 'Cf 4/2/2019 10:33:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := III.
	previous := I.! !

!II class methodsFor: 'as yet unclassified' stamp: 'ARM 3/28/2019 18:07:16'!
next

	next ifNil:
	[
		next _ self cloneNamed: (self name , 'I').
		next previous: self.
	].
	^next! !

!II class methodsFor: 'as yet unclassified' stamp: 'ARM 3/28/2019 18:01:40'!
previous
	^previous! !

!II class methodsFor: 'as yet unclassified' stamp: 'ARM 3/28/2019 18:17:27'!
previous: unNumeroDePeano
	previous := unNumeroDePeano! !

!II class methodsFor: 'as yet unclassified' stamp: 'ARM 3/28/2019 18:06:24'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !


!classDefinition: #III category: #'Numeros De Peano'!
DenotativeObject subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros De Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: #'Numeros De Peano'!
III class
	instanceVariableNames: 'next previous'!

!III class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:16'!
* unNumerodePeano
	(unNumerodePeano = I) ifTrue: [^self]
	 ifFalse: [^self+(self*(unNumerodePeano -I))].! !

!III class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:16'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!III class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:16'!
- unNumeroDePeano

	unNumeroDePeano = I ifTrue: [ ^self previous].
	^self previous - unNumeroDePeano previous! !

!III class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:16'!
/ unNumerodePeano
	
	self = unNumerodePeano  ifTrue: [^I].
	^self - unNumerodePeano / unNumerodePeano + I.! !

!III class methodsFor: 'as yet unclassified' stamp: 'Cf 4/2/2019 10:33:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIII.
	previous := II.! !

!III class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:16'!
next

	next ifNil:
	[
		next _ self cloneNamed: (self name , 'I').
		next previous: self.
	].
	^next! !

!III class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:16'!
previous
	^previous! !

!III class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:17'!
previous: unNumeroDePeano
	previous := unNumeroDePeano! !

!III class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:17'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !


!classDefinition: #IIII category: #'Numeros De Peano'!
DenotativeObject subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros De Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: #'Numeros De Peano'!
IIII class
	instanceVariableNames: 'next previous'!

!IIII class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:17'!
* unNumerodePeano
	(unNumerodePeano = I) ifTrue: [^self]
	 ifFalse: [^self+(self*(unNumerodePeano -I))].! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:17'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:17'!
- unNumeroDePeano

	unNumeroDePeano = I ifTrue: [ ^self previous].
	^self previous - unNumeroDePeano previous! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:17'!
/ unNumerodePeano
	
	self = unNumerodePeano  ifTrue: [^I].
	^self - unNumerodePeano / unNumerodePeano + I.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'Cf 4/2/2019 10:33:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIII.
	previous := III.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:17'!
next

	next ifNil:
	[
		next _ self cloneNamed: (self name , 'I').
		next previous: self.
	].
	^next! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:17'!
previous
	^previous! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:17'!
previous: unNumeroDePeano
	previous := unNumeroDePeano! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:17'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !


!classDefinition: #IIIII category: #'Numeros De Peano'!
DenotativeObject subclass: #IIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros De Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIII class' category: #'Numeros De Peano'!
IIIII class
	instanceVariableNames: 'next previous'!

!IIIII class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:25'!
* unNumerodePeano
	(unNumerodePeano = I) ifTrue: [^self]
	 ifFalse: [^self+(self*(unNumerodePeano -I))].! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:25'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:25'!
- unNumeroDePeano

	unNumeroDePeano = I ifTrue: [ ^self previous].
	^self previous - unNumeroDePeano previous! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:25'!
/ unNumerodePeano
	
	self = unNumerodePeano  ifTrue: [^I].
	^self - unNumerodePeano / unNumerodePeano + I.! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'Cf 4/2/2019 10:33:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIII.
	previous := IIII.! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:25'!
next

	next ifNil:
	[
		next _ self cloneNamed: (self name , 'I').
		next previous: self.
	].
	^next! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:25'!
previous
	^previous! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:25'!
previous: unNumeroDePeano
	previous := unNumeroDePeano! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:25'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !


!classDefinition: #IIIIII category: #'Numeros De Peano'!
DenotativeObject subclass: #IIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros De Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIII class' category: #'Numeros De Peano'!
IIIIII class
	instanceVariableNames: 'next previous'!

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:25'!
* unNumerodePeano
	(unNumerodePeano = I) ifTrue: [^self]
	 ifFalse: [^self+(self*(unNumerodePeano -I))].! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:25'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:25'!
- unNumeroDePeano

	unNumeroDePeano = I ifTrue: [ ^self previous].
	^self previous - unNumeroDePeano previous! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:25'!
/ unNumerodePeano
	
	self = unNumerodePeano  ifTrue: [^I].
	^self - unNumerodePeano / unNumerodePeano + I.! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'Cf 4/2/2019 10:33:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIII.
	previous := IIIII.! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:25'!
next

	next ifNil:
	[
		next _ self cloneNamed: (self name , 'I').
		next previous: self.
	].
	^next! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:25'!
previous
	^previous! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:25'!
previous: unNumeroDePeano
	previous := unNumeroDePeano! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:25'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !


!classDefinition: #IIIIIII category: #'Numeros De Peano'!
DenotativeObject subclass: #IIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros De Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIII class' category: #'Numeros De Peano'!
IIIIIII class
	instanceVariableNames: 'next previous'!

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:25'!
* unNumerodePeano
	(unNumerodePeano = I) ifTrue: [^self]
	 ifFalse: [^self+(self*(unNumerodePeano -I))].! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:25'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:25'!
- unNumeroDePeano

	unNumeroDePeano = I ifTrue: [ ^self previous].
	^self previous - unNumeroDePeano previous! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:25'!
/ unNumerodePeano
	
	self = unNumerodePeano  ifTrue: [^I].
	^self - unNumerodePeano / unNumerodePeano + I.! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'Cf 4/2/2019 10:33:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIII.
	previous := IIIIII.! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:25'!
next

	next ifNil:
	[
		next _ self cloneNamed: (self name , 'I').
		next previous: self.
	].
	^next! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:25'!
previous
	^previous! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:25'!
previous: unNumeroDePeano
	previous := unNumeroDePeano! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:25'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !


!classDefinition: #IIIIIIII category: #'Numeros De Peano'!
DenotativeObject subclass: #IIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros De Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIII class' category: #'Numeros De Peano'!
IIIIIIII class
	instanceVariableNames: 'next previous'!

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:25'!
* unNumerodePeano
	(unNumerodePeano = I) ifTrue: [^self]
	 ifFalse: [^self+(self*(unNumerodePeano -I))].! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:25'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:25'!
- unNumeroDePeano

	unNumeroDePeano = I ifTrue: [ ^self previous].
	^self previous - unNumeroDePeano previous! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:25'!
/ unNumerodePeano
	
	self = unNumerodePeano  ifTrue: [^I].
	^self - unNumerodePeano / unNumerodePeano + I.! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'Cf 4/2/2019 10:33:44'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := IIIIIII.! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:25'!
next

	next ifNil:
	[
		next _ self cloneNamed: (self name , 'I').
		next previous: self.
	].
	^next! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:25'!
previous
	^previous! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:25'!
previous: unNumeroDePeano
	previous := unNumeroDePeano! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'Cf 3/30/2019 10:23:25'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	]! !

I initializeAfterFileIn!
II initializeAfterFileIn!
III initializeAfterFileIn!
IIII initializeAfterFileIn!
IIIII initializeAfterFileIn!
IIIIII initializeAfterFileIn!
IIIIIII initializeAfterFileIn!
IIIIIIII initializeAfterFileIn!