# Ejercitación: Eventos en JavaScript – Interactividad, classList y Consumo de API

## 📋 Objetivo

En esta ejercitación vas a poner en práctica el **manejo integral de eventos en JavaScript** (eventos de ratón y teclado), la manipulación dinámica de clases mediante la API **`classList`**, y el **consumo asíncrono de APIs con `fetch()`** para renderizar contenido interactivo en el DOM.

Trabajarás sobre el proyecto **"La familia de los felinos"**. Partirás de una estructura base donde el contenedor de felinos está vacío y deberás desarrollar **seis tareas principales**:

1. **Tarea 1**: Obtener los datos de los felinos desde un servidor local Express (`/api/felinos`) mediante `fetch()` o `async/await`.
2. **Tarea 2**: Renderizar dinámicamente las tarjetas de felinos en el DOM dentro de `.contenedor`.
3. **Tarea 3**: Habilitar los estilos de tema oscuro en `css/styles.css` y programar el evento `click` en el botón `#btn-theme` para alternar la clase `.dark` con `classList.toggle()`.
4. **Tarea 4**: Implementar un atajo de teclado (`keydown`) para alternar el tema presionando la tecla **`T`** o **`D`**.
5. **Tarea 5**: Implementar un efecto visual de resalte en las tarjetas usando los eventos **`mouseenter`** y **`mouseleave`** junto con la clase `.destacada`.
6. **Tarea 6**: Implementar un efecto de zoom / ampliación en la foto del felino al hacer **`click`** sobre la imagen utilizando la clase `.expandida`.

---

## 📌 Tabla: issues y qué entrega cierra cada uno

En tu repositorio de corrección tendrás **issues de GitHub** generados automáticamente. Cada bloque de esta guía termina con el **mensaje de commit exacto** que debes usar para cerrar el issue correspondiente al subir a la rama `main`.

| Issue (típico) | Qué debe quedar hecho                                                                                                                                  |
| -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **#1**         | Vincular `css/styles.css` con `<link>` y `js/script.js` (como módulo) en `index.html`.                                                                 |
| **#2**         | **Tarea 1**: Realizar la petición a la API local de felinos (`/api/felinos`) usando `fetch()` o `async/await`.                                         |
| **#3**         | **Tarea 2**: Renderizar dinámicamente las tarjetas de los felinos (`<div class="item">`, `<img>`, `<h2>`, `<p>`) dentro de `.contenedor`.              |
| **#4**         | **Tarea 3**: Configurar los estilos de tema oscuro en `css/styles.css` e implementar el evento `click` en `#btn-theme` con `classList.toggle('dark')`. |
| **#5**         | **Tarea 4**: Implementar el atajo de teclado con evento `keydown` (tecla `T` o `D`) para alternar el tema oscuro.                                      |
| **#6**         | **Tarea 5**: Implementar el efecto de resalte en tarjetas con eventos `mouseenter` y `mouseleave` usando la clase `.destacada`.                        |
| **#7**         | **Tarea 6**: Implementar zoom / expansión de imagen al hacer clic sobre ella con la clase `.expandida`.                                                |

---

## 🚀 Guía por issue (orden sugerido de trabajo)

Sigue este orden: resuelve cada parte, haz **un commit** con el mensaje indicado (título + cuerpo tal cual) y sube a `main`. Así cerrarás el issue automáticamente si usas `Closes #n` como en los ejemplos.

### Vincular CSS y JS al HTML (issue **#1**)

Antes de comenzar con la lógica en JavaScript, debes enlazar la hoja de estilos y el script en `index.html`:

1. **CSS**: Dentro de `<head>`, agrega la etiqueta `<link rel="stylesheet" href="./css/styles.css">`.
2. **JavaScript**: Dentro de `<head>` (o antes del cierre de `</body>`), vincula el script modular con `<script type="module" src="./js/script.js"></script>`.

**Commit exacto para cerrar el issue:**

```text
feat(html): vincular css y script js al html

Closes #1
```

---

### Tarea 1: Consumir la API local de felinos con fetch (issue **#2**)

Debes realizar una petición HTTP asíncrona al endpoint del servidor Express local:
`http://localhost:3000/api/felinos`

**Tu tarea:**

- En `js/script.js`, completa la función `obtenerFelinos()` realizando la llamada con `fetch(API_URL)` (o utilizando `async/await`).
- Convierte la respuesta a formato JSON con `response.json()`.
- Pasa los datos recibidos a la función `renderizarFelinos(felinos)` e imprime los datos en la consola (`console.log(felinos)`) para inspeccionar su estructura (un arreglo de objetos con `id`, `titulo`, `descripcion`, `imagen`).

**Commit exacto para cerrar el issue:**

```text
feat(js): consumir api de felinos con fetch

Closes #2
```

---

### Tarea 2: Renderizar dinámicamente las tarjetas de felinos (issue **#3**)

