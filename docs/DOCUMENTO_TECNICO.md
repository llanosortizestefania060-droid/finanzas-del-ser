# Documento técnico · Sitio web de Finanzas del Ser

Guía de estudio para la sustentación (5 minutos + 2 preguntas de la docente).
Regla de la docente: **si no puedes explicar una parte del código, no se considera tuya.** Este documento está pensado para que puedas explicar cada parte.

> Estado: sitio funcional con **logo e imagen del hero provisionales**. Ver la sección 9 para lo que falta.

---

## 1. El proyecto en 30 segundos

- **Cliente:** Finanzas del Ser, asesoría en finanzas personales (contacto: Estefania Llanos y Johan Morales, WhatsApp 301 788 5453).
- **Qué se construyó:** un sitio de 4 páginas (Inicio, Servicios, Quiénes somos, Contacto) en **HTML, CSS y un poco de JavaScript**, sin frameworks.
- **Idea central del diseño:** azul y turquesa transmiten confianza; el **dorado se reserva solo para los botones de acción**, así el usuario encuentra rápido qué hacer.
- **Personalidad de marca:** cercana, consciente, confiable.

---

## 2. Mapa de archivos

```
/
├── index.html            Inicio (hero, servicios, propuesta de valor)
├── servicios.html        4 tarjetas de servicios
├── quienes-somos.html    Misión, dilema, objetivo, propuesta de valor
├── contacto.html         Formulario visual, WhatsApp, redes
├── css/styles.css        TODO el estilo (un solo archivo)
├── js/main.js            Menú del celular y mensaje del formulario
├── assets/
│   ├── img/              logo-provisional.svg, hero-provisional.svg
│   └── icons/            íconos SVG de servicios y redes
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
| Azul | `#117AAD` | Confianza, orden | Logo, títulos de marca, fondos de bandas, enlaces |
| Turquesa | `#078294` | Crecimiento, equilibrio | Final del degradado del hero, banda de llamado a la acción, íconos de redes en el pie |
| Oscuro | `#12303F` | Seriedad, legibilidad | Texto principal y pie de página |
| Claro | `#F3F9FB` | Limpieza, calma | Fondos suaves de sección |
| Dorado | `#F4B93A` | Acción, valor (monedas) | **Solo botones principales** |

- **Armonía:** el azul y el dorado son casi **complementarios** (opuestos en el círculo cromático): dan contraste y hacen que el botón destaque. El turquesa es **análogo** al azul (vecino): da cohesión. *(Verifica la posición exacta en Adobe Color antes de escribirlo en el manual.)*
- **Por qué RGB/HEX y no CMYK:** las pantallas emiten luz y mezclan rojo, verde y azul. CMYK es para impresión con tintas.
- **Colores de hover:** `--azul-hover` y `--dorado-hover` son versiones más oscuras del mismo color, para que el cambio se note sin cambiar de identidad.

**Contraste verificado (fórmula WCAG; confirmar con WebAIM y guardar captura):**

| Combinación | Ratio | Resultado |
|---|---|---|
| Texto oscuro sobre blanco | 13,81 | AA y AAA |
| Texto oscuro sobre dorado (botón) | 7,79 | AA y AAA |
| Blanco sobre azul `#117AAD` | 4,76 | AA |
| Blanco sobre turquesa `#078294` | 4,54 | AA (justo) |
| Texto suave `#3F5666` sobre blanco | 7,68 | AA y AAA |

Los ratios de azul y turquesa están cerca de 4,5: **no se deben aclarar** esos colores sin volver a medir.
Se corrigieron dos casos que fallaban: el borde de los campos del formulario (ahora `--borde-campo`, mínimo 3:1 para componentes) y el mensaje de envío (ahora `--azul-hover`).

### 4.2 Tipografía

| Uso | Fuente | Familia | Personalidad |
|---|---|---|---|
| Títulos y botones | **Poppins** | Sans serif geométrica | Moderna, amable, redondeada |
| Texto corrido | **Nunito Sans** | Sans serif humanista | Cálida, muy legible en pantalla |

- **Por qué combinan:** ambas son sans serif, pero Poppins es más geométrica y pesada (para destacar) y Nunito Sans es más suave y ligera (para leer). Hay **contraste de peso, no competencia** entre dos fuentes parecidas.
- **Por qué sans serif en pantalla:** a tamaños pequeños y con baja resolución, los remates de las serif se pierden; las sans serif se leen más limpio.
- La fuente manuscrita del portafolio original **no se usa en el sitio** (el enunciado permite máximo 2 fuentes): solo debería vivir dentro del logo.

