<?php
$mysqli = new mysqli("localhost", "root", "", "Proyecto");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}

function salonesMasUtilizados() {
    global $mysqli;
    $queryCursos="SELECT * FROM Curso";
    $querySalones="SELECT * FROM Salon";
    if(!$mysqli->query($queryCursos)) {
        echo "Error, no fue posible verificar si hay cursos inscritos: (" . $mysqli->errno . ") " . $mysqli->error;
        return;
    }
    if(!$mysqli->query($querySalones)) {
        echo "Error, no fue posible verificar si hay salones inscritos: (" . $mysqli->errno . ") " . $mysqli->error;
        return;
    }
    $cursos = $mysqli->query($queryCursos);
    $salones = $mysqli->query($querySalones);

    if(!isset($cursos) || empty($cursos) || $cursos == "") {
        echo "Error, no hay cursos inscritos<br>";
        return;
    }
    if(!isset($salones) || empty($salones) || $salones == "") {
        echo "Error, no hay salones inscritos<br>";
        return;
    }


}

$tipoReporte = $_GET["tipoReporte"];

if ($tipoReporte == "salonesMasUtilizados") {
    salonesMasUtilizados();
}

$mysqli->close();
?>