
// Espera a que el DOM esté completamente cargado antes de ejecutar cualquier código
$(document).ready(function() {

	// =============================
	// 1. Menú lateral (sidebar)
	// =============================
	// Al hacer clic en el botón de menú, muestra el panel lateral y el overlay
	$('#btnMenu').click(function() {
		$('#panelMenu').addClass('abierto'); // Agrega la clase para mostrar el menú
		$('#menuOverlay').fadeIn(); // Muestra el fondo oscurecido
	});
	// Al hacer clic en el overlay, oculta el panel lateral y el overlay
	$('#menuOverlay').click(function() {
		$('#panelMenu').removeClass('abierto'); // Oculta el menú
		$('#menuOverlay').fadeOut(); // Oculta el overlay
	});
	// Al hacer clic en cualquier enlace del menú, también se cierra el menú y el overlay
	$('#panelMenu a').click(function() {
		$('#panelMenu').removeClass('abierto');
		$('#menuOverlay').fadeOut();
	});


	// =============================
	// 2. Galería de fotos de cultivos
	// =============================
	// Array con las rutas de las imágenes de los cultivos
	const fotos = [
		'img/maiz.jpg',
		'img/cafe.jpg',
		'img/hortalizas.jpg',
		'img/tomate.jpg',
		'img/frijoles.jpg'
	];
	let indice = 0; // Índice actual de la foto mostrada

	// Función para mostrar la foto correspondiente al índice
	function mostrarFoto(i) {
		// Hace un fade out, cambia la imagen y luego hace fade in
		$('#fotoCultivo').fadeOut(300, function() {
			$(this).attr('src', fotos[i]).fadeIn(300);
		});
	}

	// Botón para mostrar la foto anterior
	$('#anterior').click(function() {
		indice = (indice - 1 + fotos.length) % fotos.length; // Retrocede y cicla
		mostrarFoto(indice);
	});
	// Botón para mostrar la foto siguiente
	$('#siguiente').click(function() {
		indice = (indice + 1) % fotos.length; // Avanza y cicla
		mostrarFoto(indice);
	});


	// =============================
	// 3. Formulario de registro de siembras
	// =============================
	// Validación en tiempo real del campo nombre
	$('#nombreCultivo').on('keyup', function() {
		if ($(this).val().trim() === '') {
			// Si el campo está vacío, muestra advertencia
			$('#avisoNombre').text('El nombre es obligatorio').css('color', '#d32f2f');
		} else {
			// Si hay texto, borra la advertencia
			$('#avisoNombre').text('');
		}
	});
	// Validación en tiempo real del campo fecha
	$('#fechaSiembra').on('keyup change', function() {
		if ($(this).val().trim() === '') {
			$('#avisoFecha').text('La fecha es obligatoria').css('color', '#d32f2f');
		} else {
			$('#avisoFecha').text('');
		}
	});
	// Validación al enviar el formulario
	$('#registroSiembras form').on('submit', function(e) {
		// Si algún campo está vacío, evita el envío y muestra advertencias
		if ($('#nombreCultivo').val().trim() === '' || $('#fechaSiembra').val().trim() === '') {
			e.preventDefault();
			if ($('#nombreCultivo').val().trim() === '') {
				$('#avisoNombre').text('El nombre es obligatorio').css('color', '#d32f2f');
			}
			if ($('#fechaSiembra').val().trim() === '') {
				$('#avisoFecha').text('La fecha es obligatoria').css('color', '#d32f2f');
			}
		}
	});


	// =============================
	// 4. Animación de barras de producción
	// =============================
	// Al hacer clic en el botón de estadísticas, anima la altura de cada barra
	$('#verEstadisticas').click(function() {
		$('#barraMaiz').animate({height: '80px'}, 800); // Maíz
		$('#barraCafe').animate({height: '60px'}, 800); // Café
		$('#barraHortalizas').animate({height: '100px'}, 800); // Hortalizas
		$('#barratomate').animate({height: '90px'}, 800); // Tomate
		$('#barrafrijol').animate({height: '70px'}, 800); // Frijol
	});


	// =============================
	// 5. Efecto mouse sobre lista de cultivos
	// =============================
	// Cambia el color de fondo al pasar el mouse sobre un cultivo
	$('.itemCultivo').mouseenter(function() {
		$(this).css('background', '#b2f7ef'); // Fondo azul claro
	}).mouseleave(function() {
		$(this).css('background', '#e0ffe0'); // Fondo verde claro
	});


	// =============================
	// 6. Mostrar/ocultar datos del clima
	// =============================
	// Al hacer clic en el botón de clima, muestra u oculta los datos
	$('#btnClima').click(function() {
		$('#datosClima').toggle();
	});


	// =============================
	// 7. Mensaje de bienvenida animado
	// =============================
	// Cambia el color, oculta y muestra el mensaje de bienvenida con animación
	$('#bienvenida')
		.css('color', '#388e3c') // Color inicial verde
		.delay(400) // Espera 400ms
		.css('color', '#d32f2f') // Cambia a rojo
		.slideUp(700) // Oculta con deslizamiento
		.slideDown(700, function() {
			$(this).css('color', '#388e3c'); // Vuelve a verde al finalizar
		});

});