Una vez obtenidos los datos de los felinos, debes recorrer el arreglo y renderizarlos dentro de `<div class="contenedor">`.

**Tu tarea:**

- En `js/script.js`, completa la función `renderizarFelinos(felinos)`.
- Selecciona el contenedor con `document.querySelector('.contenedor')`.
- Por cada objeto felino del arreglo, genera la estructura HTML requerida:
  ```html
  <div class="item">
    <img src="[imagen]" />
    <h2>[titulo]</h2>
    <p>[descripcion]</p>
  </div>
  ```
- Inserta los elementos en el DOM (puedes utilizar `innerHTML` con template literals o `document.createElement()` + `appendChild()`).

**Commit exacto para cerrar el issue:**

```text
feat(js): renderizar tarjetas de felinos dinamicamente en el dom

Closes #3
```

---

### Tarea 3: Alternar tema claro / oscuro con botón (issue **#4**)

En esta tarea integrarás los estilos CSS para el modo oscuro con el botón interactivo.

**Tu tarea:**

1. **En `css/styles.css`**: Descomenta el bloque de estilos del tema oscuro al final del archivo y asegúrate de que los selectores dependan de la clase `.dark` aplicada en el `body` (por ejemplo: `body.dark`, `body.dark h1`, `body.dark #btn-theme`, `body.dark .item`, `body.dark .item h2, body.dark .item p`).
2. **En `js/script.js`**: Completa la función `inicializarBotonTema()`:
   - Selecciona el botón `#btn-theme` con `document.querySelector('#btn-theme')`.
   - Agrega un escuchador de evento `click` con `addEventListener('click', ...)`.
   - Dentro del manejador del evento, alterna la clase `'dark'` en el cuerpo del documento usando `document.body.classList.toggle('dark')`.

**Commit exacto para cerrar el issue:**

```text
feat(js): implementar evento click y classlist para alternar tema

Closes #4
```

---

### Tarea 4: Atajo de teclado para alternar el tema (issue **#5**)

Permite que el usuario alterne entre tema claro y oscuro mediante una tecla de acceso rápido sin necesidad de hacer clic en el botón.

**Tu tarea:**

- En `js/script.js`, completa la función `inicializarAtajoTeclado()`.
- Escucha el evento `keydown` globalmente en `window` o `document`.
- Comprueba si la tecla presionada (`event.key`) es la letra **`t`** o **`d`** (en mayúscula o minúscula).
- Al cumplirse la condición, alterna la clase `'dark'` en `document.body` mediante `document.body.classList.toggle('dark')`.

**Commit exacto para cerrar el issue:**

```text
feat(js): implementar atajo de teclado para alternar tema

Closes #5
```

---

### Tarea 5: Efecto de resalte en tarjetas con mouseenter y mouseleave (issue **#6**)

Agrega una respuesta visual cuando el puntero del ratón entra y sale de cada tarjeta de felino.

**Tu tarea:**

- En `js/script.js`, completa la función `agregarEfectoResalte(tarjeta)` (o asocia los eventos durante el renderizado):
  - Escucha el evento `mouseenter` (o `mouseover`) en la tarjeta `.item` y agrega la clase `'destacada'` usando `tarjeta.classList.add('destacada')`.
  - Escucha el evento `mouseleave` (o `mouseout`) en la tarjeta `.item` y remueve la clase `'destacada'` usando `tarjeta.classList.remove('destacada')`.
- Verifica en `css/styles.css` que la clase `.item.destacada` aplique la elevación y sombra deseadas.

**Commit exacto para cerrar el issue:**

```text
feat(js): implementar efecto de resalte con mouseenter y mouseleave

Closes #6
```

---

### Tarea 6: Zoom / Expansión de imagen al hacer clic (issue **#7**)

Permite que el usuario amplíe la imagen de un felino al hacer clic directamente sobre ella.

**Tu tarea:**

- En `js/script.js`, completa la función `agregarEfectoZoom(imagen)` (o asocia el evento durante el renderizado):
  - Escucha el evento `click` sobre la etiqueta `<img>` de la tarjeta.
  - Al hacer clic, alterna la clase `'expandida'` en la imagen usando `imagen.classList.toggle('expandida')`.
- Verifica en `css/styles.css` que la clase `.item img.expandida` aplique la transformación de escala.

**Commit exacto para cerrar el issue:**

```text
feat(js): implementar zoom en imagen al hacer click

Closes #7
```

---

## 📚 Conceptos y métodos que vas a necesitar

