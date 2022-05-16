!classDefinition: #OOStackTest category: 'Stack-Exercise'!
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

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'MG 5/12/2022 20:34:42'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
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

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
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


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'testStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'IO-MG 5/15/2022 23:34:27'!
assertStackCreationWith: aCollection sentenceToFind: aSentenceToFind withSearchResults: expectedResults
	| stack sentenceFinder searchResults i|
	stack := OOStack new.
	
	aCollection do:[ :element |
		stack push: element.																								
	].
	
	sentenceFinder := SentenceFinderByPrefix new initWithStack: stack. 
	searchResults := sentenceFinder find:aSentenceToFind.
	
	self assert: (searchResults size)= (expectedResults size).
	i := 1.
	
	searchResults do:[ :result |
		self assert: result = (expectedResults at: i).
		i := i + 1.
		].! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'IO-MG 5/15/2022 22:44:44'!
test01TestearCasoEnunciado
	| sentenceFinder searchResults|
	self setup.
	
	sentenceFinder := SentenceFinderByPrefix new initWithStack: testStack. 
	searchResults := sentenceFinder find:'Wint'.
	
	self assert: (searchResults size)=1.
	self assert: (searchResults at:1) = 'Winter is Here'.
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'IO-MG 5/15/2022 22:48:44'!
test02StackVacio
	| stackVacio sentenceFinder searchResults |
	
	stackVacio := OOStack new.
	sentenceFinder := SentenceFinderByPrefix new initWithStack: stackVacio. 	
	searchResults := sentenceFinder find:'Wint'.
	
	self assert: (stackVacio isEmpty)=true.
	self assert: (searchResults size) = 0.
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'IO-MG 5/15/2022 22:49:35'!
test03BusquedaIncorrecta
	| sentenceFinder searchResults|
	self setup.
	
	sentenceFinder := SentenceFinderByPrefix new initWithStack: testStack. 
	searchResults := sentenceFinder find:'Nacho'.
	
	self assert: (searchResults size)=0.
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'IO-MG 5/15/2022 23:23:55'!
test04MultipleSearch
	| texts answers|
	
	texts := OrderedCollection with:'Winter is comming' with:'Winning is everything' with:'The winds of Winter' with:'Winter is Here'.
	answers := OrderedCollection with:'Winter is Here' with:'Winning is everything' with:'Winter is comming'.
	
	self assertStackCreationWith:texts  sentenceToFind:'Win'  withSearchResults: answers.! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'IO-MG 5/15/2022 23:32:33'!
test05EstiloCamello	
	| texts answers|
	
	texts := OrderedCollection with:'camelCase' with:'NeXT' with:'Nextstep' with:'nextdoor neighbors'.
	answers := OrderedCollection with:'Nextstep' with:'NeXT'.
	
	self assertStackCreationWith:texts  sentenceToFind:'Ne'  withSearchResults: answers.! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'IO-MG 5/15/2022 23:32:20'!
test06MultiplesMayusculas
	| texts answers|
	
	texts := OrderedCollection with:'WINNERS don use drugs' with:'Winning is everything' with:'The winds of Winter' with:'Winter is Here' with:'WINDOWS 95'.
	answers := OrderedCollection with:'WINDOWS 95' with:'WINNERS don use drugs'.
	
	self assertStackCreationWith:texts  sentenceToFind:'WIN'  withSearchResults: answers.! !


!SentenceFinderByPrefixTest methodsFor: 'Helpers' stamp: 'IO-MG 5/15/2022 21:58:02'!
setup
	| newStack sentenceFinder|
	newStack := OOStack new.
	newStack push: 'winter is comming'.
	newStack push: 'winning is everything'.
	newStack push: 'The winds of Winter'.
	newStack push: 'Winter is Here'.
	testStack := newStack.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefixTest class' category: 'Stack-Exercise'!
SentenceFinderByPrefixTest class
	instanceVariableNames: ''!

!SentenceFinderByPrefixTest class methodsFor: 'as yet unclassified' stamp: 'IO-MG 5/15/2022 21:01:35'!
DoIt

| sentence result v|

	sentence := SentenceFinderByPrefix new.
	result := sentence find:'Wint'.
	result := result.
	
	self assert: (result size)=2.
	v := (result at:1).
	self assert: (v = 'Winter is Here').! !


!classDefinition: #Nodo category: 'Stack-Exercise'!
Object subclass: #Nodo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Nodo methodsFor: 'accessing' stamp: 'IO-MG 5/16/2022 12:51:10'!
init
	self subclassResponsability.! !

!Nodo methodsFor: 'accessing' stamp: 'IO-MG 5/16/2022 12:51:19'!
pop
	self subclassResponsability.! !

!Nodo methodsFor: 'accessing' stamp: 'IO-MG 5/16/2022 12:51:23'!
top
	self subclassResponsability.! !


!Nodo methodsFor: 'inspecting' stamp: 'IO-MG 5/16/2022 12:51:45'!
isEmpty
	self subclassResponsability.! !


