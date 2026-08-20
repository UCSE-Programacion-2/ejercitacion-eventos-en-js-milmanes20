#!/usr/bin/env bash
# Verificaciones automáticas — Eventos en JS, classList y Consumo de APIs.
# Cada subcomando valida un criterio del ejercicio sobre el código fuente.
set -u

HTML="index.html"
JS="js/script.js"
CSS="css/styles.css"

fail() {
  echo "$1" >&2
  exit 1
}

ok() {
  echo CORRECTO
}

# Devuelve el JS sin líneas que son solo comentarios (evita falsos positivos
# con los comentarios-stub que ya trae la plantilla).
clean_js() {
  grep -v '^\s*//' "$JS"
}

case "${1:-}" in
  link-css-js)
    [[ -f "$HTML" ]] || fail "No se encontró index.html en la raíz del proyecto."
    [[ -f "$CSS" ]]  || fail "No se encontró el archivo css/styles.css."
    [[ -f "$JS" ]]   || fail "No se encontró el archivo js/script.js."
    # Verificar <link> al CSS
    grep -qiE '<link[^>]*href=["'"'"'].*css/styles\.css["'"'"']' "$HTML" \
      || fail "Falta vincular el archivo css/styles.css con una etiqueta <link> en el <head> del HTML."
    # Verificar <script> al JS
    grep -qiE '<script[^>]*src=["'"'"'].*js/script\.js["'"'"']' "$HTML" \
      || fail "Falta vincular el archivo js/script.js con una etiqueta <script> en el HTML."
    ok
    ;;
  fetch-api)
    [[ -f "$JS" ]] || fail "No se encontró el archivo js/script.js."
    js_code="$(clean_js)"
    # Verificar uso de fetch o async/await
    if echo "$js_code" | grep -qiE 'fetch\s*\('; then
      : # ok, usa fetch
    elif echo "$js_code" | grep -qiE 'async.*await'; then
      : # ok, usa async/await
    else
      fail "No se encontró la llamada a la API usando fetch() o async/await en js/script.js."
    fi
    # Verificar conversión a JSON
    echo "$js_code" | grep -qiE '\.json\s*\(' \
      || fail "No se encontró la conversión de la respuesta con .json() en js/script.js."
    ok
    ;;
  render-felinos)
    [[ -f "$JS" ]] || fail "No se encontró el archivo js/script.js."
    js_code="$(clean_js)"
    # Verificar selección del contenedor de felinos
    echo "$js_code" | grep -qiE '(querySelector|getElementsByClassName|getElementById)\s*\(\s*["'"'"'].*contenedor.*["'"'"']\s*\)' \
      || fail "No se encontró la selección del elemento .contenedor en el DOM."
    # Verificar manipulación del DOM (innerHTML, appendChild, createElement, insertAdjacentHTML)
    if echo "$js_code" | grep -qiE '(innerHTML|appendChild|createElement|insertAdjacentHTML|textContent)'; then
      : # ok
    else
      fail "No se encontró código que inserte elementos en el DOM dentro de renderizarFelinos."
    fi
    # Verificar acceso a campos del felino (titulo, descripcion, imagen, img)
    if echo "$js_code" | grep -qiE '(titulo|descripcion|imagen|img|title|description)'; then
      : # ok
    else
      fail "No se encontró acceso a los campos del felino (titulo, descripcion, imagen) en el código JS."
    fi
    ok
    ;;
  toggle-theme)
    [[ -f "$HTML" ]] || fail "No se encontró index.html."
    [[ -f "$JS" ]]   || fail "No se encontró js/script.js."
    [[ -f "$CSS" ]]  || fail "No se encontró css/styles.css."
    js_code="$(clean_js)"
    # Verificar selección del botón #btn-theme
    echo "$js_code" | grep -qiE '(querySelector|getElementById)\s*\(\s*["'"'"'].*btn-theme.*["'"'"']\s*\)' \
      || fail "No se encontró la selección del botón #btn-theme en js/script.js."
    # Verificar evento click
    if echo "$js_code" | grep -qiE 'addEventListener\s*\(\s*["'"'"']click["'"'"']'; then
      : # ok, addEventListener click
    elif echo "$js_code" | grep -qiE 'onclick\s*='; then
      : # ok, onclick
    else
      fail "No se encontró el evento click vinculado al botón de cambio de tema."
    fi
    # Verificar uso de classList con 'dark'
    if echo "$js_code" | grep -qiE 'classList\.(toggle|add|remove)\s*\(\s*["'"'"']dark["'"'"']\s*\)'; then
      : # ok
    else
      fail "No se encontró el uso de classList.toggle('dark') (o classList.add/remove) para alternar el tema."
    fi
    # Verificar que en styles.css se hayan configurado selectores con .dark
    grep -qiE '(\.dark\b|body\.dark)' "$CSS" \
      || fail "No se encontraron reglas con la clase .dark en css/styles.css."
    ok
    ;;
  keyboard-theme)
    [[ -f "$JS" ]] || fail "No se encontró js/script.js."
    js_code="$(clean_js)"
    # Verificar escucha de evento keydown / keyup / keypress
    if echo "$js_code" | grep -qiE 'addEventListener\s*\(\s*["'"'"'](keydown|keyup|keypress)["'"'"']'; then
      : # ok
    elif echo "$js_code" | grep -qiE 'on(keydown|keyup|keypress)\s*='; then
      : # ok
    else
      fail "No se encontró el escuchador para el evento 'keydown' (o keyup/keypress) para el atajo de teclado."
    fi
    # Verificar comprobación de tecla ('t', 'd', key, code)
    if echo "$js_code" | grep -qiE '(key|code|which|keyCode)\b'; then
      : # ok
    else
      fail "No se encontró la evaluación de la tecla presionada (ej. event.key === 't' o 'd')."
    fi
    # Verificar alternancia de clase dark
    if echo "$js_code" | grep -qiE 'classList\.(toggle|add|remove)\s*\(\s*["'"'"']dark["'"'"']\s*\)'; then
      : # ok
    else
      fail "No se encontró la alternancia de la clase 'dark' con classList en el atajo de teclado."
    fi
    ok
    ;;
  card-hover)
    [[ -f "$JS" ]]  || fail "No se encontró js/script.js."
    [[ -f "$CSS" ]] || fail "No se encontró css/styles.css."
    js_code="$(clean_js)"
    # Verificar escuchadores mouseenter/mouseleave o mouseover/mouseout
    if echo "$js_code" | grep -qiE 'addEventListener\s*\(\s*["'"'"'](mouseenter|mouseover)["'"'"']'; then
      : # ok
    elif echo "$js_code" | grep -qiE 'on(mouseenter|mouseover)\s*='; then
      : # ok
    else
      fail "No se encontró el evento 'mouseenter' o 'mouseover' para resaltar la tarjeta."
    fi
    if echo "$js_code" | grep -qiE 'addEventListener\s*\(\s*["'"'"'](mouseleave|mouseout)["'"'"']'; then
      : # ok
    elif echo "$js_code" | grep -qiE 'on(mouseleave|mouseout)\s*='; then
      : # ok
    else
      fail "No se encontró el evento 'mouseleave' o 'mouseout' para quitar el resalte de la tarjeta."
    fi
    # Verificar uso de clase 'destacada'
    if echo "$js_code" | grep -qiE 'classList\.(add|toggle|remove)\s*\(\s*["'"'"']destacada["'"'"']\s*\)'; then
      : # ok
    else
      fail "No se encontró el uso de classList con la clase 'destacada' en los eventos de ratón."
    fi
    # Verificar que styles.css contenga .destacada
    grep -qiE '\.destacada\b' "$CSS" \
      || fail "No se encontró la clase .destacada definida en css/styles.css."
    ok
    ;;
  img-zoom)
    [[ -f "$JS" ]]  || fail "No se encontró js/script.js."
    [[ -f "$CSS" ]] || fail "No se encontró css/styles.css."
    js_code="$(clean_js)"
    # Verificar escuchador de click para la imagen
    if echo "$js_code" | grep -qiE 'addEventListener\s*\(\s*["'"'"']click["'"'"']'; then
      : # ok
    elif echo "$js_code" | grep -qiE 'onclick\s*='; then
      : # ok
    else
      fail "No se encontró el evento click para la imagen del felino."
    fi
    # Verificar uso de clase 'expandida'
    if echo "$js_code" | grep -qiE 'classList\.(toggle|add|remove)\s*\(\s*["'"'"']expandida["'"'"']\s*\)'; then
      : # ok
    else
      fail "No se encontró el uso de classList.toggle('expandida') para el zoom de la imagen."
    fi
    # Verificar que styles.css contenga .expandida
    grep -qiE '\.expandida\b' "$CSS" \
      || fail "No se encontró la clase .expandida definida en css/styles.css."
    ok
    ;;
  *)
    echo "Prueba automática no reconocida. Avisale al docente." >&2
    exit 2
    ;;
esac
