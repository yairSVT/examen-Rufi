# examen-Rufi

Readme (Back end)

El servicio Back end cuenta con 5 servicios para el logueo de usuarios y manejo de créditos
Generé el servicio de token pero tuve detalles que no me dió tiempo resolver y lo deshabilité...

validaIngreso: servicio de login que espera un json con un usuario y su contraseña. ({"user":"yair@correo.com","password":"1234"})
devuelve datos del usuario con los que puede descargar los créditos con los que cuenta:
{
    "contrasena": "1234",
    "fechaIngreso": "2025-12-26 19:25:31.494488",
    "idDatosUsuario": 1,
    "persona": {
        "apellidoMaterno": "santamaria",
        "apellidoPaterno": "tadeo",
        "fechaNacimiento": "1989-08-21 00:00:00.0",
        "idPersona": 1,
        "nombre": "yair"
    },
    "usuario": "admin"
}
(el dato importante es el idPersona para este caso.)

getCreditosByUsuario: Este servicio devuelve todos los créditos que pertenezcan a un cliente. Recibe un id (del cliente) {"id":1}


cambiarEstatusCredito: este servicio actualiza el estatus de un crédito específico. Espera un json con el id del crédito y el id del nuevo estatus:{"id":1,"estatus":1}


getEstatusCreditos: te devuelve el catálogo de los estatus para que puedas seleccionar el que requieres. Este es el único servicio tipo Get, los demás servicio son tipo POST.

createCredito: Este servicio funciona para agregar nuevos créditos a cada usuario. (servicio creado pero no implementado en el front)
{"montoCredito":"**" ,"idFrecuencia":"**", "idEstatusCredito":"**" , "idCliente":"**"}
