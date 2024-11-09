/*LISTADO DE PAISES*/
$.ajax({
	url:"vistas/js/plugins/paises.json",
	type: "GET",
	success: function(respuesta){
		respuesta.forEach(seleccionarPais);
		
		function seleccionarPais(item, index){
			var pais =  item.name;
			var codPais =  item.code;
			var dial = item.dial_code;
			$("#inputPais").append(
				`<option value="`+pais+`,`+codPais+`,`+dial+`">`+pais+`</option>`
			)
		}
	}
})
/*PLUGIN SELECT2*/
$('.select2').select2()
/*AGREGAR DIAL CODE DEL PAIS*/
$('#inputPais').change(function(){
	$(".dialCode").html($(this).val().split(",")[2])
})
/*INPUT MASK*/
$('[data-mask]').inputmask()
/*FIRMA VIRTUAL*/
$("#signatureparent").jSignature({
	color:"#333", //line color
	lineWidth:1, //grosor de la linea
	width:320, 	//Ancho de la firma
	height:100 //Alto de la firma
});
$(".repetirFirma").click(function() {
	$("#signatureparent").jSignature("reset")
})

/*VALIDAR FORMULARIO SUSCRIPCION*/
$(".suscribirse").click(function(){
	$(".alert").remove();
	let nombre = $("#inputName").val();
	let email = $("#inputEmail").val();
	let patrocinador = $("#inputPatrocinador").val();
	let enlace_afiliado = $("#inputAfiliado").val();
	let pais = $("#inputPais").val().split(",")[0];
	let codigo_pais = $("#inputPais").val().split(",")[1];
	let telefono_movil = $("#inputPais").val().split(",")[2]+" "+$("#inputMovil").val();
	let red = $("#tipoRed").val();
	let aceptarTerminos = $("#aceptarTerminos:checked").val();

	if($("#signatureparent").jSignature("isModified")){
		let firma = $("#signatureparent").jSignature("getData", "image/svg+xml");
	}
	/*VALIDAR*/
	if( nombre == "" || email == "" || patrocinador == "" ||
		enlace_afiliado == "" || pais == "" || codigo_pais == "" ||
		telefono_movil == "" || red == "" || aceptarTerminos != "on" ||
		!$("#signatureparent").jSignature('isModified')){
			$(".suscribirse").before(`
				<div class="alert alert-danger">Faltan datos, 
				no ha aceptado o no ha firmado los términos y condiciones</div>`);
		return;
	}else{
		console.log("formulario listo");
	}
})

/*TABLA USUARIOS*/
$.ajax({
	url:"ajax/tabla-usuarios.ajax.php",
	success: function(respuesta){
		console.log("respuesta",respuesta);
	}
});
$(".tablaUsuarios").DataTable({
	"ajax": "ajax/tabla-usuarios.ajax.php",
	"deferRender":true,
	"retrieve":true,
	"processing":true,
	"language": {
	    "sProcessing":     "Procesando...",
	    "sLengthMenu":     "Mostrar _MENU_ registros",
	    "sZeroRecords":    "No se encontraron resultados",
	    "sEmptyTable":     "Ningún dato disponible en esta tabla",
	    "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_",
	    "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0",
	    "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
	    "sInfoPostFix":    "",
	    "sSearch":         "Buscar:",
	    "sUrl":            "",
	    "sInfoThousands":  ",",
	    "sLoadingRecords": "Cargando...",
	    "oPaginate": {
	      "sFirst":    "Primero",
	      "sLast":     "Último",
	      "sNext":     "Siguiente",
	      "sPrevious": "Anterior"
	    },
	    "oAria": {
	        "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
	        "sSortDescending": ": Activar para ordenar la columna de manera descendente"
	    }
   }
});