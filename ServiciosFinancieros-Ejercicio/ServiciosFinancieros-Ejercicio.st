!classDefinition: #NotEnoughFunds category: 'ServiciosFinancieros-Ejercicio'!
Error subclass: #NotEnoughFunds
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!


!classDefinition: #TransactionNotPresent category: 'ServiciosFinancieros-Ejercicio'!
Error subclass: #TransactionNotPresent
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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'iO 6/9/2022 16:25:22'!
test010FindTransferLeg
	| account account2 transfer1 transfer2 transfer3 counterpart|
	
	account := ReceptiveAccount new.	
	account2 := ReceptiveAccount new.	
	Deposit register: 100 * peso on: account.
	
	account2 := ReceptiveAccount new.			
	transfer1 := Transfer new register: 10 * peso from:account to:account2.
	transfer2 := Transfer new register: 20 * peso from:account to:account2.
	transfer3 := Transfer new register: 30 * peso from:account to:account2.
	
	counterpart := (transfer2 deposit) counterpart.

	self assert: counterpart value equals: 20*  peso.			
	self assert: account balance equals:   40 * peso.
	self assert: account2 balance equals: 60 * peso.

		
	
! !

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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'iO 6/7/2022 14:14:39'!
test08EmptyTransfer
	| account account2 transfer|
	
	account := ReceptiveAccount new.	
	account2 := ReceptiveAccount new.	
	
	Deposit register: 50 * peso on: account.		
		
	[ transfer := Transfer new register:0 from:account to:account. 
		]
			on: ValueNotValid 
			do: [ :anError | 
				self assert: account balance equals: 50 * peso.
				self assert: account2 balance equals: 0.
				].
	
		
	
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'iO 6/6/2022 20:34:39'!
test09Transfer100
	| account account2 transfer|
	
	account := ReceptiveAccount new.	
	Deposit register: 100 * peso on: account.
	account2 := ReceptiveAccount new.			
	transfer := Transfer new register: 100 * peso from:account to:account2.
	
	self assert: account balance equals: 0 * peso.
	self assert: account2 balance equals: 100 * peso.

		
	
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'iO 6/7/2022 13:59:27'!
test11PortfolioCuentasBalance
	| account account2 portfolio |
	
	account := ReceptiveAccount new.	
	Deposit register: 50 * peso on: account.

	account2 := ReceptiveAccount new.		
	Deposit register: 25 * peso on: account2.

	portfolio := Portfolio new.
	portfolio registerAccount: account.
	portfolio registerAccount: account2.
		
	self assert: (portfolio balance) equals: 75 * peso.


		
	
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'iO 6/9/2022 16:26:21'!
test12PortfolioVacio
	| portfolio |

	portfolio := Portfolio new.

	self assert: portfolio balance equals: 0 * peso.


		
	
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'iO 6/9/2022 15:41:44'!
test13CheckEveryTransaction
	| account account2 account3 portfolio allTransactions|
	
	allTransactions := OrderedCollection new.
	
	account := ReceptiveAccount new.	
	allTransactions add: (account transactions).
	Deposit register: 50 * peso on: account.

	account2 := ReceptiveAccount new.		
	allTransactions add: (account2 transactions).
	Deposit register: 25 * peso on: account2.

	portfolio := Portfolio new.
	portfolio registerAccount: account.
	portfolio registerAccount: account2.

	account3 := ReceptiveAccount new.	
	allTransactions add: (account3 transactions).
	Deposit register: 50 * peso on: account.
	
	self assertEveryTransaction:portfolio in:allTransactions.		
	self assert: (portfolio balance) equals: 125 * peso.


		
	
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'iO 6/9/2022 16:26:08'!
test14PortfolioMasPorfolio
	| account account2 account3 portfolio portfolio2 |
	
	account := ReceptiveAccount new.	
	Deposit register: 50 * peso on: account.

	account2 := ReceptiveAccount new.		
	Deposit register: 25 * peso on: account2.

	portfolio := Portfolio new.
	portfolio registerAccount: account.
	portfolio registerAccount: account2.

	account3 := ReceptiveAccount new.	
	Deposit register: 50 * peso on: account.

	portfolio2 := Portfolio new.
	portfolio2 registerAccount: account.
	portfolio2 registerAccount: account2.
	portfolio2 registerAccount: portfolio.
		
	self assert: (portfolio balance) equals: 125 * peso.


		
	
! !


