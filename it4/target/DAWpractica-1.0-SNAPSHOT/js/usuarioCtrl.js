
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
                   
                alert("Modificado con éxito");
            }
        });
    },

    validarDatos: function () {

        var result = true;

        usuario = this.formSubmit();

        if (usuario.nombre.length < 2 || usuario.nombre.length > 50) {
            $('#errNombre').show();
            result = false;
        } else {
            $('#errNombre').hide();
        }

        if (usuario.biografia.length < 2 || usuario.biografia.length > 50) {
            $('#errBiografia').show();
            result = false;
        } else {
            $('#errBiografia').hide();
        }


        return result;
    },

    formSubmit: function () {
        var usuario = this.model.usuario;
        usuario = {};

        usuario.nombre = $('[name=nombre').val();
        usuario.pwd = $('[name=biografia').val();


        $(this.config.errMsgs).empty();

        return usuario;
    }
}; 