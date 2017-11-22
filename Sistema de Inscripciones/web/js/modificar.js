/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var xhr;

$('input').select(function () {
    $(this).focus();
});

function editar(object, id) {

    var long = $(object).parent().children().length;
    var col = object.id % (long - 1);
    var columna = object.className;
    var iNomina = columna[columna.length - 1];

    //nomina (id) del objeto y la columna que se va a editar
    var nomina;
    columna = columna.substring(0, columna.length - 1);


    //Si el tamaño de datos es 5, es maestro
    if (long == 6) {
        //Esto es un maestro
        nomina = document.getElementsByClassName("Nomina" + iNomina)[0].innerHTML;
        switch (columna) {
            case "Nombre":
            case "Telefono":
            case "CorreoElectronico":
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
                    guardar(object, input.value, columna, id, nomina);
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
    } else if (long == 4) {
        //Esto es un salon
        nomina = document.getElementsByClassName("Numero" + iNomina)[0].innerHTML;
        switch (columna) {
            case "Capacidad":
            case "Administrador":
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
                    guardar(object, input.value, columna, id, nomina);
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
    } else if (long == 11) {
        //Esto es un grupo
        var clave = document.getElementsByClassName("Clave" + iNomina)[0].innerHTML;
        var numero = document.getElementsByClassName("NumeroDeGrupo" + iNomina)[0].innerHTML;
        var select = document.createElement("select");
        select.id = 'input';


        switch (columna) {
            case "Ingles":
            case "Honors":
                var selected;
                if (object.innerText)
                    selected = object.innerText;
                else
                    selected = object.textContent;

                var option = document.createElement("option");
                option.value = "Sí";
                option.name = "Sí";
                option.innerHTML = "Sí";
                select.appendChild(option);
                if (selected === "Sí")
                    select.value = "Sí";

                var option2 = document.createElement("option");
                option2.value = "No";
                option2.name = "No";
                option2.innerHTML = "No";
                select.appendChild(option2);
                if (selected === "No")
                    select.value = "No";

                select.style.width = "100px";

                object.replaceChild(select, object.firstChild);

                document.getElementById('input').focus();

                select.onchange = function cambio() {
                    document.getElementById('input').blur();
                    delete select;
                };

                select.onblur = function salir() {
                    if (select.value == "Sí")
                        var valor = 1;
                    else
                        var valor = 0;
                    guardarGrupo(object, valor, columna, id, clave, numero);
                    delete select;
                }
                break;
            case "Horario":
            case "HorarioLaboratorio":
                var selected;
                if (object.innerText)
                    selected = object.innerText;
                else
                    selected = object.textContent;

                var xhr = new XMLHttpRequest();
                xhr.open("GET", "GetDatos", false);
                xhr.onload = function validar() {
                    if (xhr.status == 200) {
                        var array = xhr.responseText.split(",");
                        for (var i = 0; i < array.length; ++i) {
                            var option = document.createElement("option");
                            option.value = array[i];
                            option.name = array[i];
                            option.innerHTML = array[i];
                            select.appendChild(option);
                            if (selected == array[i])
                                select.value = array[i];
                        }
                    }
                }
                xhr.send(null);

                select.style.width = "100px";

                if (selected == "")
                    object.innerText = "Dummy";

                object.replaceChild(select, object.firstChild);

                document.getElementById('input').focus();

                select.onchange = function cambio() {
                    guardarGrupo(object, select.value, columna, id, clave, numero);
                    delete select;
                };

                select.onblur = function salir() {
                    guardarGrupo(object, select.value, columna, id, clave, numero);
                    delete select;
                }
                break;
        }
    }
}

function guardar(obj, valor, columna, id, nomina) {
    obj.replaceChild(document.createTextNode(valor), obj.firstChild);

    xhr = new XMLHttpRequest();
    xhr.open("POST", "ModificarServlet", true);

    var data = new FormData();
    data.append("id", nomina);
    data.append("valor", valor);
    data.append("columna", columna);
    xhr.onload = function validar() {
        if (xhr.status == 200) {
            obj.replaceChild(document.createTextNode(valor), obj.firstChild);
        }
    };

    xhr.send(data);
}

function guardarGrupo(obj, valor, columna, id, clave, numero) {
    obj.replaceChild(document.createTextNode("valor"), obj.firstChild);

    xhr = new XMLHttpRequest();
    xhr.open("POST", "ModificarServlet", true);

    var data = new FormData();
    data.append("id", clave);
    data.append("numero", numero);
    data.append("valor", valor);
    data.append("columna", columna);
    var stringValor = valor;
    
    if(valor == 1)
        stringValor = "Sí";
    else if(valor == 0)
        stringValor = "No";
        
    xhr.onload = function validar() {
        if (xhr.status == 200) {
            obj.replaceChild(document.createTextNode(stringValor), obj.firstChild);
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
        headerIdx++;
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
        deletionPlan += " " + key + ": " + primaryKeys[key];
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