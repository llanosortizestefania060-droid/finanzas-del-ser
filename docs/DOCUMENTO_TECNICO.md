# Documento técnico · Sitio web de Finanzas del Ser

Guía de estudio para la sustentación (5 minutos + 2 preguntas de la docente).
Regla de la docente: **si no puedes explicar una parte del código, no se considera tuya.** Este documento está pensado para que puedas explicar cada parte.

> Estado: sitio funcional con el **branding oficial** (manual de marca de Estefania y Johan). Logo tomado de un PNG; falta el SVG de Illustrator. Ver la sección 9.

---

## 1. El proyecto en 30 segundos

- **Cliente:** Finanzas del Ser, asesoría en finanzas personales (contacto: Valeria Sarabia, WhatsApp 302 345 9096).
- **Qué se construyó:** un sitio de 3 páginas (Inicio —que es la landing con servicios y modalidades—, Quiénes somos y Contacto) en **HTML, CSS y un poco de JavaScript**, sin frameworks.
- **Idea central del diseño:** azules que transmiten confianza; el **amarillo se reserva solo para los botones de acción** (con texto azul profundo), así el usuario encuentra rápido qué hacer. Descriptor de marca: "Estrategia financiera con conciencia".
- **Personalidad de marca:** cercana, consciente, confiable.

---

## 2. Mapa de archivos

```
/
├── index.html            Inicio / landing (hero, 4 servicios, 3 modalidades, frase y CTA)
├── quienes-somos.html    Misión, dilema, objetivo, propuesta de valor
├── contacto.html         Formulario visual, WhatsApp, redes
├── css/styles.css        TODO el estilo (un solo archivo)
├── js/main.js            Menú del celular y mensaje del formulario
├── assets/
│   ├── img/              logos (azul, blanco), favicon, fotos de servicios y modalidades (WebP)
│   └── icons/            íconos SVG de redes: blancos y versión `-oscuro` (azul profundo)
└── docs/DOCUMENTO_TECNICO.md   este documento
```

**Cómo se conectan:** cada página `.html` carga `css/styles.css` en el `<head>` y `js/main.js` al final del `<body>`. El menú de cada página enlaza a las otras tres.

---

## 3. Anatomía de una página HTML

Todas las páginas tienen la misma estructura **semántica**:

| Etiqueta | Para qué sirve | Zona |
|---|---|---|
| `<header class="encabezado">` | Logo, nombre y menú | Encabezado |
| `<nav>` | Menú de navegación | Encabezado |
| `<main id="contenido">` | Contenido propio de cada página | Cuerpo |
| `<section>` | Cada bloque de contenido (hero, servicios, etc.) | Cuerpo |
| `<article class="tarjeta">` | Cada tarjeta de servicio | Cuerpo |
| `<footer class="pie">` | Contacto, redes y año | Pie |

**Por qué etiquetas semánticas:** los lectores de pantalla y los buscadores entienden la estructura, y otro desarrollador lee el código más fácil.

Detalles que conviene saber explicar:

- `lang="es"` indica el idioma de la página.
- `<meta name="viewport" ...>` hace que el sitio se adapte al ancho del celular. **Sin esta línea, la media query no funciona en un teléfono real.**
- `aria-current="page"` marca en el menú la página donde estás (el CSS le da el color de "activo").
- Cada imagen decorativa tiene `alt=""` y las informativas tienen `alt` con descripción.
- El enlace "Saltar al contenido" ayuda a quien navega con teclado.

---

## 4. Decisiones de diseño y su concepto

### 4.1 Color

| Color | HEX | Qué comunica | Dónde se usa |
|---|---|---|---|
| Azul principal | `#127A9E` | Confianza, orden | Fondos del hero y bandas, enlaces, bordes de campos (40 % del sitio) |
| Azul profundo | `#0B4A62` | Seriedad, legibilidad | Texto principal, pie de página, texto de botones (25 %) |
| Azul cielo | `#7DBFD6` | Frescura | Detalles de apoyo: anillo de foco de campos, hover de íconos (20 %) |
| Azul niebla | `#E3F0F5` | Calma, limpieza | Fondos suaves de sección y formulario (10 %) |
| Amarillo | `#FFC72C` (hover `#E6AC00`) | Acción, valor | **Solo botones** y la barra decorativa sobre títulos de tarjeta (5 %) |

