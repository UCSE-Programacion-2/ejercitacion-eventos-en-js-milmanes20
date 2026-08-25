// =============================================================================
// EJERCITACIÓN: EVENTOS EN JS Y CONSUMO DE APIS - LA FAMILIA DE LOS FELINOS
// =============================================================================

// Endpoint de la API local de felinos
const API_URL = 'http://localhost:3000/api/felinos';

// -----------------------------------------------------------------------------
// TAREA 1: Consumir la API de felinos con fetch
// -----------------------------------------------------------------------------
// Realiza una petición asíncrona a API_URL usando fetch() o async/await.
// Convierte la respuesta a formato JSON e invoca a renderizarFelinos(felinos).

async function obtenerFelinos() {
  // TODO: Escribe aquí la petición fetch() a la API local de felinos
  // 1. fetch(API_URL)
  // 2. response.json()
  // 3. renderizarFelinos(datos)
  try {
    const response = await fetch(API_URL);
    if (!response.ok) {
      throw new Error(`Error en la petición: ${response.status}`);
    }
    const datos = await response.json();
    renderizarFelinos(datos);
  } catch (error) {
    console.error('Error al obtener los felinos:', error);
  }
}

// -----------------------------------------------------------------------------
// TAREA 2: Renderizar las tarjetas de felinos en el DOM
// -----------------------------------------------------------------------------
// Recorre el arreglo de felinos y renderiza cada uno dentro de .contenedor.
// Cada tarjeta debe tener la siguiente estructura:
// <div class="item">
//   <img src="[imagen]">
//   <h2>[titulo]</h2>
//   <p>[descripcion]</p>
// </div>
// Además, vincula los eventos de las tareas 5 y 6 a cada tarjeta e imagen.

function renderizarFelinos(felinos) {
  // TODO: Selecciona el contenedor con document.querySelector('.contenedor')
  // y renderiza cada felino con su imagen, título y descripción.
  // Recuerda vincular los eventos de resalte (Tarea 5) y zoom de imagen (Tarea 6).
  /*const contenedor = document.querySelector('.contenedor');
  felinos.forEach((felino) => {
    const tarjeta = document.createElement('div');
    tarjeta.classList.add('item');

    const imagen = document.createElement('img');
    imagen.src = felino.imagen;
    imagen.alt = felino.titulo;

    const titulo = document.createElement('h2');
    titulo.textContent = felino.titulo;

    const descripcion = document.createElement('p');
    descripcion.textContent = felino.descripcion;

    tarjeta.appendChild(imagen);
    tarjeta.appendChild(titulo);
    tarjeta.appendChild(descripcion);

    // Vincular eventos de resalte y zoom
    agregarEfectoResalte(tarjeta);
    agregarEfectoZoom(imagen);

    contenedor.appendChild(tarjeta);
  });*/
  const contenedor = document.querySelector('.contenedor');
  contenedor.innerHTML = '';

  felinos.forEach((felino) => {
    const tarjeta = document.createElement('div');
    tarjeta.classList.add('item');

    tarjeta.innerHTML = `
      <img src="${felino.imagen}" alt="${felino.titulo}">
      <h2>${felino.titulo}</h2>
      <p>${felino.descripcion}</p>
    `;

    // Vincular eventos visuales
    agregarEfectoResalte(tarjeta);

    const imagen = tarjeta.querySelector('img');
    agregarEfectoZoom(imagen);

    contenedor.appendChild(tarjeta);
  });
}

// -----------------------------------------------------------------------------
// TAREA 3: Alternar tema claro / oscuro con botón (#btn-theme)
// -----------------------------------------------------------------------------
// Selecciona el botón #btn-theme y escucha el evento 'click'.
// Al hacer clic, alterna la clase 'dark' en document.body usando classList.toggle.

function inicializarBotonTema() {
  // TODO: Selecciona #btn-theme y agrega addEventListener para 'click'
  // alternando document.body.classList.toggle('dark')
}

// -----------------------------------------------------------------------------
// TAREA 4: Atajo de teclado para alternar el tema (keydown)
// -----------------------------------------------------------------------------
// Escucha el evento 'keydown' en la ventana (window o document).
// Si el usuario presiona la tecla 't' o 'd' (mayúscula o minúscula),
// alterna la clase 'dark' en document.body con classList.toggle('dark').

function inicializarAtajoTeclado() {
  // TODO: Agrega addEventListener('keydown', (e) => ...) en window o document
  // Comprueba si e.key es 't', 'T', 'd' o 'D' y alterna la clase 'dark'
}

// -----------------------------------------------------------------------------
// TAREA 5: Efecto de resalte en tarjetas (mouseenter / mouseleave)
// -----------------------------------------------------------------------------
// Agrega escuchadores a cada tarjeta (.item):
// - 'mouseenter' (o 'mouseover'): agrega la clase 'destacada' con classList.add
// - 'mouseleave' (o 'mouseout'): remueve la clase 'destacada' con classList.remove

function agregarEfectoResalte(tarjeta) {
  // TODO: Agregar eventos mouseenter y mouseleave a la tarjeta
}

// -----------------------------------------------------------------------------
// TAREA 6: Zoom / Expansión de imagen al hacer clic (click)
// -----------------------------------------------------------------------------
// Agrega un escuchador de evento 'click' a la etiqueta <img> de la tarjeta.
// Al hacer clic sobre la foto, alterna la clase 'expandida' con classList.toggle.

function agregarEfectoZoom(imagen) {
  // TODO: Agregar evento click a la imagen alternando la clase 'expandida'
}

// Inicialización de la aplicación al cargar
obtenerFelinos();
inicializarBotonTema();
inicializarAtajoTeclado();
