---
title: Proyectos en la red
---



# ¿Proyectos o juegos?

---

En realidad, hablaremos de videojuegos en HTML5

Muchos aspectos que comentaremos son extrapolables a otros proyectos y sectores (móviles, por ejemplo)



# Los proyectos en la web son particulares

---

## Perdemos una buena parte del control sobre el cliente

No sabemos, a priori, si el acceso a nuestro proyecto será con un PC, un móvil, una tablet...

Además, no sabemos el navegador, ni podemos controlar el sistema operativo

*(Podemos, pero *no es lo ideal*)*

[Ejemplo de API que puede obtener info del sistema operativo](https://developer.mozilla.org/es/docs/Web/API/Navigator)

---

## Los ciclos de desarrollo son **muy cortos**

La competencia en la web en **inmensa**

La oferta cambia constantemente (literalmente, todos los días y a todas horas)

---

## La ganancia y pérdida de usuarios es muy rápida (**baja inercia**)

En general, es difícil alinearse con "campañas" o "temporadas"

Atraer al usuario es sólo el primer paso: hay que saber mantenerlo, hacer que comunique, comparta y dé publicidad

---

## Nuestro código se publica abierto

(O una buena parte de él)

Si nuestro juego corre completamente en cliente y está en JavaScript, cualquiera podrá ver nuestro código



# Cómo gestionar las particularidades

---

## Conseguir Visibilidad

---

Es fundamental tener un posicionamiento bueno ([SEO](https://es.wikipedia.org/wiki/Posicionamiento_en_buscadores)/[SEM](https://es.wikipedia.org/wiki/Mercadotecnia_en_motores_de_b%C3%BAsqueda))

---

También es importante pensar en particular en el público al que queremos orientarnos, y tener presencia en los sitios que se visitan

---

Hay un trabajo muy grande implícito que tiene poco que ver con el desarrollo software, pero que es fundamental de cara al éxito de un proyecto

La calidad es un requisito fundamental, pero no lo es todo

---

## [Release early, release often](https://es.wikipedia.org/wiki/Release_early,_release_often)

---

Los ciclos tan rápidos, la necesidad de ofrecer algo novedoso y las características abiertas invitan a publicar pronto y muy a menudo

El código no va a estar escondido, lo que cobra valor es la idea

Por tanto, la idea tiene que estar muy pronto fuera, y constantemente depurada

---

## El código abierto lo puede ver cualquiera

---

La idea de que la implementación tiene valor en sí misma es cada vez menos importante

Hoy en día, [grandes proyectos de videojuegos han dado el salto al código abierto](https://es.wikipedia.org/wiki/Anexo:Videojuegos_libres) con muchísimo éxito

---

## Desarrollo en cliente y servidor

A pesar de que vamos a trabajar principalmente con código en cliente, es muy común tener una parte del desarrollo en el servidor

---

Esto no sólo se centra en el *servidor de juego*, sino también en:

- El servidor web
- La página web
- Las conexiones con servicios externos
- El alojamiento de nuestro código
- Información de usuarios y clientes
- Publicación de código

---

Esto quiere decir que un juego en Internet que corra en el navegador tienen muchos más aspectos que el código

---

## No olvidemos las pruebas

Probad el juego antes de publicarlo

---

Las pruebas tienen que ser estrictas, aburridas, mecánicas, exhaustivas y destinadas a hacer que algo se rompa

Cada versión preparada para el lanzamiento tiene que tener su propio set de pruebas

---

## Mantenimiento

Cualquier proyecto tiene que estar mantenido

No es suficiente (ni de lejos) publicar la primera versión y dejar que el juego genere beneficios por sí mismo

---

## Actualización constante

- Corrección de errores
- Añadido de características demandadas
- Ajuste de parámetros
- Adaptación de precios  



# Cómo **aprovechar** las particularidades

---

No todo son malas noticias

La razón por lo que los juegos en el navegador tienen tanto éxito (y bastante futuro a priori) es que ofrecen muchas oportunidades

---

## "No hay despliegue en cliente"

---

Aunque esto no es necesariamente cierto (pensad en los problemas del navegador, cookies...)

---

El cliente **no** tiene que:

- Instalar software
- Ir a la tienda
- Descargar (activamente) nada

---

## Es crucial recibir realimentación

---

Uno de los principios básicos de cualquier proyecto es saber *cuál es el impacto que está teniendo*

---

La realimentación es fundamental

Ayuda a ver los problemas que surgen

---

Estos pueden ser errores de programación, pero también defectos de interfaz, de jugabilidad (en el caso de juegos), de modificación de requisitos...

Es muy posible, por ejemplo, que el jugador evolucione y que pida características nuevas en vuestro juego

---

Para todo esto, un buen proyecto debe *habilitar formas de comunicación con sus jugadores*

Cuanto más accesibles y sencillas sean, más fácil es encontrar respuesta (nadie quiere pasarse media hora para poner una reclamación)

---

## Aplicar la realimentación, probar y volver a desplegar ha de ser rápido

Si hay algo que un proyecto que no convence al jugador y no se arregla, el jugador desaparecerá

---

En un marco tan competitivo, cualquier otro juego aprovechará las debilidades relativas de vuestro juego para su beneficio

---

Con el [F2P](https://en.wikipedia.org/wiki/Free-to-play) y la accesibilidad en Internet de casi todos juegos, la calidad, la respuesta rápida y la adaptación constante son fundamentales

---

## Monetización

Monetizar: convertir vuestro juego en dinero

La monetización es uno de los temas más críticos de los videojuegos

---

No es difícil (más o menos) crear un juego aceptable al que mucha gente juegue, lo complicado es vivir de ello

- Vender el juego (la licencia) a un *publisher*
- Publicidad
- Vender capacidad de hacer juegos
- Fundraising (de muchos tipos)

---

Se pueden terminar vendiendo en un marketplace (Steam, App Store, Google Play...)

- Wrappers ([NW.js](https://nwjs.io/), [Apache Cordova](https://cordova.apache.org/)... ) para distribuir tu juego en estos marketplace
- Tu juego en HTML5 se distribuye y ejecuta como una aplicación nativa

---

En [esta página](https://www.truevalhalla.com/blog) podéis ver un ejemplo (¡con mucho detalle!) de un modelo de monetización exitoso

El autor hasta ha publicado [un libro](https://www.truevalhalla.com/blog/ebook)