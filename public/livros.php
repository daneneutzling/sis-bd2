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

        <h2>Livros</h2>
        <?php
        require 'mysql_server.php';

        $conexao = RetornaConexao();

        //variável php = 'coluna_do_banco'
        $nome = 'livro_nome';
        $edicao = 'livro_edicao';
        $data_edicao = 'livro_data_edicao';
        $categoria = 'livro_categoria';
        $autor = 'autor_nome';

        //variável php (sql) = 'SELECT do banco' OU recebe as variaveis de acordo com as colunas do banco
        $sql = ' SELECT livro_nome, livro_edicao, livro_data_edicao, livro_categoria, autor.autor_nome
                FROM livro
                JOIN autor ON ( autor.autor_id = livro.livro_autor_id_fk );'
                ;


        $resultado = mysqli_query($conexao, $sql);
        if (!$resultado) {
            echo mysqli_error($conexao);
        }

        //variáveis ao cabeçalho da tela, de acordo com as variáveis das colunas do banco
        $cabecalho =
            '<table>' .
            '    <tr>' .
            '        <th>' . 'Nome' . '</th>' .
            '        <th>' . 'Edição' . '</th>' .
            '        <th>' . 'Data da edição' . '</th>' .
            '        <th>' . 'Categoria' . '</th>' .
            '        <th>' . 'Autor' . '</th>' .
            '    </tr>';

        echo $cabecalho;

        if (mysqli_num_rows($resultado) > 0) {

            while ($registro = mysqli_fetch_assoc($resultado)) {
                echo '<tr>';

                //adicionar as tabelas com os registro[variaveis php]
                echo '<td>' . $registro[$nome] . '</td>' .
                    '<td>' . $registro[$edicao] . '</td>'.
                    '<td>' . $registro[$data_edicao] . '</td>'.
                    '<td>' . $registro[$categoria] . '</td>'.
                    '<td>' . $registro[$autor] . '</td>';
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