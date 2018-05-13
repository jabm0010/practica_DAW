/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(() => {
    //Create and initialize controller    
    let clientesctrl = new ClientesController();
    clientesctrl.init();
});


class ClientesController {
    constructor() {

        this.srvUrl = '/DAWpractica/webservice/clientes';
        this.online = '#online';
        this.offline = '#offline';
        this.idCliente = '#usuario';
        this.estadoActual = '#estado-Actual';

    }
    init() {

        $(this.online).on('click', () => {
            this.pasaOnline($(this.idCliente).attr('c-actual'));
        });
        $(this.offline).on('click', () => {
            this.pasaOffline($(this.idCliente).attr('c-actual'));
        });

        this.verCliente($(this.idCliente).attr('c-actual'));
    }
    cargaClientes() {
        fetch(this.srvUrl)
                .then(response => response.json())
                .then(clientes => {
                    this.visualizaClientes(clientes);
                })
                .catch(() => {
                    console.error("Error conexión");
                });

    }
    verCliente(id) {
        return  fetch(this.srvUrl + "/" + id)
                .then(response => response.json())
                .then(cliente => {
                    this.visualizaEstado(cliente);
                })
                .catch(() => {
                    //   console.error("Error conexión");
                });
    }

    visualizaEstado(cliente) {
        let filas = "";
        var online = cliente.online;
        if (online === true) {
            filas += `<a> Online</a>`;
        } else {
            filas += `<a> Offline</a>`;
        }
        $('#perfil').html(filas);
    }
//    pasaOnline(id) {
//        return fetch(`${this.srvUrl}/${cliente.id}`, {
//            method: 'PUT',
//            body: JSON.stringify(cliente),
//            headers: {
//                'Content-type': 'application/JSON',
//                'accept': 'application/JSON'
//            }
//        }).then(() => {
//            let filas = "";
//            filas += `<a> Online</a>`;
//            $('#perfil').html(filas);
//        })
//    }
    pasaOnline(id) {
        let filas = "";
        filas += `<a> Online</a>`;
        $('#perfil').html(filas);
    }
    pasaOffline(id) {
        let filas = "";
        filas += `<a> Offline</a>`;
        $('#perfil').html(filas);
    }

}





