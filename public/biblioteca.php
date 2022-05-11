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

        <?php
        require 'mysql_server.php';

        $conexao = RetornaConexao();

        //variável php = 'coluna_do_banco'
        $leitor = 'leitor_nome';
        $livro = 'livro_nome';

        //variável php (sql) = 'SELECT do banco' OU recebe as variaveis de acordo com as colunas do banco
        $sql = 'SELECT leitor.leitor_nome, livro.livro_nome
            FROM biblioteca
            JOIN leitor ON ( biblioteca.biblioteca_leitor_id_fk = leitor.leitor_id )
            JOIN livro ON ( biblioteca.biblioteca_livro_id_fk = livro.livro_id );'
            ;


        $resultado = mysqli_query($conexao, $sql);
        if (!$resultado) {
            echo mysqli_error($conexao);
        }


        //variáveis ao cabeçalho da tela, de acordo com as variáveis das colunas do banco
        $cabecalho =
            '<table>' .
            '    <tr>' .
            '        <th>' . 'Leitor' . '</th>' .
            '        <th>' . 'Livros' . '</th>' .
            '    </tr>';

        echo $cabecalho;

        if (mysqli_num_rows($resultado) > 0) {

            while ($registro = mysqli_fetch_assoc($resultado)) {
                echo '<tr>';

                //adicionar as tabelas com os registro[variaveis php]
                echo '<td>' . $registro[$leitor] . '</td>' .
                    '<td>' . $registro[$livro] . '</td>';
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