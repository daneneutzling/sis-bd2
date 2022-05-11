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
            margin-left: 50px;
            padding-left: 50px;
        }

        .content {
            padding: 0px;
            margin-top: 20px;
            margin-left: 200px;
        }
    
        .leitor{
            padding-right: 20px;
            max-width: 450px;
            padding-bottom: 15px;
        }

        .livro {
            padding-bottom: 15px;
            text-align: center;
        }
    </style>
</head>

<html>

<body>
    <h1>Biblioteca</h1>
    <h2>Bibliotecas individuais</h2>
    
    <div class="content">
        

        <?php
        require 'mysql_server.php';

        $conexao = RetornaConexao();

        //variável php = 'coluna_do_banco'
        $leitor = 'leitor_nome';
        $livros = 'quantidade';

        //variável php (sql) = 'SELECT do banco' OU recebe as variaveis de acordo com as colunas do banco
        $sql = 'SELECT  leitor.leitor_nome, COUNT(biblioteca_livro_id_fk) AS quantidade
            FROM biblioteca
            RIGHT JOIN leitor ON ( biblioteca.biblioteca_leitor_id_fk = leitor.leitor_id )
            GROUP BY leitor.leitor_nome
            ORDER BY leitor.leitor_nome;'
            ;


        $resultado = mysqli_query($conexao, $sql);
        if (!$resultado) {
            echo mysqli_error($conexao);
        }


        //variáveis ao cabeçalho da tela, de acordo com as variáveis das colunas do banco
        $cabecalho =
            '<table>' .
            '    <tr>' .
            '        <th class="leitor">' . 'Leitor' . '</th>' .
            '        <th class="livro">' . 'Livros' . '</th>' .
            '    </tr>';

        echo $cabecalho;

        if (mysqli_num_rows($resultado) > 0) {

            while ($registro = mysqli_fetch_assoc($resultado)) {
                echo '<tr>';

                //adicionar as tabelas com os registro[variaveis php]
                echo '<td class="leitor">' . $registro[$leitor] . '</td>' .
                    '<td class="livro">' . $registro[$livros] . '</td>';
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