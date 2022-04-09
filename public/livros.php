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

        $id = 'id';
        $nome = 'nome';
        $edicao = 'edicao';
        $data_edicao = 'data_edicao';
        $categoria = 'categoria';
        $id_autor = 'id_autor';

        /*TODO-1: Adicione uma variavel para cada coluna */


        $sql =
            'SELECT ' . $id .
            '     , ' . $nome .
            '     , ' . $edicao .
            '     , ' . $data_edicao.
            '     , ' . $categoria.
            '     , ' . $id_autor.
            /*TODO-2: Adicione cada variavel a consulta abaixo */
            '  FROM livro';


        $resultado = mysqli_query($conexao, $sql);
        if (!$resultado) {
            echo mysqli_error($conexao);
        }



        $cabecalho =
            '<table>' .
            '    <tr>' .
            '        <th>' . 'ID' . '</th>' .
            '        <th>' . 'Nome' . '</th>' .
            /* TODO-3: Adicione as variaveis ao cabeçalho da tabela */
            '        <th>' . 'Edição' . '</th>' .
            '        <th>' . 'Data da edição' . '</th>' .
            '        <th>' . 'Categoria' . '</th>' .
            '        <th>' . 'ID do autor' . '</th>' .
            '    </tr>';

        echo $cabecalho;

        if (mysqli_num_rows($resultado) > 0) {

            while ($registro = mysqli_fetch_assoc($resultado)) {
                echo '<tr>';

                echo '<td>' . $registro[$id] . '</td>' .
                    '<td>' . $registro[$nome] . '</td>' .
                    /* TODO-4: Adicione a tabela os novos registros. */
                    '<td>' . $registro[$edicao] . '</td>'.
                    '<td>' . $registro[$data_edicao] . '</td>'.
                    '<td>' . $registro[$categoria] . '</td>'.
                    '<td>' . $registro[$id_autor] . '</td>';
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