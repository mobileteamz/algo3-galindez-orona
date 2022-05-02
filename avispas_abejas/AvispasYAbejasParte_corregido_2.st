!classDefinition: #Avispa category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #Avispa
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Avispa class' category: 'AvispasYAbejasParte2'!
Avispa class
	instanceVariableNames: 'orugas huevos polillas'!

!Avispa class methodsFor: 'as yet unclassified' stamp: 'IO-MG 4/21/2022 20:13:03'!
agregarOruga
	orugas := orugas + 1.! !

!Avispa class methodsFor: 'as yet unclassified' stamp: 'IO-MG 4/21/2022 20:29:53'!
agregarPolilla
	polillas := polillas + 1.! !

!Avispa class methodsFor: 'as yet unclassified' stamp: 'IO-MG 4/21/2022 20:15:03'!
cantidadDeOrugas
	^ orugas! !

!Avispa class methodsFor: 'as yet unclassified' stamp: 'IO-MG 4/21/2022 20:15:46'!
cantidadOrugas
	^ orugas! !

!Avispa class methodsFor: 'as yet unclassified' stamp: 'IO-MG 4/21/2022 20:28:15'!
cantidadPolillas
	^ polillas.! !

!Avispa class methodsFor: 'as yet unclassified' stamp: 'IO-MG 4/24/2022 21:40:13'!
dameCantidadHuevos
	^ huevos.! !

!Avispa class methodsFor: 'as yet unclassified' stamp: 'IO-MG 4/21/2022 20:30:15'!
iniciar
	huevos := 0.
	orugas := 0.
	polillas := 0.
	! !

!Avispa class methodsFor: 'as yet unclassified' stamp: 'IO-MG 4/21/2022 20:32:55'!
intentarReproducirse
	orugas > 0 ifTrue: [huevos := huevos + 1. orugas := orugas -1].
	polillas > 0 ifTrue: [polillas := polillas - 1].! !

!Avispa class methodsFor: 'as yet unclassified' stamp: 'IO-MG 4/24/2022 22:44:40'!
perderHuevo
	(huevos > 0) ifTrue: [	huevos := huevos - 1. ^ true].
	^ false.
! !


!Avispa class methodsFor: '--** private fileout/in **--' stamp: 'IO-MG 4/27/2022 18:54:55'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	orugas := 0.
	huevos := 0.
	polillas := 0.! !


!classDefinition: #AvispaLara category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #AvispaLara
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaLara class' category: 'AvispasYAbejasParte2'!
AvispaLara class
	instanceVariableNames: 'avispaOrnella avispaOriana avispaPolly huevos'!

!AvispaLara class methodsFor: 'as yet unclassified' stamp: 'IO-MG 4/24/2022 22:49:52'!
dameCantidadHuevos
	^ huevos.! !

!AvispaLara class methodsFor: 'as yet unclassified' stamp: 'IO-MG 4/24/2022 22:40:01'!
iniciarCon:avispaO yCon:avispaP yTambien:avispaOrn
	huevos := 0.

	avispaOriana := avispaO.
	avispaPolly := avispaP.
	avispaOrnella := avispaOrn.
	! !

!AvispaLara class methodsFor: 'as yet unclassified' stamp: 'IO-MG 4/24/2022 22:48:12'!
intentarReproducirse
	| cant |
	cant := 0.

	avispaOrnella perderHuevo ifTrue: [cant := cant + 1].
	avispaPolly perderHuevo ifTrue: [cant := cant + 1].
	avispaOriana perderHuevo ifTrue: [cant := cant + 1].
	huevos := huevos + cant.! !


!AvispaLara class methodsFor: '--** private fileout/in **--' stamp: 'IO-MG 4/27/2022 18:54:55'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	avispaOrnella := AvispaOriana.
	avispaOriana := AvispaOriana.
	avispaPolly := Avispa.
	huevos := 0.! !


!classDefinition: #AvispaOriana category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #AvispaOriana
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AvispaOriana class' category: 'AvispasYAbejasParte2'!
AvispaOriana class
	instanceVariableNames: 'orugas huevos polillas'!

!AvispaOriana class methodsFor: 'as yet unclassified' stamp: 'IO-MG 4/24/2022 21:46:43'!
agregarOruga
	orugas := orugas + 1.! !

