!classDefinition: #NotEnoughFunds category: 'ServiciosFinancieros-Ejercicio'!
Error subclass: #NotEnoughFunds
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!


!classDefinition: #ValueNotValid category: 'ServiciosFinancieros-Ejercicio'!
Error subclass: #ValueNotValid
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'iO 6/5/2022 23:10:15'!
test08EmptyTransfer
	| account account2 |
	
	account := ReceptiveAccount new.	
	Deposit register: 50 * peso on: account.
	account2 := ReceptiveAccount new.	
		
	[ account executeTransferToAccount:account2  value:0. 
		]
			on: ValueNotValid 
			do: [ :anError | 
				self assert: account balance equals: 50 * peso.
				self assert: account2 balance equals: 0.
				].
	
		
	
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'iO 6/5/2022 23:11:32'!
test09Transfer100
	| account account2 |
	
	account := ReceptiveAccount new.	
	Deposit register: 100 * peso on: account.
	account2 := ReceptiveAccount new.			
	account executeTransferToAccount:account2  value:100 * peso. 
	
	self assert: account balance equals: 0 * peso.
	self assert: account2 balance equals: 100 * peso.

		
	
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'iO 6/5/2022 23:25:41'!
test10PortfolioVacio
	| account account2 portfolio |
	
	account := ReceptiveAccount new.	
	Deposit register: 50 * peso on: account.
	account2 := ReceptiveAccount new.		

	portfolio := Portfolio new.
	portfolio registerAccount: account.
	portfolio registerAccount: account2.
	
	self assert: portfolio balance equals: 0 * peso.


		
	
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'iO 6/5/2022 23:28:59'!
test11CuentasBalance
	| account account2 portfolio val |
	
	account := ReceptiveAccount new.	
	Deposit register: 50 * peso on: account.

	account2 := ReceptiveAccount new.		
	Deposit register: 25 * peso on: account2.

	portfolio := Portfolio new.
	portfolio registerAccount: account.
	portfolio registerAccount: account2.
	
	val := portfolio balance.
	
	val := val.
	
	self assert: (portfolio balance) equals: 75 * peso.


		
	
! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'iO 6/5/2022 22:28:11'!
totalValue

	^ value! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'iO 6/5/2022 22:28:23'!
totalValue

	^ value negated.! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'cuentas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'iO 6/5/2022 23:27:48'!
balance
	^cuentas sum:[ :cuenta | cuenta balance ]  ifEmpty: [ 0 ].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'iO 6/5/2022 23:24:38'!
initialize
	cuentas := OrderedCollection new.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'iO 6/5/2022 23:24:49'!
registerAccount: account
	cuentas add:account.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions transfers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'iO 6/5/2022 22:43:11'!
initialize

	transactions := OrderedCollection new.
	transfers := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'iO 6/5/2022 22:28:42'!
balance

	^transactions sum: [ :aTransaction | aTransaction totalValue ] ifEmpty: [ 0 ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'iO 6/5/2022 23:15:37'!
executeTransferToAccount: aDestinyAccount  value: aValue
	| deposit widthdraw newTransfer|
	
	aValue > 0 ifFalse:[ValueNotValid new].
	(aValue > (self balance)) ifTrue:[NotEnoughFunds new].

	widthdraw := Withdraw new initializeFor:aValue.	
	deposit := Deposit new initializeFor: aValue.
	
	newTransfer := Transfer new initializeFor:widthdraw destiny:deposit.
	transfers add:newTransfer.
	
	self register: widthdraw. 
	aDestinyAccount register:deposit. " <------- ojo con eso de la Romper Encapsulamiento"! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !



!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'deposit withdraw'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'nil' stamp: 'iO 6/5/2022 22:42:55'!
initializeFor:aWithdraw destiny:aDeposit
.
	withdraw := aWithdraw.
	deposit := aDeposit.! !
