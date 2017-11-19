<?php
$mysqli = new mysqli("localhost", "root", "", "Proyecto");
if ($mysqli->connect_errno) {
    echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
}


?>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
        #resultadosReporte {
            padding-top: 10em;
            padding-left: 6em;
            padding-right: 6em;
        }
    </style>
</head>
<body>
    <?php
        readfile("../web/header.html");
    ?>

    <p id="resultadosReporte">
        asdfjjsdf
    </p>
</body>
</html>


