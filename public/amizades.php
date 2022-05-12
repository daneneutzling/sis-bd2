<!DOCTYPE html>

<head>
    <style>
        body {
            max-width: 800px;
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
    
        .leitor{
            padding-right: 50px;
            padding-bottom: 10px;
        }

        .amigo{
            padding-bottom: 10px;
        }
    </style>
</head>

<html>

<body>
    <h1>Biblioteca</h1>

    <h2>Amizades</h2>
    <div class="content">

        <?php
        require 'mysql_server.php';

        $conexao = RetornaConexao();

        //variável php = 'coluna_do_banco'
        $leitor = 'leitor_nome';
        $amigo = 'amigo';

        //variável php (sql) = 'SELECT do banco' OU recebe as variaveis de acordo com as colunas do banco
        $sql = 'SELECT leitor.leitor_nome, l2.leitor_nome AS amigo
            FROM amizade
            JOIN leitor ON ( amizade.amizade_leitor_id_fk = leitor.leitor_id )
            JOIN leitor l2 ON ( l2.leitor_id = amizade.amizade_leitor_amigo_id_fk )
            ORDER BY leitor.leitor_nome;'
            ;

            /*
            'SELECT ' . $leitor .
            '     , ' . $amigo .
            '  FROM amizade';
            */


        $resultado = mysqli_query($conexao, $sql);
        if (!$resultado) {
            echo mysqli_error($conexao);
        }


        //variáveis ao cabeçalho da tela, de acordo com as variáveis das colunas do banco
        $cabecalho =
            '<table>' .
            '    <tr>' .
            '        <th class="leitor">' . 'Leitor' . '</th>' .
            '        <th class="amigo">' . 'Amigo' . '</th>' .
            '    </tr>';

        echo $cabecalho;

        if (mysqli_num_rows($resultado) > 0) {

            while ($registro = mysqli_fetch_assoc($resultado)) {
                echo '<tr>';

                //adicionar as tabelas com os registro[variaveis php]
                echo '<td class="leitor">' . $registro[$leitor] . '</td>' .
                    '<td class="amigo">' . $registro[$amigo] . '</td>' ;
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