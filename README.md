# Sobre implementar funcionalidad

Los tests no pasaron de una todos. Fuimos resolviendo cada uno indivualmente, y cada vez que pasaba revisar que el nuevo código no rompiera lo anterior. Cada vez, íbamos agregando mas código para satisfacer los test, agregando mas funcionalidades dependiendo de lo que los Tests exigían.

¿que pensás de implementar esa funcionalidad de esa forma?
Parece una forma muy interesante de ejercer una implementación, además no te exigís por demás, solo cumplís con lo que te van pidiendo los test.

# Sobre código repetido
¿Les quedó código repetido? Si, algunas.
¿Se animan a adivinar que cosa del dominio les faltó representar? Si, creo que tener un objeto “Avispa” bien contudente no hubiera ayudado a tener menos código repetido.

¿Quien les quedó, en su modelo, responsable de ver si hay fucientes polillas u orugas y entonces dejar un huevo?
Eso ocurre adentro del propio insecto, en particular adentro de nuestro objeto AvispaLara. En nuestro criterio, no parece tener mucho sentido que esa lógica esté en el hábitat ya que buscamos acercarnos lo mas posible a como esta se implementa en el mundo real y no es el propio hábitat el que gobierna la reproducción de las avispas sino ellas mismas.

# Sobre código repetido 2
Una forma interesante según lo que vimos en clase, sería justamente definir la clase “Avispa” y trabajar con distintas instancias. En esa caso además si tendría sentido guardar los objetos en Diccionarios, Listas o Colecciones y poder manipularlas todas juntas. Pero como nos basamos en el ejemplo del Semáforo que se dio en clase, es que trabajamos con objetos que representan a cada elemento 1:1.



