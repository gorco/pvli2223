---
title: Ejercicios JavaScript
---

# Objetivos

Probad estos ejemplos y tratad de responder a las preguntas y hacer las modificaciones de código que se piden. 
Si os atascáis con lo que hace una función, buscad en Internet la función acompañado de "mdn".

Para estos ejercicio vamos a usar el [modo estricto](https://developer.mozilla.org/es/docs/Web/JavaScript/Reference/Strict_mode) de Javascript, para ello, al inicio del archivo escribiremos:
```js
'use strict'
```
El modo estricto tiene varios cambios en la semántica normal de JavaScript:

- Elimina algunos errores silenciosos de JavaScript cambiándolos para que lancen errores.
- Corrige errores que hacen difícil para los motores de JavaScript realizar optimizaciones: a veces, el código en modo estricto puede correr más rápido que un código idéntico pero no estricto.
- Prohíbe cierta sintaxis que probablemente sea definida en futuras versiones de ECMAScript.



# Valores booleanos en JavaScript

En JavaScript cualquier valor puede considerarse verdadero o falso según el contexto. Por ejemplo, el `0`{.js} es considerado `false`{.js} y cualquier número distinto de `0`{.js} es `true`{.js}:

```js
const v = 0; // después de esta prueba, cambia el valor de v por otro número.
!!v; // la doble negación al comienzo lo convierte en booleano.
```

Descubre qué valores son ciertos y cuales falsos para todos los tipos: números, cadenas, objetos, funciones y undefined.

---

### --> **Ejercicio 1**: Escribe en un archivo el código probado y con comentarios de si los valores son ciertos o falsos.
Ejemplo:
```js
!!0 // false
!![] // true
```

Fijaros que !!0 se evalua a false y !!\[] se evalue a true pero sin embargo 0==\[] devuelve true \
[Algo más de info aquí](https://javascriptweblog.wordpress.com/2011/02/07/truth-equality-and-javascript/)

# Expresiones booleanas en JavaScript

En JavaScript, las expresiones booleanas son _vagas_, esto significa que en cuanto sabemos lo que va a valer la expresión, dejamos de evaluar. Por ejemplo, ¿qué crees que le pasará a la siguiente expressión?

```js
const hero = { name: 'Link', weapon: null };
console.log('Hero weapon power is:', hero.weapon.power);
```

Pero, ¿y ahora?

```js
const hero = { name: 'Link', weapon: null };
if (hero.weapon && hero.weapon.power) {
  console.log('Hero weapon power is:', hero.weapon.power);
} else {
  console.log('The hero has no weapon.');
}
```

En caso de expresiones `&&` (_and_ o _y_), la evaluación termina tan pronto como encontramos un término falso.

En caso de expresiones `||` (_or_ u _o_), la evaluación termina tan pronto como encontramos un término verdadero.

# El resultado de las expresiones booleanas

Contra el sentido común, el resultado de una expresión booleana no es un booleano sino el último término evaluado. Recuerda que la evaluación es _vaga_ y dejamos de evaluar tan pronto como podemos determinar el resultado de la expresión. Con esto en cuenta, trata de predecir el resultado de las siguientes expresiones:

```js
let v;
function noop() { return; };

1 && true && { name: 'Link' };
[] && null && "Spam!";
null || v || noop || true;
null || v || void "Eggs!" || 0;
```

# Parámetros por defecto

Puedes ver una aplicación real de lo anterior en esta función para rellenar números. En JavaScript no hay parámetros por defecto, pero los parámetros omitidos tienen el valor especial `undefined`{.js} que es falso.

```js
function pad(target, targetLengthIn, fillIn) {
  let result = target.toString();
  const targetLength = targetLengthIn || result.length + 1;
  const fill = fillIn || '0';
  while (result.length < targetLength) {
    result = fill + result;
  }
  return result;
}
```
---

### --> **Ejercicio 2**: Intenta predecir el resultado de las siguientes llamadas:

```js
pad(3);
pad(2, 5);
pad(2, 5, '*');
```

Escribe en un documento el código probado, el resultado predicho y el resultado devuelto. \
No te preocupes si no has acertado, lo importante es que acabes entendiendo que está pasando.

# Buenas prácticas en el diseño de APIs

El estado no se debería exponer pero siempre acabamos enseñando este tipo de modelado para los puntos:

```js
const p = { x: 5, y: 5 };

function scale(point, factor) {
  point.x = point.x * factor;
  point.y = point.y * factor;
  return p;
}

scale(p, 10);
```

La implementación correcta sería:

```js
const p = {
  _x: 5,
  _y: 5,
  getX: function () {
    return this._x;
  },
  getY: function () {
    return this._y;
  },
  setX: function (v) {
    this._x = v;
  },
  setY: function (v) {
    this._y = v;
  }
};

function scale(point, factor) {
  point.setX(point.getX() * factor);
  point.setY(point.getY() * factor);
  return p;
}

scale(p, 10);
```

Pero reconozcámoslo, escribir todo esto para todos nuestro objetos es muy pesado.

# Propiedades computadas al rescate

JavaScript permite definir un tipo especial de propiedades llamadas normalmente _propiedades computadas_ de esta manera:

```js
const p = {
  _x: 5,
  _y: 5,
  get x() {
    return this._x;
  },
  get y() {
    return this._y;
  },
  set x(v) {
    this._x = v;
  },
  set y(v) {
    this._y = v;
  }
};

function scale(point, factor) {
  point.x = point.x * factor;
  point.y = point.y * factor;
  return p;
}

scale(p, 10);
```

Escribirlo sigue siendo pesado pero utilizarlo es mucho más claro. Así, si ahora decides que sería mejor exponer el nombre de los ejes en mayúscula, puedes hacer:

```js
const p = {
  _x: 5,
  _y: 5,
  get X() {
    return this._x;
  },
  get Y() {
    return this._y;
  },
  set X(v) {
    this._x = v;
  },
  set Y(v) {
    this._y = v;
  }
};

function scale(point, factor) {
  point.X = point.X * factor;
  point.Y = point.Y * factor;
  return p;
}

scale(p, 10);
```

¿Se te ocurre la manera de hacer que una propiedad pueda ser de sólo lectura? Es decir, que su valor no pueda cambiarse (asumiendo que el usuario no accederá a las propiedades que comiencen por '_').

Si quisieras añadir una propiedad a un objeto ya existente tendrías que utilizar [`Object.defineProperty()`{.js}](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/defineProperty):

```js
const point = {};
Object.defineProperty(point, '_x', { value: 5 });
Object.defineProperty(point, '_y', { value: 5 });
Object.defineProperty(point, 'x', {
  get: function () {
    return this._x;
  },
  set: function (v) {
    this._x = v;
  }
});
Object.defineProperty(point, 'y', {
  get: function () {
    return this._y;
  },
  set: function (v) {
    this._y = v;
  }
});
point; // no se observan propiedades...
point.x; // ...pero aquí están.
point.y;
```
---

### --> **Ejercicio 3**: ¿Te atreves a decir por qué cuando inspeccionamos el objeto no aparecen sus propiedades? ¿Cómo podrías arreglarlo? ¿Cómo harías para que sólo se vieran las propiedades que son parte de la API?.
No te lances a usar `Object.defineProperty()`{.js} si no tienes **muy claro** qué significan los términos **configurable**, **enumerable** y **writable**.

Crea un archivo con las respuestas y otro con un ejemplo de código.

# Usando funciones como si fueran métodos

Hemos visto que cualquier función puede usarse como un método si se referencia como una propiedad de un objeto y entonces se llama. Pero lo cierto es que también podemos hacer que una función cualquiera, sin estar referenciada desde una propiedad, pueda ser usada como el método de un objeto si indicamos explícitamente cual es el objeto destinatario. Esto puede hacerse con [`.apply()`{.js}](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/apply) y con
[`.call()`{.js}](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/call).

```js
const ship = { name: 'Death Star' };

function fire(shot) {
  console.log(this.name + ' is firing: ' + shot.toUpperCase() + '!!!');
}

ship.fire; // ¿qué crees que será esto?
fire.apply(ship, ['pichium']);
fire.call(ship, 'pañum');
```

---

### --> **Ejercicio 4**: ¿Cuál es la diferencia entre `.apply()`{.js} y `.call()`{.js}?
Crea un archivo con las respuesta

# Propiedades dinámicas

La notación corchete para acceder a las propiedades de un objeto es especialmente útil para acceder a propiedades de manera genérica. Por ejemplo, imagina el siguiente código:

```js
const hero = {
  name: 'Link',
  hp: 10,
  stamina: 10,
  weapon: { name: 'sword', effect: { hp: -2 } }
};
const enemy = {
  name: 'Ganondorf',
  hp: 20,
  stamina: 5,
  weapon: { name: 'wand', effect: { hp: -1, stamina: -5 } }
};

function attack(character, target) {
  if (character.stamina > 0) {
    console.log(character.name + ' uses ' + character.weapon.name + '!');
    applyEffect(character.weapon.effect, target);
    character.stamina--;
  } else {
    console.log(character.name + ' is too tired to attack!');
  }
}

function applyEffect(effect, target) {
  // Obtiene los nombres de las propiedades del objeto. Búscalo en la MDN.
  const propertyNames = Object.keys(effect);
  for (let i = 0; i < propertyNames.length; i++) {
    const name = propertyNames[i];
    target[name] += effect[name];
  }
}

attack(hero, enemy);
attack(enemy, hero);
attack(hero, enemy);
attack(enemy, hero);
attack(hero, enemy);
```

---

### --> **Ejercicio 5**: ¿Podrías modificar el efecto del arma del héroe para incapacitar al enemigo pero no matarlo ni dañarlo? Intenta hacerlo sin reescribir el ejemplo entero.
Crea un archivo.js con las modificaciones necesarias.

# Objetos como algo más que objetos

Los objetos de JavaScript no solo sirven para modelar los objetos de la programación orientada a objetos sino que permiten realizar clasificaciones por nombre. Un histograma, es decir un conteo de un conjunto con repeticiones, es un ejemplo clásico de la utilidad de un objeto JavaScript:

```js
function wordHistogram(text) {
  const wordList = text.split(' ');
  const histogram = {};
  for (let i = 0; i < wordList.length; i++) {
    const word = wordList[i];
    if (!histogram.hasOwnProperty(word)) {
      histogram[word] = 0;
    }
    histogram[word]++;
  }
  return histogram;
}
```

Prueba a usar la función por ti mismo.

Lo que JavaScript llama objetos se conoce en otros lenguajes de programación como mapas o diccionarios y a los nombres de las propiedades se los llama _claves_.


# Funciones como parámetros

Las listas de JavaScript tiene algunos métodos que aceptan funciones como parámetros, por ejemplo [`.forEach()`{.js}](https://developer.mozilla.org/es/docs/Web/JavaScript/Referencia/Objetos_globales/Array/forEach). De hecho es común encontrar `.forEach()`{.js} cuando se tiene la certeza de que se van a recorrer **todos** los elementos de una lista.

```js
function wordHistogram(text) {
  const wordList = text.split(' ');
  const histogram = {};
  wordList.forEach(function (word) {
    if (!histogram.hasOwnProperty(word)) {
      histogram[word] = 0;
    }
    histogram[word]++;
  });
  return histogram;
}

const poem = 'Todo pasa y todo queda, ' +
           'pero lo nuestro es pasar, ' +
           'pasar haciendo caminos, ' +
           'caminos sobre la mar';

wordHistogram(poem);
```

El resultado no es correcto porque al separar las palabras por los espacios estamos dejando caracteres que no son palabras como parte de ellas. Podemos arreglarlo si en vez de partir el texto por los espacios usamos una [expresión regular](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions) para partir el texto por los límites de las palabras:

```js
function wordHistogram(text) {
  const wordList = text.split(/\b/); // Eso entre / / es una expresión regular.
  const histogram = {};
  wordList.forEach(function (word) {
    if (!histogram.hasOwnProperty(word)) {
      histogram[word] = 0;
    }
    histogram[word]++;
  });
  return histogram;
}

const poem = 'Todo pasa y todo queda, ' +
           'pero lo nuestro es pasar, ' +
           'pasar haciendo caminos, ' +
           'caminos sobre la mar';

wordHistogram(poem);
```

Pero ahora tenemos cosas que no son palabras (como espacios y comas). Podemos filtrar una lista con [`.filter()`{.js}](https://developer.mozilla.org/es/docs/Web/JavaScript/Referencia/Objetos_globales/Array/filter):

```js
function isEven(n) { return n % 2 === 0; }
[1, 2, 3, 4, 5, 6].filter(isEven);
```

Y así quitar lo que no sean palabras:

```js
function isWord(candidate) {
  return /\w+/.test(candidate);
}

function wordHistogram(text) {
  let wordList = text.split(/\b/);
  wordList = wordList.filter(isWord);
  const histogram = {};

  wordList.forEach(function (word) {
    if (!histogram.hasOwnProperty(word)) {
      histogram[word] = 0;
    }
    histogram[word]++;
  });
  return histogram;
}

const poem = 'Todo pasa y todo queda, ' +
           'pero lo nuestro es pasar, ' +
           'pasar haciendo caminos, ' +
           'caminos sobre la mar';

wordHistogram(poem);
```

También deberíamos normalizar las palabras (pasarlas a minúsculas por ejemplo) para no encontrarnos con entradas distintas en el histograma para la misma palabra. Para transformar una lista en otra lista de los mismos elementos, usamos [`.map()`{.js}](https://developer.mozilla.org/es/docs/Web/JavaScript/Referencia/Objetos_globales/Array/map).

```js
function isWord(candidate) {
  return /\w+/.test(candidate);
}

function toLowerCase(word) {
  return word.toLowerCase();
}

function wordHistogram(text) {
  let wordList = text.split(/\b/);
  wordList = wordList.filter(isWord);
  wordList = wordList.map(toLowerCase);
  const histogram = {};

  wordList.forEach(function (word) {
    if (!histogram.hasOwnProperty(word)) {
      histogram[word] = 0;
    }
    histogram[word]++;
  });
  return histogram;
}

const poem = 'Todo pasa y todo queda, ' +
           'pero lo nuestro es pasar, ' +
           'pasar haciendo caminos, ' +
           'caminos sobre la mar';

wordHistogram(poem);
```

Una última función nos permite transformar una lista en un sólo valor. Esto es precisamente el histograma, una clasificación de todos los valores de la lista. Esta transformación se consigue mediante [`.reduce()`{.js}](https://developer.mozilla.org/es/docs/Web/JavaScript/Referencia/Objetos_globales/Array/reduce):

```js
function isWord(candidate) {
  return /\w+/.test(candidate);
}

function toLowerCase(word) {
  return word.toLowerCase();
}

function buildHistogram(inProgressHistogram, word) {
  if (!inProgressHistogram.hasOwnProperty(word)) {
    inProgressHistogram[word] = 0;
  }
  inProgressHistogram[word]++;
  return inProgressHistogram;
}

function wordHistogram(text) {
  const emptyHistogram = {};
  return text.split(/\b/)
             .filter(isWord)
             .map(toLowerCase)
             .reduce(buildHistogram, emptyHistogram);
}

const poem = 'Todo pasa y todo queda, ' +
           'pero lo nuestro es pasar, ' +
           'pasar haciendo caminos, ' +
           'caminos sobre la mar';

wordHistogram(poem);
```

# Número variables de parámetros

Fíjate en esto:

```js
console.log('I\'m', 'Ziltoid');
console.log('I\'m', 'Ziltoid,', 'the', 'Omniscient');
Math.max(1);
Math.max(1, 2);
Math.max(1, 2, 3);
```

Como puedes ver, la función acepta un número cualquiera de variables. Podemos hacer los mismo gracias a la variable implícita `arguments`{.js}.

```js
function f() {
  console.log('Número de argumentos pasados:', arguments.length);
  console.log('Argumentos:', arguments);
}
f();
f(1);
f('a', {});
f(function () {}, [], undefined);
```

Busca la información sobre `arguments`{.js} en la [MDN](http://lmgtfy.com/?q=mdn+arguments). ¡Te hará falta!

# Decoradores

Aparte de devolverse como parámetros, las funciones pueden ser devueltas desde otras funciones. Considera el siguiente ejemplo:

```js
function newLog(label) {
  return function(value) {
    console.log(label + ':', value);
  }
}
```

Esta función crea funciones que llamarán a `console.log()`{.js} pero con una etiqueta delante. Podríamos crear métodos `_log()`{.js} por clase, cada uno con un prefijo y así distinguir unos logs de otros.

Sin embargo, advierte el siguiente comportamiento:

```js
const log1 = newLog('Default');
const log2 = newLog('Ziltoid');

const p = { x: 1, y: 10 };
log1(p);
log2(p);
log1('Greetings', 'humans!');
```

Para hacer que funcione, tendríamos que llamar a `console.log()`{.js} con un número de parámetros que no sabemos a priori. Podemos usar `arguments`{.js}, no obstante:

```js
function newLog(label) {
  return function() {
    // ¿Por qué tenemos que hacer esto?
    const args = Array.prototype.slice.call(arguments);
    args.splice(0, 0, label + ':');
    console.log.apply(console, args);
  }
}

const log1 = newLog('Default');
const log2 = newLog('Ziltoid');

const p = { x: 1, y: 10 };
log1(p);
log2(p);
log1('Greetings', 'humans!');
```



### --> **Ejercicio 6**: ¿Podrías decir qué hace cada línea en la función `newLog()`{.js}?---
Crea un documento con las respuestas.

# Asincronía y closures

Carga el siguiente código:

```js
function scheduleTasks(count) {
  for(let i = 1; i <= count; i++) {
    setTimeout(function () {
      console.log('Executing task', i);
    }, i * 1000);
  }
}
```

Trata de predecir qué pasará al ejecutar el siguiente código:

```js
scheduleTasks(5);
```

### --> **Ejercicio 7**: ¿Hace lo que esperabas? Si no es así, ¿por qué? ¿cómo lo arreglarías? Pista: necesitas la función [`.bind()`{.js}](https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Global_objects/Function/bind).
Crea un documento con la respuestas

# Eventos y métodos

Hay veces en las que debemos llamar a un método de un objeto cuando ocurra algo. Por ejemplo, supón que el método avanzar de un supuesto objeto debe llamarse en un intervalo de tiempo. Pongamos cada segundo:

```js
const obj = {
  x: 10,
  y: 2,
  advance: function () {
    this.y += 2;
    console.log('Ahora Y vale', this.y);
  }
};

const id = setInterval(obj.advance, 1 * 1000);
```

Este ejemplo falla porque en la última línea **no estamos llamando** a la función sino sólo pasándola como parámetro. La función `setInterval()`{.js} no tiene idea del destinatario del mensaje y por tanto no puede llamar a la función como si fuera un método.

Podemos arreglarlo con `bind()`{.js} pero antes para el intervalo con:

```js
clearInterval(id);
```

Ahora podemos solucionarlo con:

```js
const id = setInterval(obj.advance.bind(obj), 1 * 1000);
```

# La función `bind()`{.js}

A estas alturas ya deberías saber cómo funciona `bind()`{.js} o qué hace. Si aun no lo tienes claro, búscalo en la MDN.

### --> **Ejercicio 8**: Crea una función `bind()`{.js} que simule el comportamiento del método de las funciones `.bind()`{.js}. Como se pide una función y no un método, el primer parámetro será la función. Así pues, en vez de usarse así:

```js
function dice(sides) {
  const result = Math.floor(Math.random() * sides) + 1;
  this.history.push(result);
  return result;
}
const obj = { history: [] };
const d20 = dice.bind(obj, 20);
d20();
```

La usaremos de esta otra forma:

```js
function dice(sides) {
  const result = Math.floor(Math.random() * sides) + 1;
  this.history.push(result);
  return result;
}
const obj = { history: [] };
const d20 = bind(dice, obj, 20); // fíjate en que ahora dice es el primer parámetro
d20();
```