- **Armonía:** el azul y el amarillo son casi **complementarios** (opuestos en el círculo cromático): dan contraste y hacen que el botón destaque. Los cuatro azules son **monocromáticos** (un solo tono con distinta luminosidad): dan cohesión. Proporción del manual: 40/25/20/10/5.
- **Por qué RGB/HEX y no CMYK:** las pantallas emiten luz y mezclan rojo, verde y azul. CMYK es para impresión con tintas.
- **Hover:** el amarillo pasa a `#E6AC00` (`--amarillo-hover`); el contorno de campos pasa a azul profundo. Regla del manual: nunca texto amarillo sobre blanco ni texto blanco sobre amarillo (1,56).

**Contraste verificado con la API de WebAIM (valores truncados a 2 decimales, como los muestra su página):**

| Combinación | Ratio | Resultado |
|---|---|---|
| Azul profundo sobre blanco (texto) | 9,68 | AA y AAA |
| Azul profundo sobre amarillo `#FFC72C` (botón) | 6,20 | AA |
| Azul profundo sobre amarillo hover `#E6AC00` | 4,73 | AA |
| Blanco sobre azul principal `#127A9E` | 4,88 | AA |
| Blanco sobre azul profundo `#0B4A62` (pie) | 9,68 | AA y AAA |
| Azul profundo sobre azul niebla `#E3F0F5` | 8,32 | AA y AAA |
| Azul profundo sobre azul cielo `#7DBFD6` | 4,74 | AA |
| Amarillo sobre azul principal (límite del botón) | 3,13 | Cumple 3:1 de componentes |

Valores calculados con la fórmula WCAG (ratio = (L1+0,05)/(L2+0,05)). **Pendiente:** repetir 2 o 3 combinaciones en webaim.org/resources/contrastchecker y tomar captura. El azul principal sobre niebla da 4,19: por eso no se usa para texto pequeño sobre niebla (el texto va en azul profundo).


### 4.2 Tipografía

| Uso | Fuente | Familia | Personalidad |
|---|---|---|---|
| Todo el sitio | **Poppins** (pesos 300, 400, 500, 700) | Sans serif geométrica | Moderna, amable, redondeada |


- **Una sola familia (lo pide el manual y el enunciado permite máx. 2):** la jerarquía se logra con **peso y tamaño**, no con otra fuente: 700 títulos, 500 subtítulos y botones, 400 párrafos, 300 texto pequeño.
- **Por qué sans serif en pantalla:** a tamaños pequeños y con baja resolución, los remates de las serif se pierden; las sans serif se leen más limpio.
- Los trazos manuscritos del logo son parte de la imagen, no una fuente del sitio.

**Jerarquía (igual en las 3 páginas, definida con variables):**

| Elemento | Tamaño | Peso | Celular (≤720 px) |
|---|---|---|---|
| H1 | 2,5 rem (40 px) | 700 | 2 rem (32 px) |
| H2 | 1,75 rem (28 px) | 700 | 1,5 rem (24 px) |
| H3 | 1,25 rem (20 px) | 500 | igual |
| Párrafo | 1 rem (16 px) | 400 | igual |
| Texto pequeño | 0,8125 rem (13 px) | 300 | igual |

- **Interlineado 1,6** en el texto: el espacio entre líneas evita que el ojo se pierda al pasar de una línea a otra.
- Se usa `rem` (no `px`) para que el tamaño respete la configuración del usuario.

### 4.3 Formas, balance, peso y dirección visual

- **Formas:** esquinas redondeadas de 20 px (`--radio`) en tarjetas y formularios, y botones en forma de píldora. Comunica cercanía. Cada tarjeta lleva una **barra amarilla** sobre el título (sello del manual).
- **Balance del Home: asimétrico.** El texto ocupa más ancho (columna izquierda, `1.1fr`) y la imagen menos (`0.9fr`). Es más dinámico que un diseño simétrico y deja claro dónde leer primero.
- **Peso visual (qué ve primero el usuario):**
  1. El **titular H1** (grande, blanco y en negrita sobre el azul principal).
  2. El **botón amarillo** (único color cálido de la pantalla, por eso destaca).