**Jerarquía (igual en las 4 páginas, definida con variables):**

| Elemento | Tamaño | Peso | Celular (≤720 px) |
|---|---|---|---|
| H1 | 2,5 rem (40 px) | 700 | 2 rem (32 px) |
| H2 | 1,75 rem (28 px) | 600 | 1,5 rem (24 px) |
| H3 | 1,25 rem (20 px) | 600 | igual |
| Párrafo | 1 rem (16 px) | 400 | igual |
| Texto pequeño | 0,875 rem (14 px) | 400 | igual |

- **Interlineado 1,6** en el texto: el espacio entre líneas evita que el ojo se pierda al pasar de una línea a otra.
- Se usa `rem` (no `px`) para que el tamaño respete la configuración del usuario.

### 4.3 Formas, balance, peso y dirección visual

- **Formas:** esquinas redondeadas (`--radio: 16px`) en tarjetas y formularios, y botones en forma de píldora. Comunican cercanía y amabilidad, que es la personalidad de la marca.
- **Balance del Home: asimétrico.** El texto ocupa más ancho (columna izquierda, `1.1fr`) y la imagen menos (`0.9fr`). Es más dinámico que un diseño simétrico y deja claro dónde leer primero.
- **Peso visual (qué ve primero el usuario):**
  1. El **titular H1** (grande, blanco y en negrita sobre el degradado).
  2. El **botón dorado** (único color cálido de la pantalla, por eso destaca).
- **Dirección visual:** etiqueta → H1 → párrafo → **botón dorado**. La lectura de izquierda a derecha y de arriba hacia abajo termina en el botón principal. La imagen de barras que sube refuerza la idea de crecimiento.

### 4.4 Principios de Gestalt

| Principio | Dónde está | Para qué le sirve al usuario |
|---|---|---|
| **Semejanza** | Todos los botones principales son dorados con la misma forma; las 4 tarjetas son iguales | Reconoce de inmediato qué se puede presionar y que los servicios son del mismo nivel |
| **Proximidad** | Dentro de cada tarjeta: ícono, título y texto están juntos y separados de otras tarjetas por `gap` | Entiende que ese ícono, título y texto forman un solo servicio |
| **Continuidad** | Los links del menú en una línea horizontal; la lectura del hero hacia el botón | El ojo sigue la línea sin esfuerzo |
| **Figura-fondo** | Texto blanco sobre el degradado azul; tarjetas blancas sobre fondo claro | Separa lo importante del fondo |

Si la docente pregunta "¿qué Gestalt aplicaste en el menú?": **proximidad** (los links están juntos, separados del logo), **semejanza** (mismo estilo y tipografía) y **continuidad** (alineados en una línea).

### 4.5 UX y UI

**Usuario tipo (ficticio):** Camila, 29 años, empleada, siente que su dinero "se le va" y quiere ordenar sus gastos. Busca saber si la asesoría es para ella y cómo agendar.

**Ruta principal (máximo 3 clics):**

1. Llega a **Inicio** y lee el titular.
2. Clic en **"Agenda tu asesoría"** (abre WhatsApp con un mensaje ya escrito). → **1 clic**.

**Ruta alternativa:** Inicio → Servicios (1 clic) → "Agenda tu asesoría" (2 clics).

**UI (consistencia):**

- Menú y pie de página iguales en las 4 páginas.
- Un solo estilo de botón por tipo (`.boton--principal`, `.boton--secundario`).
- **Hover:** el botón dorado se oscurece y sube 2 px; las tarjetas suben 4 px; el menú muestra una línea dorada.
- La página actual se marca en el menú, así el usuario siempre sabe dónde está.
- Foco visible (borde dorado) para quien usa teclado.
- **Botón flotante de WhatsApp:** círculo verde fijo en la esquina inferior derecha de todas las páginas (`position: fixed`). Da acceso a la acción principal desde cualquier punto del recorrido, sin volver al menú. Su verde `#0E7A6D` tiene contraste 5,22:1 con el ícono blanco y lleva un borde blanco para distinguirse del pie oscuro. En celular el pie tiene espacio extra abajo para que el botón no tape el texto legal.

---

## 5. Cómo se construyó el CSS (para explicarlo)

### 5.1 Variables CSS: la idea más importante

Toda la identidad está en un solo bloque, `:root`, al inicio del archivo:

