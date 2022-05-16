## Preguntas teoricas

### Aporte de los mensajes de DD

En DD la informacion que aporta la tecnica es el tipo de datos del objeto que está siendo pasado como parámetro. Entonces, en vez de usar un IF que permita saber de que tipo de datos se trata (y por ende que tratamiento hay que darle) es que esta tecnica nos ahorra dicho IF, haciendo el código mas directo y mas claro y prolijo.

### Logica de instanciado

El mejor lugar para guardar la lógica de instanciado de un objeto es en un método que se llame "init" y que tome como parámetros las variables que hacen falta para intanciar dicho objeto. En el caso de una fracción hará falta un ENTERO para el numerador y otro para el denominador, ambos parámetros serán pasados como argumentos y dentro del método "init" inicializarán el objeto en cuestión y devolverán la nueva instancia correspondiente.

### Nombres de las categorías de métodos

Vamos categorizando los métodos según la funcionalidad que tienen e intentamos agrupar los métodos que tienen funcionalidades parecidas dentro de una misma categoría (i.e.: operaciones ariméticas, operaciones lógicas, etc)

### Subclass Responsibility

Poner “self subclassResponsibility” sirve para que cuando alguien quiere implementar una subclase de la clase en cuestión se le recuerda que necesita implementar ciertos métodos para cumplicar con el "contrato" que se espera de la cualquier nueva clase que sea una subclase de la clase en cuestión.

### No rompas

Si se rompe el encapsulamiento, se corre el riesgo de que el objeto funcione de formas no esperadas y que los programadores que trabajen con ese objeto no entiendan que está pasando ya que hay ciertos agentes modificando el objeto por fuera de los métodos en los que se esperaría que se modifique el estado.