| Método / Propiedad                      | Descripción                                                                                                    |
| --------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `fetch(url)`                            | Realiza una petición asíncrona HTTP a una API o endpoint y retorna una Promesa.                                |
| `response.json()`                       | Parsea el cuerpo de la respuesta HTTP a un objeto o arreglo de JavaScript.                                     |
| `document.querySelector(sel)`           | Retorna el primer elemento del DOM que coincide con el selector CSS.                                           |
| `elemento.addEventListener(evento, fn)` | Registra un escuchador para eventos (`click`, `keydown`, `mouseenter`, `mouseleave`, etc.).                    |
| `event.key`                             | Propiedad del evento de teclado que contiene el valor del caracter presionado (`'t'`, `'d'`, `'Enter'`, etc.). |
| `elemento.classList.toggle('clase')`    | Alterna la presencia de una clase CSS (si existe la quita, si no existe la agrega).                            |
| `elemento.classList.add('clase')`       | Agrega una clase CSS al elemento.                                                                              |
| `elemento.classList.remove('clase')`    | Elimina una clase CSS del elemento.                                                                            |
| `elemento.classList.contains('clase')`  | Devuelve `true` o `false` según el elemento posea o no la clase.                                               |
| `elemento.innerHTML`                    | Obtiene o define el contenido HTML interno de un elemento.                                                     |

---

## ⚠️ Requisitos Obligatorios para la Aprobación

1. ✅ **Consumo Asíncrono de API (Tarea 1)**: Realizar correctamente la consulta a `http://localhost:3000/api/felinos` usando `fetch()` o `async/await`.
2. ✅ **Renderizado Dinámico (Tarea 2)**: Generar dinámicamente las 6 tarjetas de felinos en `.contenedor` con sus etiquetas correspondientes (`.item`, `<img>`, `<h2>`, `<p>`).
3. ✅ **Modo Oscuro con Botón (Tarea 3)**:
   - Configurar los selectores de modo oscuro en `css/styles.css` dependientes de `body.dark`.
   - Alternar la clase `.dark` mediante `document.body.classList.toggle('dark')` al hacer clic en `#btn-theme`.
4. ✅ **Atajo de Teclado (Tarea 4)**: Alternar el tema al presionar las teclas **`T`** o **`D`** con el evento `keydown`.
5. ✅ **Resalte con Ratón (Tarea 5)**: Agregar y remover la clase `.destacada` con `mouseenter` y `mouseleave` en cada tarjeta.
6. ✅ **Zoom de Imagen (Tarea 6)**: Alternar la clase `.expandida` al hacer clic en cualquier `<img>` de felino.
7. ✅ **Código limpio y sin errores**: Sin errores en la consola del navegador ni advertencias no controladas.

---

## 🧪 ¿Cómo ejecuto y pruebo el proyecto?

### 1. Iniciar el Servidor Express Local

Abre una terminal en la carpeta del proyecto y ejecuta:

```bash
npm start
```

El servidor estará escuchando en `http://localhost:3000`. Puedes verificar los datos directamente en tu navegador accediendo a `http://localhost:3000/api/felinos`.

### 2. Abrir la Aplicación en el Navegador

Abre `index.html` en tu navegador (idealmente con la extensión **Live Server** de VS Code) para interactuar con la página y probar los eventos.

---

## 🛠️ Herramientas de editor (ESLint / Prettier / Stylelint)

Este proyecto incluye configuración para el formateo y análisis de calidad de código:

```bash
npm install          # Instalar dependencias (solo la primera vez)
npm start            # Iniciar el servidor Express local
npm run lint         # Revisar JavaScript y CSS
npm run lint:fix     # Corregir errores automáticamente
npm run format       # Formatear todo el código con Prettier
npm run format:check # Verificar formato sin modificar archivos
```

---

## 📚 Recursos Adicionales

- [Introducción a los Eventos - MDN](https://developer.mozilla.org/es/docs/Learn/JavaScript/Building_blocks/Events)
- [Element.classList - MDN](https://developer.mozilla.org/es/docs/Web/API/Element/classList)
- [KeyboardEvent.key - MDN](https://developer.mozilla.org/es/docs/Web/API/KeyboardEvent/key)
- [Eventos del Mouse - MDN](https://developer.mozilla.org/es/docs/Web/API/MouseEvent)
- [Fetch API - MDN](https://developer.mozilla.org/es/docs/Web/API/Fetch_API/Using_Fetch)

---

## 💡 Consejos

1. **Inicia el servidor local primero**: Asegúrate de correr `npm start` para que el endpoint `/api/felinos` esté disponible antes de probar en el navegador.
2. **Inspecciona con la consola (`F12`)**: Usa `console.log()` para verificar que la información de los felinos llegue correctamente antes de intentar renderizarla.
3. **Prueba cada evento por separado**: Prueba primero el botón de tema, luego el atajo de teclado `T`/`D`, y finalmente el paso del ratón y el clic en las imágenes de las tarjetas renderizadas.
4. **Flujo ordenado de commits**: Realiza un commit por cada issue siguiendo los mensajes sugeridos para cerrar las tareas en GitHub Classroom.

---

**¡Éxito con tu ejercitación!** 🐾🚀