!classDefinition: #NodoNoVacio category: 'Stack-Exercise'!
Nodo subclass: #NodoNoVacio
	instanceVariableNames: 'dato siguiente'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NodoNoVacio methodsFor: 'accessing' stamp: 'MG 5/12/2022 19:54:28'!
initWithStack: unStack andWithDato: unDato
	siguiente := unStack.
	dato := unDato.! !

!NodoNoVacio methodsFor: 'accessing' stamp: 'MG 5/12/2022 19:53:02'!
pop
	^dato.! !

!NodoNoVacio methodsFor: 'accessing' stamp: 'MG 5/12/2022 20:03:02'!
siguiente
	^siguiente.! !


!NodoNoVacio methodsFor: 'inspecting' stamp: 'MG 5/12/2022 20:02:27'!
isEmpty
	^false.! !

!NodoNoVacio methodsFor: 'inspecting' stamp: 'MG 5/12/2022 19:53:44'!
top
	^dato.! !


!classDefinition: #NodoVacio category: 'Stack-Exercise'!
Nodo subclass: #NodoVacio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NodoVacio methodsFor: 'inspecting' stamp: 'MG 5/12/2022 20:02:22'!
isEmpty
	^true.! !


!NodoVacio methodsFor: 'accessing' stamp: 'MG 5/12/2022 20:30:41'!
pop
	self class signalCustomerNameCannotBeEmpty.! !

!NodoVacio methodsFor: 'accessing' stamp: 'MG 5/12/2022 19:49:00'!
siguiente
	^nil.! !

!NodoVacio methodsFor: 'accessing' stamp: 'MG 5/12/2022 20:33:59'!
top
	self class signalCustomerNameCannotBeEmpty.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NodoVacio class' category: 'Stack-Exercise'!
NodoVacio class
	instanceVariableNames: ''!

!NodoVacio class methodsFor: 'as yet unclassified' stamp: 'MG 5/12/2022 20:32:45'!
signalCustomerNameCannotBeEmpty 
	self error: OOStack stackEmptyErrorDescription.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'contenedor size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'IO-MG 5/15/2022 19:59:57'!
contenedor
	^contenedor.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'IO-MG 5/15/2022 20:37:09'!
initialize
	contenedor := NodoVacio new.
	size := 0.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'MG 5/12/2022 20:02:00'!
isEmpty
	^contenedor isEmpty.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'MG 5/12/2022 20:09:27'!
pop
	|contenedorAnterior|
	contenedorAnterior := contenedor pop.
	contenedor := contenedor siguiente.
	^contenedorAnterior.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'IO-MG 5/15/2022 20:37:00'!
push: anElement
	|nuevoElemento|
	nuevoElemento := NodoNoVacio new initWithStack:contenedor andWithDato:anElement.
	contenedor := nuevoElemento.
	size := size + 1.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'MG 5/11/2022 17:09:44'!
signalCustomerNameCannotBeEmpty 
	self error: self class stackEmptyErrorDescription! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'MG 5/12/2022 20:37:13'!
size
	^size.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'MG 5/11/2022 17:10:16'!
stackEmptyErrorDescription
	^ 'Stack is Empty'! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'MG 5/12/2022 20:40:17'!
top
	^contenedor top.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'init' stamp: 'IO-MG 5/15/2022 21:47:43'!
initWithStack: aStack
	stack := aStack.! !


!SentenceFinderByPrefix methodsFor: 'conversion' stamp: 'IO-MG 5/15/2022 22:32:26'!
convertStack: aStack intoCollection:aCollection	
	aStack isEmpty ifTrue: [^aCollection.].
	aCollection add:aStack .
	^self convertStack:(aStack siguiente) intoCollection:aCollection.! !


!SentenceFinderByPrefix methodsFor: 'search' stamp: 'IO-MG 5/15/2022 23:17:43'!
find: aSentence
	| newStack ret_value|
	newStack := stack.	
	^self searchInStack: newStack aSentence: aSentence.! !

!SentenceFinderByPrefix methodsFor: 'search' stamp: 'IO-MG 5/15/2022 22:05:06'!
findVersionAlternativa: aSentence
	| aCollection ret_value|
	
	aCollection := OrderedCollection new.
	ret_value := OrderedCollection new.
	
	self convertStack:(stack contenedor) intoCollection: aCollection.
	
	aCollection do: [:aNode | 
		(aNode find:aSentence) ifTrue: [
			ret_value add:aNode top.
			].    
		].
	
	^ret_value.! !

!SentenceFinderByPrefix methodsFor: 'search' stamp: 'IO-MG 5/15/2022 23:14:22'!
searchInStack: aStack aSentence: aSentence
	| ret_value |
	ret_value := OrderedCollection new.
	
	(aStack size) timesRepeat:[	
		((aStack top) beginsWith: aSentence) ifTrue: [
			ret_value add:(aStack top).
			].
		aStack pop	.	
		].
	
	^ret_value.! !
