// Finanzas del Ser · Comportamiento mínimo del sitio
// 1) Abrir y cerrar el menú en celular
// 2) Mostrar un mensaje al "enviar" el formulario (es solo visual)

// ---- 1. Menú hamburguesa ----
const botonMenu = document.querySelector(".menu-boton");
const menu = document.querySelector("#menu-principal");

if (botonMenu && menu) {
  botonMenu.addEventListener("click", () => {
    const abierto = menu.classList.toggle("nav--abierto");
    // aria-expanded avisa a lectores de pantalla si el menú está abierto
    botonMenu.setAttribute("aria-expanded", abierto);
  });
}

// ---- 2. Formulario visual ----
const formulario = document.querySelector("#formulario-contacto");
const mensajeEnvio = document.querySelector("#mensaje-envio");

if (formulario && mensajeEnvio) {
  formulario.addEventListener("submit", (evento) => {
    evento.preventDefault(); // no se envían datos a ningún servidor
    mensajeEnvio.textContent =
      "Gracias por escribirnos. Este formulario es demostrativo: para agendar, escríbenos por WhatsApp.";
    formulario.reset();
  });
}
