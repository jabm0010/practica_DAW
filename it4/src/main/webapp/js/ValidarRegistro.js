
$(function () {
    usuariosCtrl.init(viewModel);
});

var viewModel = {
    usuario: {}
};



//Clientes Controller
var usuariosCtrl = {
    config: {
        frmEdit: '#formUsuarios',
        mdlConfirmacion: '#confirmar'


    },
    model: {},
    init: function (model) {
        this.model = model;

        var self = this;

        $(this.config.frmEdit).submit(function () {
            self.formSubmit();
        });

        $(this.config.frmEdit).submit(function (event) {
            if (self.validarDatos(event) === false) {

                event.preventDefault();  //stop submit 
            } else {

                swal("Registro realizado con éxito", {
                    buttons: false,
                    icon: "success",

                });
                




            }
        });
    },

    validarDatos: function () {

        var result = true;

        usuario = this.formSubmit();

        if (usuario.correo.length < 3 || usuario.correo.length > 50) {
            $('#errCorreo').text("El correo no es válido");

            result = false;
        }

        if (usuario.nombre.length < 3 || usuario.nombre.length > 20) {
            $('#errNombre').text("La longitud del nombre no es válida!");

            result = false;
        }

        if (usuario.pwd.length < 5 || usuario.pwd.length > 30) {
            $('#errPwd').text("La longitud de la contraseña no es válida!");

            result = false;
        }
        return result;
    },

    formSubmit: function () {
        var usuario = this.model.usuario;
        usuario = {};

        usuario.correo = $('[name=correo').val().trim();
        usuario.nombre = $('[name=nombre').val().trim();
        usuario.pwd = $('[name=pwd').val();


        $(this.config.errMsgs).empty();

        return usuario;
    }


}; 