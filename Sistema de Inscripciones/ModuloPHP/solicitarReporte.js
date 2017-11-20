var enOrdenDesc = true;

document.onreadystatechange = function () {
  if (document.readyState == 'complete') {
    solicitarDatos();
  }
};

function invertirOrden() {
  if (enOrdenDesc) {
    solicitarDatos("salonesMenosUtilizados");
    enOrdenDesc = false;
  }
  else {
    solicitarDatos("salonesMasUtilizados");
    enOrdenDesc = true;
  }
}

function solicitarDatos(tipoReporte = "salonesMasUtilizados") {
  const urlReporte = "GenerarReporte.php?tipoReporte=" + tipoReporte;
  var ajaxRequest = new XMLHttpRequest();
  ajaxRequest.onreadystatechange = function () {
    if (this.readyState == 4 && this.status == 200) {
      if (esJsonValido(this.responseText)) {
        var resultados = JSON.parse(this.responseText);
        console.log(this.responseText);
        console.log(resultados);
        console.log(resultados["table_head"]);
        console.log(resultados["table_rows"]);
        var tablaResultado = generarCabecera(resultados["table_head"]);
        tablaResultado += generarRenglones(resultados["table_rows"]);
        document.getElementById("titulo-reporte").innerHTML = resultados["table_name"];
        document.getElementById("btninvertir").innerText = resultados["btn_invertir"];

        console.log(tablaResultado);
        document.getElementById("tabla-reporte").innerHTML = tablaResultado;
      }
      else {
        document.getElementById("titulo-reporte").innerHTML = this.responseText;
      }
    }
  };
  ajaxRequest.open("GET", urlReporte, true);
  ajaxRequest.send();
}

function generarCabecera(headers) {
  var tableHead = "";
  tableHead += "<thead><tr>"
  for (var head in headers) {
    tableHead += "<th>";
    tableHead += headers[head];
    tableHead += "</th>";
  }
  tableHead += "</tr></thead>";
  return tableHead;
}

function generarRenglones(tableRows) {
  var tableBody = "";
  tableBody += "<tbody>";
  for (var rowIdx in tableRows) {
    tableBody += "<tr>";
    for (var value in tableRows[rowIdx]) {
      tableBody += "<td>";
      tableBody += tableRows[rowIdx][value];
      tableBody += "</td>";
    }
    tableBody += "</tr>";
  }
  tableBody += "</tbody>";
  return tableBody;
}

function esJsonValido(json) {
  try {
    return (JSON.parse(json) && !!json);
  }
  catch (e) {
    return false;
  }
}
