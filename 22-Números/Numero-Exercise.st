!classDefinition: #NumeroTest category: #'Numero-Exercise'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:11'!
test01isCeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:12'!
test02isCeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:20'!
test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:38'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:50'!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:57'!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:59'!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:40'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:43'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:47:26'!
test27EnteroSubstractsEnteroCorrectly

	self assert: two - one equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:47:41'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: twoFifth - oneFifth equals: oneFifth.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:00'!
test29EnteroSubstractsFraccionCorrectly

	self assert: one - oneHalf equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:05'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: sixFifth - one equals: oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:08'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: threeHalfs - oneHalf equals: one.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:48'!
test32SubstractingSameEnterosReturnsZero

	self assert: one - one equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:01'!
test33SubstractingSameFraccionesReturnsZero

	self assert: oneHalf - oneHalf equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:14'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: one - fiveHalfs equals: negativeThreeHalfs.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:23'!
test35FibonacciZeroIsOne

	self assert: zero fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:32'!
test36FibonacciOneIsOne

	self assert: one fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:39'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: four fibonacci equals: five.
	self assert: three fibonacci equals: three. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:47'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Entero negativeFibonacciErrorDescription ].! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:55'!
test39NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:03'!
test40NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOne / two.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: #'Numero-Exercise'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: #'Numero-Exercise'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2016 22:45'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 4/8/2019 02:58:13'!
invalidNumberTypeErrorDescription
	^ 'Tipo de número inválido'! !


!classDefinition: #Entero category: #'Numero-Exercise'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Entero methodsFor: 'arithmetic operations' stamp: 'Cf 4/10/2019 08:26:05'!
* aMultiplier 
	"
	^self class with: value * aMultiplier integerValue"
	|isAnEntero|
	
	isAnEntero := (aMultiplier class  = Entero) ifTrue: 1 ifFalse: 2 .
	
	^ self multiplicaciónDeEnteroCon: isAnEntero and: aMultiplier.
	
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'Cf 4/11/2019 10:49:48'!
+ anAdder 
	
	"^self class with: value + anAdder integerValue"
	|isAnEntero|
	
	isAnEntero := (anAdder class  = Entero) ifTrue: 1 ifFalse: 2 .
	
	^self sumaDeEnteroCon: isAnEntero and: anAdder .
	
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'Cf 4/11/2019 10:50:52'!
- aSubtrahend 
	
	"^ self class with: value - aSubtrahend integerValue."
	|isAnEntero|
	
	isAnEntero := (aSubtrahend class  = Entero) ifTrue: 1 ifFalse: 2 .
	
	^self restaDeEnteroCon: isAnEntero and: aSubtrahend .! !

!Entero methodsFor: 'arithmetic operations' stamp: 'Cf 4/10/2019 09:02:47'!
/ aDivisor 
	"
	^Fraccion with: self over: aDivisor"
	
	|isAnEntero|
	
	isAnEntero := (aDivisor class  = Entero) ifTrue: 1 ifFalse: 2 .
	
	^self divisionDeEnterosCon: isAnEntero and: aDivisor.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 21:55'!
// aDivisor 
	
	^self class with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations' stamp: 'Cf 4/10/2019 09:11:00'!
divisionDeEnterosCon: aTypeOfNumero and: aNumero
	|typesOfDivitions divisionConEnteros divisionConFracciones|
	divisionConEnteros := [self divisionDeEnterosConEnteros: aNumero ].
	divisionConFracciones := [self divisionDeEnterosConFracciones: aNumero ].
	typesOfDivitions := Array with: divisionConEnteros with: divisionConFracciones .
	^(typesOfDivitions at: aTypeOfNumero ) value. ! !

!Entero methodsFor: 'arithmetic operations' stamp: 'Cf 4/10/2019 09:08:25'!
divisionDeEnterosConEnteros: aNumero
	^Fraccion with: self over: aNumero .! !

!Entero methodsFor: 'arithmetic operations' stamp: 'Cf 4/11/2019 10:11:44'!
divisionDeEnterosConFracciones: aNumero
	|aNumeroInvertido|
	
	aNumeroInvertido := Fraccion new.
	
	aNumeroInvertido initializeWith: (aNumero denominator ) over: (aNumero numerator ).
	
	^self* aNumeroInvertido .! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HAW 9/24/2018 08:47:50'!
fibonacci

	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.
	
	self isNegative ifTrue: [self error: Entero negativeFibonacciErrorDescription ].	
	(self isZero or: [self isOne]) ifTrue: [^one].
	
	^ (self - one) fibonacci + (self - two) fibonacci
		! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 21:00'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue)! !

