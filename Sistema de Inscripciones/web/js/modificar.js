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

    var long = $(object).parent().children().length;
    var col = object.id % long;


    //Si el tamaño de datos es 5, es maestro
    if (long == 5) {
        //Esto es un maestro
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
                    guardar(object, input.value, columna, id);
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
                    guardar(object, input.value, columna, id);
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
                    guardar(object, input.value, columna, id);
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
        //Esto es un salon
        switch(col){
            case 1:
                var columna = "capacidad";
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
                    guardar(object, input.value, columna, id);
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
                var columna = "administrador";
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
                    guardar(object, input.value, columna, id);
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
    }
}

function guardar(obj, valor, columna, id) {
    obj.replaceChild(document.createTextNode(valor), obj.firstChild);
    var clave = getId(obj);

    xhr = new XMLHttpRequest();
    xhr.open("POST", "ModificarServlet", true);

    var data = new FormData();
    data.append("id", clave);
    data.append("valor", valor);
    data.append("columna", columna);
    xhr.onload = function validar(){
        if(xhr.status == 200){
            obj.replaceChild(document.createTextNode(valor), obj.firstChild);
        }
    };

    xhr.send(data);
}

function eliminar(obj) {
    var rowToDelete = obj.parentNode.parentNode;
    var entireTable = rowToDelete.parentNode.parentNode;
    var firstRowHeader = entireTable.tHead.firstChild;
    var primaryKeyNames = [];
    var primaryKeyIndexes = [];

    // Discover what are the primary keys names
    var headerIdx = 0;
    for (var header = firstRowHeader.firstChild; header !== null; header = header.nextSibling) {
        if (header.getAttribute("data-is-primary-key")) {
            primaryKeyNames.push(header.innerText);
            primaryKeyIndexes.push(headerIdx);
        }
        headerIdx ++;
    }

    // Get the values for the primary keys to delete
    var primaryKeys = {}
    var colIdx = 0;
    for (var tableData = rowToDelete.firstChild; tableData !== null; tableData = tableData.nextSibling) {
        keyNameIdx = primaryKeyIndexes.indexOf(colIdx);
        if (keyNameIdx > -1) {
            // The header is the primary key name, and the td inside each cells under that header
            // ks the primary key value
            primaryKeys[primaryKeyNames[keyNameIdx]] = tableData.innerText;
        }
        colIdx++;
    }

    var beanName = entireTable.id;
    console.log(primaryKeys)
    console.log(beanName)
    var deletionPlan = ""
    for (var key in primaryKeys) {
        deletionPlan += " " + key + ": " + primaryKeys[key] ;
    }
    var userConfirmed = confirm("¿Está seguro que desea eliminar" + deletionPlan +
                                " y sus elementos dependientes?");
    if (!userConfirmed) {
        return;
    }
    xhr = new XMLHttpRequest();
    xhr.open("POST", "EliminarServlet", true);
    var data = new FormData();
    data.append("beanName", beanName);
    data.append("primaryKeys", JSON.stringify(primaryKeys));
    xhr.onload = function validar() {
        if (xhr.status == 200) {
            rowToDelete.parentNode.removeChild(rowToDelete);
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