```css
:root {
  --azul: #117AAD;
  --dorado: #F4B93A;
  --fuente-titulos: "Poppins", Arial, sans-serif;
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
| La paleta de colores | `css/styles.css`, líneas 16 a 48 (`:root`) |
| Las fuentes | `css/styles.css` líneas 32 y 33 (variables `--fuente-*`) y el `<link>` de Google Fonts en el `<head>` de cada HTML |
| La jerarquía H1, H2, párrafo | `css/styles.css`, líneas 66 a 69 y variables `--tam-*` |
| El interlineado | `css/styles.css` línea 41 (`--interlineado: 1.6`) |
| El menú con Flexbox | `css/styles.css`, líneas ~107 a 132 |
| Las tarjetas con Grid | `css/styles.css`, línea 222 (`.tarjetas`) |
| El hero asimétrico | `css/styles.css`, línea 187 (`.hero__grid`) |
| El botón dorado y su hover | `css/styles.css`, líneas 173 y 174 |
| El hover del menú | `css/styles.css`, línea 141 |
| La página activa del menú | `css/styles.css` línea 143 y `aria-current="page"` en cada HTML |
| La media query | `css/styles.css`, líneas 356 y 363 |
| El menú del celular | `js/main.js` y `css/styles.css` línea 377 |
| El botón flotante de WhatsApp | `css/styles.css`, línea ~335 (`.wpp-flotante`) y el `<a class="wpp-flotante">` al final de cada HTML |
| El formulario | `contacto.html` y `js/main.js` |

> Las líneas son aproximadas: si se edita el CSS, se desplazan. Para ubicarlas rápido, usa **Ctrl+F** con el nombre de la clase.

---

## 8. Guion de sustentación (5 minutos)

| Minuto | Qué hacer | Qué decir |
|---|---|---|
| 1 | Presentar empresa y usuario tipo | "Finanzas del Ser ayuda a personas a gestionar su dinero de forma consciente. Mi usuario tipo es Camila, 29 años, que quiere ordenar sus gastos." |
| 2 a 3 | Navegar el sitio en vivo: computador y luego celular (F12) | Recorrer las 4 páginas; mostrar el menú, el hover del botón, el cambio de 4 a 2 a 1 columnas y el menú Menú del celular |
| 4 a 5 | Explicar **3 decisiones** | 1) Color: dorado solo en acciones (complementario al azul). 2) Tipografía: Poppins + Nunito Sans y jerarquía con variables. 3) Gestalt/UX: semejanza en botones y llegar a agendar en 1 clic |

**Preguntas probables y respuesta corta:**

- **¿Por qué el botón es dorado?** Es el único color cálido y es casi complementario al azul: genera contraste y peso visual, así el usuario encuentra rápido la acción. Además el texto oscuro sobre dorado da 7,79:1.
- **¿Por qué `rem` y no `px`?** Respeta el tamaño de letra que el usuario configuró en su navegador.
- **¿Para qué sirven las variables CSS?** Para cambiar la identidad en un solo lugar y mantener consistencia.
- **¿Qué hace la media query?** Cuando la pantalla es de 900 px o menos reorganiza el diseño; con 720 px o menos pasa a una columna y activa el menú del celular.
- **¿Por qué el logo debe ser vectorial?** Porque se define con fórmulas matemáticas (puntos y curvas), no con píxeles: se puede agrandar sin pixelarse.
- **¿Por qué esos formatos de imagen?** SVG para logo e íconos (vectorial, liviano); WebP o JPG para fotos (menos peso, carga más rápido); PNG solo si se necesita fondo transparente.
- **¿Cómo cuidaste la accesibilidad?** Contraste AA, `alt` en imágenes, foco visible, enlace para saltar al contenido, `aria-current` y `aria-expanded`.

---

## 9. Estado actual y pendientes

**Provisional (a reemplazar cuando el compañero entregue):**

- [ ] `assets/img/logo-provisional.svg` → logo hecho en Illustrator (SVG)
- [ ] `assets/img/hero-provisional.svg` → imagen editada en Photoshop (WebP o JPG, menos de 500 KB)
- [ ] Enlaces de Instagram y Facebook en el pie y en Contacto (hoy son `href="#"`)

**Por cerrar:**

- [ ] Capturas de WebAIM con al menos 2 combinaciones
- [ ] Capturas numeradas del sitio para el manual
- [ ] Citar créditos de cualquier foto de banco libre o ilustración usada
- [ ] Declarar el uso de IA en las referencias del manual
- [ ] Publicar en GitHub Pages o Netlify Drop (opcional)

**Cómo cambiar la identidad final:** reemplaza los archivos de `assets/img/` con el mismo nombre (o actualiza el `src` en los 4 HTML) y ajusta las variables de `:root`.

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
