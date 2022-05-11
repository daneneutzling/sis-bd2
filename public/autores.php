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

        <h2>Autores</h2>
        <?php
        require 'mysql_server.php';

        $conexao = RetornaConexao();

        //variável php = 'coluna_do_banco'
        $nome = 'autor_nome';
        $nascimento = 'autor_nascimento';
        $nacionalidade = 'autor_nacionalidade';

        //variável php (sql) = 'SELECT do banco' OU recebe as variaveis de acordo com as colunas do banco
        $sql =
            'SELECT ' . $nome .
            '     , ' . $nascimento .
            '     , ' . $nacionalidade .
            '  FROM autor';


        $resultado = mysqli_query($conexao, $sql);
        if (!$resultado) {
            echo mysqli_error($conexao);
        }


        //variáveis ao cabeçalho da tela, de acordo com as variáveis das colunas do banco
        $cabecalho =
            '<table>' .
            '    <tr>' .
            '        <th>' . 'Nome' . '</th>' .
            '        <th>' . 'Nascimento' . '</th>' .
            '        <th>' . 'Nacionalidade' . '</th>' .
            '    </tr>';

        echo $cabecalho;

        if (mysqli_num_rows($resultado) > 0) {

            while ($registro = mysqli_fetch_assoc($resultado)) {
                echo '<tr>';

                //adicionar as tabelas com os registro[variaveis php]
                echo '<td>' . $registro[$nome] . '</td>' .
                    '<td>' . $registro[$nascimento] . '</td>' . 
                    '<td>' . $registro[$nacionalidade] . '</td>';
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