- **Dirección visual:** etiqueta → H1 → párrafo → **botón amarillo**. La lectura de izquierda a derecha y de arriba hacia abajo termina en el botón principal. La imagen de barras que sube refuerza la idea de crecimiento.

### 4.4 Principios de Gestalt

| Principio | Dónde está | Para qué le sirve al usuario |
|---|---|---|
| **Semejanza** | Todos los botones principales son amarillos con la misma forma; las 4 tarjetas de servicio y las 3 de modalidades comparten el mismo estilo | Reconoce de inmediato qué se puede presionar y que los servicios son del mismo nivel |
| **Proximidad** | Dentro de cada tarjeta: ícono, título y texto están juntos y separados de otras tarjetas por `gap` | Entiende que ese ícono, título y texto forman un solo servicio |
| **Continuidad** | Los links del menú en una línea horizontal; la lectura del hero hacia el botón | El ojo sigue la línea sin esfuerzo |
| **Figura-fondo** | Texto blanco sobre el azul principal; tarjetas blancas sobre fondo claro | Separa lo importante del fondo |

Si la docente pregunta "¿qué Gestalt aplicaste en el menú?": **proximidad** (los links están juntos, separados del logo), **semejanza** (mismo estilo y tipografía) y **continuidad** (alineados en una línea).

### 4.5 UX y UI

**Usuario tipo (ficticio):** Camila, 29 años, empleada, siente que su dinero "se le va" y quiere ordenar sus gastos. Busca saber si la asesoría es para ella y cómo agendar.

**Ruta principal (máximo 3 clics):**

1. Llega a **Inicio** y lee el titular.
2. Clic en **"Agenda tu cita"** (abre WhatsApp con un mensaje ya escrito). → **1 clic**.

**Ruta alternativa:** Inicio → bajar a Servicios (scroll) → "Agenda tu cita" (1 clic).

**UI (consistencia):**

- Menú y pie de página iguales en las 3 páginas.
- Un solo estilo de botón por tipo (`.boton--principal`, `.boton--secundario`).
- **Hover:** el botón amarillo se oscurece y sube 2 px; las tarjetas suben 4 px; el menú muestra una línea amarilla.
- La página actual se marca en el menú, así el usuario siempre sabe dónde está.
- Foco visible (contorno azul profundo; blanco sobre fondos azules) para quien usa teclado.
- **Botón flotante de WhatsApp:** círculo amarillo con ícono azul profundo fijo en la esquina inferior derecha de todas las páginas (`position: fixed`). Da acceso a la acción principal desde cualquier punto del recorrido, sin volver al menú. Su verde `#0E7A6D` tiene contraste 5,21:1 con el ícono blanco y lleva un borde blanco para distinguirse del pie oscuro. En celular el pie tiene espacio extra abajo para que el botón no tape el texto legal.

---

## 5. Cómo se construyó el CSS (para explicarlo)

### 5.1 Variables CSS: la idea más importante

Toda la identidad está en un solo bloque, `:root`, al inicio del archivo:

```css
:root {
  --azul-principal: #127A9E;
  --amarillo: #FFC72C;
  --fuente: "Poppins", Arial, sans-serif;
  --tam-h1: 2.5rem;
  /* ... */
}
```

Después se usan con `var(--azul)`. **Ventaja:** para cambiar un color en todo el sitio, se cambia en un solo lugar. Cuando llegue la identidad final del compañero, solo se editan estas variables.

### 5.2 Flexbox vs Grid

| Herramienta | Cuándo | Dónde se usó |
|---|---|---|
| **Flexbox** (una dimensión: fila o columna) | Alinear elementos en línea | Barra del encabezado, menú, grupo de botones, íconos de redes |
| **Grid** (dos dimensiones: filas y columnas) | Repartir bloques en columnas | Hero (2 columnas), tarjetas (4, 2 o 1 columnas), contacto, pie de página |