!AvispaOriana class methodsFor: 'as yet unclassified' stamp: 'IO-MG 4/24/2022 21:46:43'!
agregarPolilla
	polillas := polillas + 1.! !

!AvispaOriana class methodsFor: 'as yet unclassified' stamp: 'IO-MG 4/24/2022 21:46:43'!
cantidadDeOrugas
	^ orugas! !

!AvispaOriana class methodsFor: 'as yet unclassified' stamp: 'IO-MG 4/24/2022 21:46:43'!
cantidadOrugas
	^ orugas! !

!AvispaOriana class methodsFor: 'as yet unclassified' stamp: 'IO-MG 4/24/2022 21:46:43'!
cantidadPolillas
	^ polillas.! !

!AvispaOriana class methodsFor: 'as yet unclassified' stamp: 'IO-MG 4/24/2022 21:46:43'!
dameCantidadHuevos
	^ huevos.! !

!AvispaOriana class methodsFor: 'as yet unclassified' stamp: 'IO-MG 4/24/2022 21:46:43'!
iniciar
	huevos := 0.
	orugas := 0.
	polillas := 0.
	! !

!AvispaOriana class methodsFor: 'as yet unclassified' stamp: 'IO-MG 4/24/2022 21:46:43'!
intentarReproducirse
	orugas > 0 ifTrue: [huevos := huevos + 1. orugas := orugas -1].
	polillas > 0 ifTrue: [polillas := polillas - 1].! !

!AvispaOriana class methodsFor: 'as yet unclassified' stamp: 'IO-MG 4/24/2022 22:47:21'!
perderHuevo
	(huevos > 0) ifTrue: [	huevos := huevos - 1. ^ true].
	^ false.
! !


!AvispaOriana class methodsFor: '--** private fileout/in **--' stamp: 'IO-MG 4/27/2022 18:54:55'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	orugas := 0.
	huevos := 0.
	polillas := 0.! !


!classDefinition: #Habitat category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #Habitat
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Habitat class' category: 'AvispasYAbejasParte2'!
Habitat class
	instanceVariableNames: 'avispaLara avispaOriana huevos avispaPolly avispaOrnella'!

!Habitat class methodsFor: 'Info' stamp: 'IO-MG 4/24/2022 22:08:57'!
cantidadDeHuevosDeAvispas
	^ self laAvispaOriana dameCantidadHuevos + avispaPolly dameCantidadHuevos.! !

!Habitat class methodsFor: 'Info' stamp: 'IO-MG 4/24/2022 22:30:53'!
iniciarHabitat
	avispaOriana := AvispaOriana.
	avispaOriana iniciar.
	avispaPolly := Avispa.
	avispaPolly iniciar.
	avispaLara := AvispaLara.
	avispaOrnella := AvispaOriana.
	avispaOrnella  iniciar.
	
	avispaLara iniciarCon:AvispaOriana yCon:avispaPolly yTambien:avispaOrnella.
! !


!Habitat class methodsFor: 'as yet unclassified' stamp: 'IO-MG 4/24/2022 22:37:48'!
agregarRecursos
	avispaOriana agregarOruga.
	avispaPolly agregarOruga.
	avispaOrnella agregarOruga.
	
	! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'IO-MG 4/24/2022 22:12:44'!
cantidadDeOrugas
	^ avispaOriana cantidadOrugas + avispaPolly cantidadOrugas ! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'IO-MG 4/24/2022 21:22:08'!
cantidadDePolillas
	^ avispaPolly cantidadPolillas! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'IO-MG 4/24/2022 21:47:17'!
laAvispaOriana
	^ AvispaOriana! !


!Habitat class methodsFor: '--** private fileout/in **--' stamp: 'IO-MG 4/27/2022 18:54:55'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	avispaLara := AvispaLara.
	avispaOriana := AvispaOriana.
	huevos := Avispa.
	avispaPolly := Avispa.
	avispaOrnella := AvispaOriana.! !


!classDefinition: #PruebasReproduccionDeAvispas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #PruebasReproduccionDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasReproduccionDeAvispas class' category: 'AvispasYAbejasParte2'!
PruebasReproduccionDeAvispas class
	instanceVariableNames: ''!

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/18/2022 18:38:11'!
test01EnElInicioDeLosTiemposNoHayHuevos	
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:44'!
test02CuandoOrianaLaAvispaSeReproducePorPrimeraVezDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'IO-MG 4/21/2022 20:20:09'!
test03CadaVezQueOrianaSeReproduceDejaUnHuevoMas
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.

	self laAvispaOriana intentarReproducirse.	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:53'!
test04ParaDejarUnHuevoOrianaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:13:43'!
test05ParaDejarUnHuevoOrianaLaAvispaDecrementaEnUnoLaPoblacionDeOrugasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosOrugasMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:13:22'!
test06CuandoNoHayOrugasOrianaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:24'!
test07CuandoOrnellaLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:18'!
test08ParaDejarUnHuevoOrnellaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:11'!
test09CuandoNoHayOrugasOrnellaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:46'!
test10CuandoPollyLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:40'!
test11ParaDejarUnHuevoPollyLaAvispaReduceLaPoblacionDeUnaPolillaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaPolillaMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:36'!
test12ParaDejarUnHuevoPollyLaAvispaDecrementaEnUnoLaPoblacionDePolillasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosPolillasMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:30'!
test13CuandoNoHayPolillasPollyLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:06'!
test14CuandoOrianaLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:02'!
test15CuandoOrianaLaAvispaAunNoSeReprodujoNoTieneHuevosConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'IO-MG 4/24/2022 21:58:07'!
test16CuandoPollyLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.		
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 1.
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:54'!
test17CuandoOrnellaLaAvispaSeReproduceDejaUnHuevoConLaMismaFirmaGeneticaQueOriana
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella isEqualTo: 1.
	Assert 
		that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella  
		isEqualTo: self cantidadDeHuevosConLaFirmaGeneticaDeOriana! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'IO-MG 4/24/2022 22:16:55'!
test18CuandoLaraLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'IO-MG 4/24/2022 22:18:18'!
test19CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAOtraAvispa
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.

	self laAvispaOriana intentarReproducirse.	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'IO-MG 4/24/2022 22:20:48'!
test20CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAPolly
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.

	self laAvispaPolly intentarReproducirse.	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:12'!
test21CuandoLaraLaAvispaNoTieneRecursosNoDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
		
	self laAvispaLara intentarReproducirse.
		
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'IO-MG 4/24/2022 22:49:19'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	^ self laAvispaLara dameCantidadHuevos.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'IO-MG 4/24/2022 21:40:21'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	^ self laAvispaOriana dameCantidadHuevos.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'IO-MG 4/24/2022 22:16:21'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	^ self laAvispaOrnella dameCantidadHuevos.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'IO-MG 4/24/2022 21:28:49'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^ self laAvispaPolly dameCantidadHuevos! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'IO-MG 4/21/2022 19:41:39'!
habitat
	^Habitat! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'IO-MG 4/21/2022 20:21:18'!
hacerQueElHabitatTengaLosRecursosSuficientes
	self habitat agregarRecursos.
	self habitat agregarRecursos.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'IO-MG 4/24/2022 22:36:42'!
laAvispaLara
	^ AvispaLara.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'IO-MG 4/24/2022 21:57:53'!
laAvispaOriana
	^AvispaOriana! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'IO-MG 4/24/2022 22:13:48'!
laAvispaOrnella
	^AvispaOriana.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'IO-MG 4/21/2022 20:24:54'!
laAvispaPolly
	^Avispa.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'IO-MG 4/21/2022 20:16:38'!
queElHabitatTengaDosOrugasMas
	self laAvispaOriana agregarOruga.
	self laAvispaOriana agregarOruga.
	! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'IO-MG 4/21/2022 20:31:19'!
queElHabitatTengaDosPolillasMas
	self laAvispaPolly agregarPolilla.
	self laAvispaPolly agregarPolilla.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'IO-MG 4/21/2022 20:12:42'!
queElHabitatTengaUnaOrugaMas
	self laAvispaOriana agregarOruga.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'IO-MG 4/21/2022 20:29:18'!
queElHabitatTengaUnaPolillaMas
	self laAvispaPolly agregarPolilla.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'IO-MG 4/21/2022 19:49:06'!
retrocederElHabitatAlInicioDeLosTiempos
	self habitat iniciarHabitat.! !

Avispa initializeAfterFileIn!
AvispaLara initializeAfterFileIn!
AvispaOriana initializeAfterFileIn!
Habitat initializeAfterFileIn!