!Entero methodsFor: 'arithmetic operations' stamp: 'Cf 4/10/2019 08:31:10'!
multiplicacionConEnteros: aMultiplier
^self class with: value * aMultiplier integerValue.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'Cf 4/10/2019 08:43:47'!
multiplicacionConFracciones: aNumero
	|nuevoNumerador resultado|
	
	nuevoNumerador := self * aNumero numerator.
	
	resultado := Fraccion  new.
	resultado initializeWith: nuevoNumerador over: (aNumero denominator ).
	
	^resultado.
	
	
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'Cf 4/10/2019 08:39:16'!
multiplicaciónDeEnteroCon:aTypeOfNumero and: aNumero
	|typesOfMultiplication multiplicacionConEnteros multiplicacionConFracciones|
	multiplicacionConEnteros := [self multiplicacionConEnteros: aNumero ].
	multiplicacionConFracciones := [self multiplicacionConFracciones: aNumero ].
	typesOfMultiplication := Array with: multiplicacionConEnteros with: multiplicacionConFracciones .
	^(typesOfMultiplication at: aTypeOfNumero ) value. ! !

!Entero methodsFor: 'arithmetic operations' stamp: 'Cf 4/11/2019 10:54:31'!
restaDeEnteroCon:aTypeOfNumero and: aNumero
	|typesOfSubstraction restaConEnteros restaDeEnterosyFracciones|
	restaConEnteros := [self restaDeEnterosConEnteros: aNumero ].
	restaDeEnterosyFracciones := [self restaDeEnterosConFracciones: aNumero ].
	typesOfSubstraction := Array with: restaConEnteros with: restaDeEnterosyFracciones .
	^(typesOfSubstraction at: aTypeOfNumero ) value. ! !

!Entero methodsFor: 'arithmetic operations' stamp: 'Cf 4/11/2019 10:53:38'!
restaDeEnterosConEnteros: aNumero
	^ self class with: value - aNumero integerValue.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'Cf 4/11/2019 10:56:46'!
restaDeEnterosConFracciones: aNumero
	|selfComoFraccion |
	
	selfComoFraccion := Fraccion new.
	
	selfComoFraccion initializeWith: (self*(aNumero denominator )) over: (self*(aNumero denominator )).
	
	^selfComoFraccion -aNumero .! !

!Entero methodsFor: 'arithmetic operations' stamp: 'Cf 4/9/2019 19:02:43'!
sumaDeEnteroCon: aTypeOfNumber and: aNumber
	|typesOfAdding sumaConEnteros sumaDeEnterosyFracciones|
	sumaConEnteros := [self sumaDeEnterosConEnteros: aNumber ].
	sumaDeEnterosyFracciones := [self sumaDeEnterosConFracciones: aNumber ].
	typesOfAdding := Array with: sumaConEnteros with: sumaDeEnterosyFracciones .
	^(typesOfAdding at: aTypeOfNumber ) value. ! !

!Entero methodsFor: 'arithmetic operations' stamp: 'Cf 4/9/2019 18:15:26'!
sumaDeEnterosConEnteros:aEntero

	^self class with: value + aEntero integerValue! !

!Entero methodsFor: 'arithmetic operations' stamp: 'Cf 4/9/2019 18:24:02'!
sumaDeEnterosConFracciones: aFraccion
	|selfAsFraction selfNumeratorAndDenominator|
	selfAsFraction := Fraccion new.
	selfNumeratorAndDenominator := self*(aFraccion denominator ).
	selfAsFraction initializeWith: selfNumeratorAndDenominator over: selfNumeratorAndDenominator.
	^ selfAsFraction  + aFraccion.! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 20:09'!
initalizeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'value' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'NR 9/23/2018 22:17:55'!
isNegative
	
	^value < 0! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:14'!
isOne
	
	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:12'!
isZero
	
	^value = 0! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: #'Numero-Exercise'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'NR 4/8/2019 02:57:57'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no está definido aquí para Enteros Negativos'! !

!Entero class methodsFor: 'instance creation' stamp: 'HernanWilkinson 5/7/2016 22:53'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	^self new initalizeWith: aValue! !


!classDefinition: #Fraccion category: #'Numero-Exercise'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'Cf 4/10/2019 08:54:33'!
* aMultiplier 
	
	"^(numerator * aMultiplier numerator) / (denominator * aMultiplier denominator)"
	|isAFracction|
	
	isAFracction := (aMultiplier class  = Fraccion ) ifTrue: 1 ifFalse: 2 .
	
	^ self multiplicacionDeFraccionCon: isAFracction and: aMultiplier.
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'Cf 4/9/2019 19:06:09'!
+ anAdder 
	"
	| newNumerator newDenominator |
	
	newNumerator := (numerator * anAdder denominator) + (denominator * anAdder numerator).
	newDenominator := denominator * anAdder denominator.
	
	^newNumerator / newDenominator "
	|isAfraccion|
	
	isAfraccion := (anAdder class  = Fraccion ) ifTrue: 1 ifFalse: 2 .
	
	^self sumaDeDosNumeros: isAfraccion and: anAdder .! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'Cf 4/11/2019 11:01:07'!
- aSubtrahend 
	"
	| newNumerator newDenominator |
	
	newNumerator := (numerator * aSubtrahend denominator) - (denominator * aSubtrahend numerator).
	newDenominator := denominator * aSubtrahend denominator.
	
	^newNumerator / newDenominator 
	"
	|isFraccion|
	
	isFraccion := (aSubtrahend class  = Fraccion ) ifTrue: 1 ifFalse: 2 .
	
	^self restaDeFraccionCon: isFraccion and: aSubtrahend .! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'Cf 4/11/2019 10:05:14'!
