<!DOCTYPE html>
<html>

    <style>
        h1 {
            text-align: center;
        }

        .content {
            text-align: center;
        }

        a:link {
            text-decoration: none;
            font-size: 20px;
        }

        a:hover {
            font-size: 25px;
            color:#000;
	        background: #F8F8FF;
        }
    </style>


<body>
    <h1>Biblioteca Virtual</h1>

    <div class="content">
        <div><a href="leitores.php?" class="leitores">Leitores</div>
        <div><a href="autores.php?" class="autores">Autores</div>
        <div><a href="livros.php?" class="livros">Livros</div>
        <div><a href="leituras.php?" class="leituras">Leituras</div>
        <div><a href="biblioteca.php?" class="biblioteca">Biblioteca</div>
        <div><a href="amizades.php?" class="amizades">Amizades</div>

    </div>
</body>
</html>





<?php
/*
$dir = substr(dirname($_SERVER['PHP_SELF']), strlen($_SERVER['DOCUMENT_ROOT']));
echo "<h2>Arquivos no seu servidor Apache" . $dir . ":</h2>";
$g = glob("*");
usort($g, function ($a, $b) {
    if (is_dir($a) == is_dir($b))
        return strnatcasecmp($a, $b);
    else
        return is_dir($a) ? -1 : 1;
});
echo implode("<br>", array_map(function ($a) {
    return '<a href="' . $a . '">' . $a . '</a>';
}, $g));
*/
