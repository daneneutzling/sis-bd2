<!DOCTYPE html>

<head>
    <style>
        body {
            max-width: 1000px;
            margin: auto;
        }

        h1 {
            text-align: center;
        }

        h2 {
            padding-left: 50px;
        }

        .content {
            margin-top: 20px;
            margin-left: 80px;
        }
    
        .titulo{
            padding-right: 20px;
            max-width: 450px;
            padding-bottom: 15px;
        }

        .edicao {
            padding-right: 20px;
            padding-bottom: 15px;
            text-align: center;
        }

        .data_edicao {
            padding-right: 20px;
            padding-bottom: 15px;
            text-align: center;
        }

        .categoria {
            padding-right: 30px;
            padding-bottom: 15px;
            text-align: center;
        }

        .autor {
            padding-bottom: 15px;
        }
    </style>
</head>

<html>

<body>
    <h1>Biblioteca</h1>

    <h2>Livros</h2>

    <div class="content">
        
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
                JOIN autor ON ( autor.autor_id = livro.livro_autor_id_fk )
                ORDER BY livro.livro_nome;'
                ;


        $resultado = mysqli_query($conexao, $sql);
        if (!$resultado) {
            echo mysqli_error($conexao);
        }

        //variáveis ao cabeçalho da tela, de acordo com as variáveis das colunas do banco
        $cabecalho =
            '<table>' .
            '    <tr>' .
            '        <th class="titulo">' . 'Título' . '</th>' .
            '        <th class="edicao">' . 'Edição' . '</th>' .
            '        <th class="data_edicao">' . 'Data da edição' . '</th>' .
            '        <th class="categoria">' . 'Categoria' . '</th>' .
            '        <th class="autor">' . 'Autor' . '</th>' .
            '    </tr>';

        echo $cabecalho;

        if (mysqli_num_rows($resultado) > 0) {

            while ($registro = mysqli_fetch_assoc($resultado)) {
                echo '<tr>';

                //adicionar as tabelas com os registro[variaveis php]
                echo '<td class="titulo">' . $registro[$nome] . '</td>' .
                    '<td class="edicao">' . $registro[$edicao] . '</td>'.
                    '<td class="data_edicao">' . $registro[$data_edicao] . '</td>'.
                    '<td class="categoria">' . $registro[$categoria] . '</td>'.
                    '<td class="autor">' . $registro[$autor] . '</td>';
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