!ReceptiveAccountTest methodsFor: 'helperMethods' stamp: 'iO 6/9/2022 15:31:00'!
assertEveryTransaction:portfolio in: allTransactions
	| portfolioTransactions |
	
	portfolioTransactions := portfolio transactions.
	
	allTransactions do: [ :transaction | (portfolioTransactions includes:transaction) ifFalse: [TransactionNotPresent new]. ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccountTest class' category: 'ServiciosFinancieros-Ejercicio'!
ReceptiveAccountTest class
	instanceVariableNames: ''!

!ReceptiveAccountTest class methodsFor: 'as yet unclassified' stamp: 'iO 6/9/2022 15:33:03'!
DoIt

| account account2 account3 portfolio allTransactions t|
	
	allTransactions := OrderedCollection new.
	
	account := ReceptiveAccount new.	
	t := (account transactions).
	allTransactions add: t.
	Deposit register: 50 * peso on: account.

	account2 := ReceptiveAccount new.		
	allTransactions add: (account2 transactions).
	Deposit register: 25 * peso on: account2.

	portfolio := Portfolio new.
	portfolio registerAccount: account.
	portfolio registerAccount: account2.

	account3 := ReceptiveAccount new.	
	"allTransactions add: (account3 transactions)."
	Deposit register: 50 * peso on: account.
	
	self assertEveryTransaction:portfolio in:allTransactions.		
	self assert: (portfolio balance) equals: 125 * peso.! !


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


!classDefinition: #DepositTransfer category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #DepositTransfer
	instanceVariableNames: 'counterpart value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!DepositTransfer methodsFor: 'as yet unclassified' stamp: 'iO 6/9/2022 16:21:49'!
counterpart
	^counterpart.! !

!DepositTransfer methodsFor: 'as yet unclassified' stamp: 'iO 6/6/2022 21:05:52'!
initializeFor: aValue

	value := aValue ! !

!DepositTransfer methodsFor: 'as yet unclassified' stamp: 'iO 6/6/2022 20:54:16'!
registerCounterpart: aCounterpart
	counterpart := aCounterpart! !

!DepositTransfer methodsFor: 'as yet unclassified' stamp: 'iO 6/7/2022 14:15:26'!
totalValue

	^ value! !

!DepositTransfer methodsFor: 'as yet unclassified' stamp: 'iO 6/7/2022 14:15:35'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DepositTransfer class' category: 'ServiciosFinancieros-Ejercicio'!
DepositTransfer class
	instanceVariableNames: ''!

!DepositTransfer class methodsFor: 'as yet unclassified' stamp: 'iO 6/6/2022 21:06:43'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Transfer
	instanceVariableNames: 'deposit withdraw'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'legs' stamp: 'iO 6/9/2022 15:43:38'!
deposit
	^deposit! !

!Transfer methodsFor: 'legs' stamp: 'iO 6/9/2022 15:43:51'!
withdraw
	^withdraw ! !


!Transfer methodsFor: 'creation' stamp: 'iO 6/5/2022 22:42:55'!
initializeFor:aWithdraw destiny:aDeposit
.
	withdraw := aWithdraw.
	deposit := aDeposit.! !

!Transfer methodsFor: 'creation' stamp: 'iO 6/7/2022 14:18:30'!
register: aValue from:originAccount to: destinyAccount
	
	aValue > 0 ifFalse:[ValueNotValid new].

	withdraw := WithdrawTransfer register:aValue on:originAccount .
	deposit := DepositTransfer register:aValue on:destinyAccount.
	
	withdraw registerCounterpart:deposit.
	deposit registerCounterpart: withdraw.
	
	"originAccount register: self.
	destinyAccount register: self."! !


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


!classDefinition: #WithdrawTransfer category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #WithdrawTransfer
	instanceVariableNames: 'counterpart value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!WithdrawTransfer methodsFor: 'as yet unclassified' stamp: 'iO 6/9/2022 16:21:33'!
counterpart
	^counterpart .! !

!WithdrawTransfer methodsFor: 'as yet unclassified' stamp: 'iO 6/6/2022 21:05:42'!
initializeFor: aValue

	value := aValue ! !

!WithdrawTransfer methodsFor: 'as yet unclassified' stamp: 'iO 6/6/2022 20:54:50'!
registerCounterpart: aCounterpart
	counterpart := aCounterpart.! !

!WithdrawTransfer methodsFor: 'as yet unclassified' stamp: 'iO 6/7/2022 14:16:09'!
totalValue

	^ value negated.! !

!WithdrawTransfer methodsFor: 'as yet unclassified' stamp: 'iO 6/7/2022 14:15:59'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'WithdrawTransfer class' category: 'ServiciosFinancieros-Ejercicio'!
WithdrawTransfer class
	instanceVariableNames: ''!

!WithdrawTransfer class methodsFor: 'as yet unclassified' stamp: 'iO 6/6/2022 21:06:52'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'cuentas'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'iO 6/7/2022 14:06:08'!
accounts
	^cuentas.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'iO 6/5/2022 23:27:48'!
balance
	^cuentas sum:[ :cuenta | cuenta balance ]  ifEmpty: [ 0 ].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'io 12/31/2020 21:09:19'!
hasRegistered: aTransaction
	cuentas do: [ :cuenta | (cuenta hasRegistered: aTransaction) ifTrue:[^true]].
	^false.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'iO 6/5/2022 23:24:38'!
initialize
	cuentas := OrderedCollection new.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'iO 6/7/2022 14:08:54'!
registerAccount: account
	(account isKindOf: Portfolio class) 
					ifTrue:[cuentas add:(account accounts)]
					ifFalse:[cuentas add:account].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'iO 6/9/2022 15:27:52'!
transactions
	| ret_value |
	ret_value := OrderedCollection new.
	cuentas do: [ :cuenta | ret_value add: (cuenta transactions )].
	^ ret_value .! !


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
