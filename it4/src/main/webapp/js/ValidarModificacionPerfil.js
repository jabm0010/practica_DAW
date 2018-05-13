
$(function () {
    usuariosCtrl.init(viewModel);
});

var viewModel = {
    usuario: {}
};



//Clientes Controller
var usuariosCtrl = {
    config: {
        frmEdit: '#formPerfil',
        btnModal: '#myBtn',
        formEdit: '#edCliente'

    },
    model: {},
    init: function (model) {
        this.model = model;

        var self = this;

        $(this.config.btnModal).on('click', () => {
            $(this.config.formEdit).modal('show');

        });

        $(this.config.frmEdit).submit(event => {

            if (self.validarDatos() === false) {
                event.preventDefault();  //stop submit 
                event.stopPropagation();
            } else {

            }



        });


    },

    validarDatos: function () {

        var result = true;

        usuario = this.formSubmit();
        if (usuario.nombre.length < 3 || usuario.nombre.length > 20) {
            $('#errNombre').text("La longitud del nombre no es válida");

            result = false;
        }
        if (usuario.biografia.length < 1 || usuario.biografia.length > 240) {
            $('#errBiografia').text("La longitud de la biografía");

            result = false;
        }

        return result;
    },

    formSubmit: function () {
        var usuario = this.model.usuario;
        usuario = {};

        usuario.nombre = $('[name=nombre').val().trim();
        usuario.biografia = $('[name=biografia').val().trim();


        $(this.config.errMsgs).empty();

        return usuario;
    }
}; 