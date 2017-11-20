/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var xhr;

$('input').select(function(){
    $(this).focus();
});

function editar(object, id) {

    var col = object.id % 5;
    var long = $(object).parent().children().length;
    

    //Si el tamaño de datos es 5, es maestro
    if (long == 5) {
        switch (col) {
            case 1:
                var columna = "nombre";
                var input = document.createElement("input");
                input.className = "mdl-textfield__input";
                input.id = 'input';
                
                if (object.innerText)
                    input.value = object.innerText;
                else
                    input.value = object.textContent;

                input.style.width = getTextWidth(input.value) + 30 + "px";
                object.replaceChild(input, object.firstChild);
                document.getElementById('input').focus();
                document.getElementById('input').select();

                input.onblur = function salir() {
                    guardarMaestro(object, input.value, columna, id);
                    delete input;
                };

                input.onkeydown = function keyDown(event) {
                    if (event.keyCode == 13) {
                        document.getElementById('input').blur();
                        delete input;
                    }
                }; 
                break;
            case 2:
                var columna = "telefono";
                var input = document.createElement("input");
                input.className = "mdl-textfield__input";
                input.id = 'input';
                
                if (object.innerText)
                    input.value = object.innerText;
                else
                    input.value = object.textContent;

                input.style.width = getTextWidth(input.value) + 30 + "px";
                object.replaceChild(input, object.firstChild);
                document.getElementById('input').focus();
                document.getElementById('input').select();

                input.onblur = function salir() {
                    guardarMaestro(object, input.value, columna, id);
                    delete input;
                };

                input.onkeydown = function keyDown(event) {
                    if (event.keyCode == 13) {
                        document.getElementById('input').blur();
                        delete input;
                    }
                }; 
                break;
            case 3:
                var columna = "correoelectronico";
                var input = document.createElement("input");
                input.className = "mdl-textfield__input";
                input.id = 'input';
                
                if (object.innerText)
                    input.value = object.innerText;
                else
                    input.value = object.textContent;

                input.style.width = getTextWidth(input.value) + 30 + "px";
                object.replaceChild(input, object.firstChild);
                document.getElementById('input').focus();
                document.getElementById('input').select();

                input.onblur = function salir() {
                    guardarMaestro(object, input.value, columna, id);
                    delete input;
                };

                input.onkeydown = function keyDown(event) {
                    if (event.keyCode == 13) {
                        document.getElementById('input').blur();
                        delete input;
                    }
                };           
                break;
        }
    } else if (long == 3) {

    }
}

function guardarMaestro(obj, valor, columna, id) {
    obj.replaceChild(document.createTextNode(valor), obj.firstChild);
    var nomina = getId(obj);
    
    xhr = new XMLHttpRequest();
    xhr.open("POST", "http://localhost:8080/Sistema_de_Inscripciones/ModificarServlet", true);

    var data = new FormData();
    data.append("id", nomina);
    data.append("valor", valor);
    data.append("columna", columna);
    xhr.onload = function validar(){
        if(xhr.status == 200){
            obj.replaceChild(document.createTextNode(valor), obj.firstChild);
        }
    };

    xhr.send(data);
}

function getColumna(object) {
    return $(object).parent().children().index($(object));
}

function getId(object) {
    return $(object).parent().children()[0].innerHTML;
}

function getTextWidth(texto) {
    //Valor por default : 150 pixels
    var ancho = 150;

    if (texto.trim() == "") {
        return ancho;
    }

    //Creacion de un span escondido que se puedra medir 
    var span = document.createElement("span");
    span.style.visibility = "hidden";
    span.style.position = "absolute";

    //Se agrega el texto al span y el span a la pagina
    span.appendChild(document.createTextNode(texto));
    document.getElementsByTagName("body")[0].appendChild(span);

    //tamaño del texto
    ancho = span.offsetWidth;

    //Eliminacion del span
    document.getElementsByTagName("body")[0].removeChild(span);
    span = null;

    return ancho;
}