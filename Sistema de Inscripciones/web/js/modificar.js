/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function editar(object){
    var col  = getColumna(object);
    var long = $(object).parent().children().length;
    var value = object.innerHTML;
    
    //Input
    var start_div = "<div class='mdl-textfield mdl-js-textfield' style='width: 180px'>";
    var end_div = "</div>";
    
    
    //Si el tamaño de datos es 5, es maestro
    if(long == 5){
        switch(col){
            case 1:
            case 2:
            case 3:
                var input = "<input class='mdl-textfield__input' type='text' id='sample' value='" + value + "' onkeyup='guardarMaestro(this)'>";
                object.innerHTML = start_div + input + end_div;
                object.ondblclick = function(){return false;};
                break;
        }
    }
}

function guardarMaestro(object) {
    //telca enter -- falta
    var valor = object.value;
    var id = getId($(object).parent().parent());
    var columna;
    
    switch(getColumna($(object).parent().parent())){
        case 1:
            columna = "nombre";
            break;
        case 2:
            columna = "telefono";
            break;
        case 3:
            columna = "correo";
            break;
    }
    
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "http://localhost:8080/Sistema_de_Inscripciones/ModificarServlet", true);
    
    var data = new FormData();
    data.append("id", id);
    data.append("valor", valor);
    data.append("columna", columna);
    xhr.onload = validar;
    
    xhr.send(data);
}

function validar(){
    console.log("YES");
}

function getColumna(object){
    return $(object).parent().children().index($(object));
}

function getId(object){
    return $(object).parent().children()[0].innerHTML;
}