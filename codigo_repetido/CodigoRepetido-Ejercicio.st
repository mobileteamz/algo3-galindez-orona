!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'IO-MG 5/1/2022 20:34:06'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook deltaOfRunningCode |
	
	customerBook := CustomerBook new.
	deltaOfRunningCode := self calculateTimeForBlockExecution: [customerBook addCustomerNamed: 'John Lennon'.].
	
	self assert: deltaOfRunningCode < (50 * millisecond)! !

!CustomerBookTest methodsFor: 'testing' stamp: 'IO-MG 5/1/2022 20:35:40'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook deltaOfRunningCode paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	deltaOfRunningCode := self calculateTimeForBlockExecution: [customerBook removeCustomerNamed: paulMcCartney.].
	  
	self assert: deltaOfRunningCode < (100 * millisecond)
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'IO-MG 5/1/2022 22:20:33'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
	self checkWithBlock: [customerBook addCustomerNamed: ''] typeOfError: Error assertion: [		:anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'IO-MG 5/1/2022 22:21:24'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook |
			
	customerBook := CustomerBook new initializeForTestWithJohnLennon.
	
	self checkWithBlock: [customerBook removeCustomerNamed: 'Paul McCartney'.] typeOfError: NotFound assertion: [		:anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: 'John Lennon')].
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'IO-MG 5/1/2022 21:43:05'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook|
	
	customerBook := CustomerBook new initializeForTestWithSuspendedPaul.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 1 equals: customerBook numberOfSuspendedCustomers.
	self assert: 1 equals: customerBook numberOfCustomers.
	self assert: (customerBook includesCustomerNamed: 'Paul McCartney').
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'IO-MG 5/1/2022 21:42:51'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook |
	
	customerBook := CustomerBook new initializeForTestWithSuspendedPaul.
	customerBook removeCustomerNamed: 'Paul McCartney'.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 0 equals: customerBook numberOfSuspendedCustomers.
	self assert: 0 equals: customerBook numberOfCustomers.
	self deny: (customerBook includesCustomerNamed: 'Paul McCartney').


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'IO-MG 5/1/2022 22:21:34'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook |
			
	customerBook := CustomerBook new initializeForTestWithJohnLennon.
	
	self cantSuspendWithCustomerBook:customerBook  named: 'Ringo Starr'.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'IO-MG 5/1/2022 21:52:06'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook |
			
	customerBook := CustomerBook new initializeForTestWithJohnLennon.
	customerBook suspendCustomerNamed: 'John Lennon'.
	
	self cantSuspendWithCustomerBook:customerBook  named:  'John Lennon'.! !


!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'IO-MG 5/1/2022 20:34:26'!
calculateTimeForBlockExecution: codeBlock
	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	codeBlock value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	^(millisecondsAfterRunning-millisecondsBeforeRunning). ! !

!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'IO-MG 5/1/2022 21:50:15'!
cantSuspendWithCustomerBook: customerBook named: aCustomer
	[ customerBook suspendCustomerNamed: aCustomer.
		self fail ]
			on: CantSuspend 
			do: [ :anError | 
				self assert: customerBook numberOfCustomers = 1.
				self assert: (customerBook includesCustomerNamed: 'John Lennon') ]! !

!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'IO-MG 5/1/2022 22:20:22'!
checkWithBlock: blocktoTest typeOfError: type assertion: assertionToPerform
	
	 [blocktoTest]
		on: type 
		do: assertionToPerform! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !

!CustomerBook methodsFor: 'initialization' stamp: 'IO-MG 5/1/2022 21:44:04'!
initializeForTestWithJohnLennon
	| johnLennon |
	johnLennon := 'John Lennon'.
	
	self addCustomerNamed: johnLennon.! !

!CustomerBook methodsFor: 'initialization' stamp: 'IO-MG 5/1/2022 21:39:14'!
initializeForTestWithSuspendedPaul
	| paulMcCartney|
	paulMcCartney := 'Paul McCartney'.
	
	self addCustomerNamed: paulMcCartney.
	self suspendCustomerNamed: paulMcCartney.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'IO-MG 5/1/2022 21:10:14'!
removeCustomerNamed: aName 
 	| found |
	
	found := self removeIfPresentFromCollection:active  name:aName.
	found := (found or: [self removeIfPresentFromCollection: suspended name: aName]).
	
	found ifFalse: [^ NotFound signal]
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'as yet unclassified' stamp: 'IO-MG 5/1/2022 21:13:17'!
removeIfPresentFromCollection: aCollection name: aName
	| isPresent |
	isPresent := aCollection includes:aName.
	
	isPresent ifTrue: [aCollection remove:aName. ^ true].
	^ false
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
