<!DOCTYPE html>

<head>
    <style>
        .content {
            max-width: 800px;
            margin: auto;
        }
    </style>
</head>

<html>

<body>
    <div class="content">
        <h1>Biblioteca</h1>

        <h2>Amizades</h2>
        <?php
        require 'mysql_server.php';

        $conexao = RetornaConexao();

        //variável php = 'coluna_do_banco'
        $leitor = 'amizade_leitor_id_fk';
        $amigo = 'amizade_leitor_amigo_id_fk';

        //variável php (sql) = 'SELECT do banco' OU recebe as variaveis de acordo com as colunas do banco
        $sql =
            'SELECT ' . $leitor .
            '     , ' . $amigo .
            '  FROM amizade';


        $resultado = mysqli_query($conexao, $sql);
        if (!$resultado) {
            echo mysqli_error($conexao);
        }


        //variáveis ao cabeçalho da tela, de acordo com as variáveis das colunas do banco
        $cabecalho =
            '<table>' .
            '    <tr>' .
            '        <th>' . 'Leitor' . '</th>' .
            '        <th>' . 'Amigo' . '</th>' .
            '    </tr>';

        echo $cabecalho;

        if (mysqli_num_rows($resultado) > 0) {

            while ($registro = mysqli_fetch_assoc($resultado)) {
                echo '<tr>';

                //adicionar as tabelas com os registro[variaveis php]
                echo '<td>' . $registro[$leitor] . '</td>' .
                    '<td>' . $registro[$amigo] . '</td>' ;
                echo '</tr>';
            }
            echo '</table>';
        } else {
            echo '';
        }
        FecharConexao($conexao);
        ?>
    </div>
</body>

</html>