/ aDivisor 
	
	"^(numerator * aDivisor denominator) / (denominator * aDivisor numerator)"
	
	|isAFraccion|
	
	isAFraccion := (aDivisor class  = Entero ) ifTrue: 1 ifFalse: 2 .
	
	^self divisionDeFraccionCon: isAFraccion and: aDivisor.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'Cf 4/11/2019 10:18:08'!
divisionDeFraccionCon: aTypeOfNumero and: aNumero
	|typesOfDivitions divisionConEnteros divisionConFracciones|
	divisionConEnteros := [self divisionDeFraccionConEntero: aNumero ].
	divisionConFracciones := [self divisionDeFraccionConFraccion: aNumero ].
	typesOfDivitions := Array with: divisionConEnteros with: divisionConFracciones .
	^(typesOfDivitions at: aTypeOfNumero ) value. 
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'Cf 4/11/2019 10:20:39'!
divisionDeFraccionConEntero:aNumero
	|aNumeroInvertido|
	
	aNumeroInvertido := Fraccion new.
	
	aNumeroInvertido initializeWith: (1 ) over: (aNumero ).
	
	^self* aNumeroInvertido .! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'Cf 4/11/2019 10:36:03'!
divisionDeFraccionConFraccion: aNumero
		|nuevoNumerador nuevoDenominador resultado|
		nuevoNumerador :=numerator * aNumero denominator.
		nuevoDenominador :=denominator * aNumero numerator.
		resultado := Fraccion new.
		resultado initializeWith: nuevoNumerador over: nuevoDenominador .
		^resultado .! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'Cf 4/11/2019 10:46:45'!
multiplicacionConFraccion:aNumero

	|nuevoNumerador nuevoDenominador resultado|
	nuevoNumerador :=(numerator * (aNumero numerator)).
	nuevoDenominador :=(denominator * (aNumero denominator)).
	resultado := Fraccion new.
	resultado initializeWith: nuevoNumerador  over: nuevoDenominador .
	^resultado.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'Cf 4/10/2019 08:56:36'!
multiplicacionDeFraccionCon: aTypeOfNumero and: aNumero
	|typesOfMultiplication multiplicacionConEnteros multiplicacionConFracciones|
	multiplicacionConEnteros := [aNumero * self].
	multiplicacionConFracciones := [self multiplicacionConFraccion: aNumero ].
	typesOfMultiplication := Array with: multiplicacionConFracciones with: multiplicacionConEnteros .
	^(typesOfMultiplication at: aTypeOfNumero ) value. ! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'Cf 4/11/2019 11:09:37'!
restaDeFraccionCon: aTypeOfNumero and: aNumero

	|typesOfSubstraction restaConEnteros restaDeFraccionesConEnteros|
	restaConEnteros := [self restaDeFraccionConEnteros: aNumero ].
	restaDeFraccionesConEnteros := [self restaDeFraccionConFraccion: aNumero ].
	typesOfSubstraction := Array with: restaDeFraccionesConEnteros with: restaConEnteros .
	^(typesOfSubstraction at: aTypeOfNumero ) value. ! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'Cf 4/11/2019 11:12:14'!
restaDeFraccionConEnteros:aNumero
	|aNumeroComoFraccion |
	
	aNumeroComoFraccion := Fraccion new.
	
	aNumeroComoFraccion initializeWith: ((self denominator )*aNumero ) over: ((self denominator )* aNumero ).
	
	^self - aNumeroComoFraccion .! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'Cf 4/11/2019 11:04:57'!
restaDeFraccionConFraccion:aNumero
| newNumerator newDenominator |
	
	newNumerator := (numerator * aNumero denominator) - (denominator * aNumero numerator).
	newDenominator := denominator * aNumero denominator.
	
	^newNumerator / newDenominator ! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'Cf 4/9/2019 19:30:52'!
sumaConFracciones: aFraccion
| newNumerator newDenominator |
	
	newNumerator := (numerator * aFraccion denominator) + (denominator * aFraccion numerator).
	newDenominator := denominator * aFraccion denominator.
	
	^newNumerator / newDenominator! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'Cf 4/9/2019 19:44:07'!
sumaDeDosNumeros:typeOfNumber and:aNumber
|typesOfAdding sumaConEnteros sumaConFracciones|
	sumaConEnteros := [aNumber + self ].
	sumaConFracciones := [ self sumaConFracciones: aNumber].
	typesOfAdding := Array with: sumaConFracciones with: sumaConEnteros .
	^(typesOfAdding at: typeOfNumber ) value. ! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 22:54'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: #'Numero-Exercise'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'NR 9/23/2018 23:45:19'!
with: aDividend over: aDivisor

	| greatestCommonDivisor numerator denominator |
	
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend isZero ifTrue: [ ^aDividend ].
	
	aDivisor isNegative ifTrue:[ ^aDividend negated / aDivisor negated].
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^self new initializeWith: numerator over: denominator
	! !