### 5.3 Diseño responsivo (media queries)

Hay **dos puntos de quiebre**:

| Ancho | Qué cambia |
|---|---|
| **≤ 900 px** (tablet) | Las tarjetas pasan de 4 a **2 columnas**; hero, contacto y pie se apilan en 1 columna |
| **≤ 720 px** (celular) | Tarjetas en **1 columna**; aparece el botón **Menú** y los links se vuelven una lista vertical; los títulos se reducen |

El truco del celular: en el bloque de 720 px se **redefinen las variables** `--tam-h1` y `--tam-h2`, y todo el sitio se ajusta solo.

### 5.3b Contenido de la landing (de la landing y el docx de tu compañero)

- **Home:** titular "Transforma tu relación con el dinero con guía y propósito", foto del frasco con planta, 4 tarjetas de servicios (el cuarto es **Servicios empresariales**), 3 modalidades, la frase "Todo lo que construyes…" y botón "Contáctanos".
- **Quiénes somos:** quiénes somos, misión, visión, propuesta de valor, 4 valores (Respeto, Confidencialidad, Responsabilidad, Transparencia) e historia (2024, mujeres cabeza de hogar).
- **Contacto:** formulario con casilla de autorización de datos, Valeria Sarabia, WhatsApp 302 345 9096, correo finanzas.vse@gmail.com e Instagram.
- Los enlaces del menú son 3, así que el menú del celular cabe sin cambios.

### 5.4 Cómo probar el responsivo

Clic derecho → **Inspeccionar** (F12) → ícono de dispositivo móvil → elegir un celular.

---

## 6. JavaScript (`js/main.js`, 28 líneas)

Solo hace dos cosas:

1. **Menú del celular:** al hacer clic en "Menú" agrega o quita la clase `nav--abierto` y actualiza `aria-expanded` (avisa a lectores de pantalla). El CSS decide qué se ve.
2. **Formulario:** `preventDefault()` evita que la página se recargue, muestra un mensaje y limpia los campos. **No envía datos a ningún servidor**: el enunciado pide el formulario solo visual.

---

## 7. ¿Dónde está en el código? (para las preguntas de la docente)

| Si te piden... | Ve a... |
|---|---|
| La paleta de colores | `css/styles.css`, líneas 17 a 55 (`:root`) |
| Las fuentes | `css/styles.css` línea ~31 (variable `--fuente`) y el `<link>` de Google Fonts en el `<head>` de cada HTML |
| La jerarquía H1, H2, párrafo | `css/styles.css`, líneas ~75 a 78 y variables `--tam-*` |
| El interlineado | `css/styles.css` `--interlineado: 1.6` en `:root` |
| El menú con Flexbox | `css/styles.css`, líneas ~103 a 150 |
| Las tarjetas con Grid | `css/styles.css`, línea 225 (`.tarjetas`) |
| El hero asimétrico | `css/styles.css`, línea 185 (`.hero__grid`) |
| El botón amarillo y su hover | `css/styles.css`, líneas 168 y 169 |
| El hover del menú | `css/styles.css`, línea 136 |
| La página activa del menú | `css/styles.css` línea 137 y `aria-current="page"` en cada HTML |
| La media query | `css/styles.css`, líneas 384 y 392 |
| El menú del celular | `js/main.js` y `css/styles.css` línea 392 en adelante |
| El botón flotante de WhatsApp | `css/styles.css`, línea 363 (`.wpp-flotante`) y el `<a class="wpp-flotante">` al final de cada HTML |
| El formulario | `contacto.html` y `js/main.js` |

> Las líneas son aproximadas: si se edita el CSS, se desplazan. Para ubicarlas rápido, usa **Ctrl+F** con el nombre de la clase.

---

## 8. Guion de sustentación (5 minutos)

