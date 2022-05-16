## Explicación del la solucion

Utilizamos una estructura similar a una Lista e implementamos los objetos "NodoVacio y "NodoNoVacio" que son los eslabones que permiten armar la estructura de datos que representa la información que necesitamos guardar en memoria.

## Comentario sobre el método 'find'

Para este trabajo implementamos como lo requería el enunciado el método 'find'. Pero además de esa implementación hicimos otra implementación que decidimos incluir igual en el TP, esa otra implementación o implementación alternativa se encuentra dentro de la clase SentenceFinderByPrefix dentro del método 'findVersionAlternativa'. Este método a diferencia de la otra implementación hace lo siguiente:

- Convierte el contenido de la lista en OrderedCollection.
- Luego recorre dicho OrderedCollection y busca las palabras allí adentro
- Va guardando las que coinciden en una variable que será la que finalmente retorna.
