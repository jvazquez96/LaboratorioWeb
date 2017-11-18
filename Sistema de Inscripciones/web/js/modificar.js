/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function editar(object){
    var col  = $(object).parent().children().index($(object));
    var long = $(object).parent().children().length;
    var value = object.innerHTML;
    
    //Input
    var start_div = "<div class='mdl-textfield mdl-js-textfield' style='width: 180px'>";
    var end_div = "</div>";
    var input = "<input class='mdl-textfield__input' type='text' id='sample' value='" + value + "'>";
    object.innerHTML = start_div + input + end_div;
    object.ondblclick = function(){return false;};
    
    //Si el tamaño de datos es 5, es maestro
    if(long == 5){
        switch(col){
            case 0:
                console.log("nomina");
                break;
            case 1:
                console.log("nombre");
                break;
            case 2:
                console.log("telefono");
                break;
            case 3:
                console.log("correo");
                break;
        }
    }
}