| Minuto | Qué hacer | Qué decir |
|---|---|---|
| 1 | Presentar empresa y usuario tipo | "Finanzas del Ser ayuda a personas a gestionar su dinero de forma consciente. Mi usuario tipo es Camila, 29 años, que quiere ordenar sus gastos." |
| 2 a 3 | Navegar el sitio en vivo: computador y luego celular (F12) | Recorrer las 3 páginas; mostrar el menú, el hover del botón, el cambio de 4 a 2 a 1 columnas y el menú Menú del celular |
| 4 a 5 | Explicar **3 decisiones** | 1) Color: amarillo solo en acciones (complementario al azul). 2) Tipografía: Poppins como única fuente y jerarquía con variables. 3) Gestalt/UX: semejanza en botones y llegar a agendar en 1 clic |

**Preguntas probables y respuesta corta:**

- **¿Por qué el botón es amarillo?** Es el único color cálido y es casi complementario al azul: genera contraste y peso visual, así el usuario encuentra rápido la acción. Además el texto oscuro sobre dorado da 7,79:1.
- **¿Por qué `rem` y no `px`?** Respeta el tamaño de letra que el usuario configuró en su navegador.
- **¿Para qué sirven las variables CSS?** Para cambiar la identidad en un solo lugar y mantener consistencia.
- **¿Qué hace la media query?** Cuando la pantalla es de 900 px o menos reorganiza el diseño; con 720 px o menos pasa a una columna y activa el menú del celular.
- **¿Por qué el logo debe ser vectorial?** Porque se define con fórmulas matemáticas (puntos y curvas), no con píxeles: se puede agrandar sin pixelarse.
- **¿Por qué esos formatos de imagen?** SVG para logo e íconos (vectorial, liviano); WebP o JPG para fotos (menos peso, carga más rápido); PNG solo si se necesita fondo transparente.
- **¿Cómo cuidaste la accesibilidad?** Contraste AA, `alt` en imágenes, foco visible, enlace para saltar al contenido, `aria-current` y `aria-expanded`.

---

## 9. Estado actual y pendientes

**Por reemplazar cuando el compañero entregue los originales:**

- [ ] Logo en **SVG** hecho en Illustrator (hoy es un PNG recortado de 276 px: `assets/img/logo-azul.png` y `logo-blanco.png`; el enunciado exige SVG)
- [ ] Una imagen **editada en Photoshop** (WebP o JPG, menos de 500 KB) y la captura de ese proceso para el manual
- [ ] Fotos de servicios en mayor resolución (hoy son recortes de 406 px de los banners)
- [ ] Texto de "Acompañamiento de grupos": hoy repite "En sesiones personalizadas." igual que 1:1 (probable error de copia)
- [ ] Confirmar el usuario exacto de Instagram (el docx dice `@finanzas.del ser` con espacio; el sitio usa `@finanzas.delser`) y que el teléfono de Valeria pueda mostrarse
- [ ] Borrar archivos sin uso: `assets/icons/presupuesto.svg`, `ahorro.svg`, `compras.svg`, `educacion.svg`, `assets/img/logo-provisional.svg` y `hero-provisional.svg`

**Por cerrar:**

- [ ] Capturas de WebAIM con al menos 2 combinaciones
- [ ] Capturas numeradas del sitio para el manual
- [ ] Citar créditos de las fotos e ilustraciones usadas
- [ ] Declarar el uso de IA en las referencias del manual
- [ ] Publicar en GitHub Pages o Netlify Drop (opcional)

**Cómo cambiar la identidad final:** reemplaza los archivos de `assets/img/` con el mismo nombre (o actualiza el `src` en los HTML) y ajusta las variables de `:root`.

---

## 10. Glosario rápido

- **Semántico:** que la etiqueta describe su función (`header`, `nav`, `footer`).
- **Flexbox / Grid:** sistemas de CSS para organizar elementos en fila o en cuadrícula.
- **Media query:** regla CSS que aplica estilos solo a ciertos anchos de pantalla.
- **Variable CSS:** valor guardado con nombre (`--azul`) para reutilizarlo.
- **Hover:** estado cuando el mouse pasa sobre un elemento.
- **Contraste AA:** ratio mínimo de 4,5:1 entre texto y fondo (3:1 para texto grande y componentes).
- **Vectorial:** gráfico hecho de formas matemáticas que no se pixela al agrandar.
- **Wireframe:** boceto de la estructura de una página.
- **Responsivo:** que el diseño se adapta al tamaño de pantalla.
