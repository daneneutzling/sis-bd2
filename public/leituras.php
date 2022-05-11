<!DOCTYPE html>

<head>
    <style>
        .body {
            max-width: 1000px;
            margin: auto;
        }

        h1 {
            text-align: center;
        }

        h2 {
            margin-left: 100px;
            padding-left: 50px;

        }

        .content {
            margin-top: 20px;
            margin-left: 200px;
            margin-right: 150px;
        }
    
        .leitor{
            padding-right: 30px;
            padding-bottom: 15px;
        }

        .livro {
            padding-right: 20px;
            padding-bottom: 15px;
            max-width: 400px;
        }

        .inicio_leitura {
            text-align: center;
            padding-right: 20px;
            padding-bottom: 15px;

        }

        .fim_leitura {
            text-align: center;
            padding-right: 20px;
            padding-bottom: 15px;

        }

        .classificacao {
            text-align: center;
            padding-bottom: 15px;

        }

    </style>
</head>

<html>

<body>
    <h1>Biblioteca</h1>

    <h2>Leituras realizadas</h2>

    <div class="content">
        
        <?php
        require 'mysql_server.php';

        $conexao = RetornaConexao();

        //variável php = 'coluna_do_banco'
        $leitor = 'leitor_nome';
        $livro = 'livro_nome';
        $data_inicio = 'leitura_data_inicio';
        $data_fim = 'leitura_data_fim';
        $classificacao = 'leitura_classificacao';

        //variável php (sql) = 'SELECT do banco' OU recebe as variaveis de acordo com as colunas do banco
        $sql = ' SELECT  leitor_nome, livro_nome, leitura_data_inicio, leitura_data_fim, leitura_classificacao
                FROM leitura
                JOIN leitor ON ( leitura.leitura_leitor_id_fk = leitor.leitor_id )
                JOIN livro ON ( leitura.leitura_livro_id_fk = livro.livro_id );'
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
            '        <th class="livro">' . 'Livro' . '</th>' .
            '        <th class="inicio_leitura">' . 'Início da leitura' . '</th>' .
            '        <th class="fim_leitura">' . 'Fim da leitura' . '</th>' .
            '        <th class="classificacao">' . 'Classificação do livro' . '</th>' .
            '    </tr>';

        echo $cabecalho;

        if (mysqli_num_rows($resultado) > 0) {

            while ($registro = mysqli_fetch_assoc($resultado)) {
                echo '<tr>';

                //adicionar as tabelas com os registro[variaveis php]
                echo '<td class="leitor">' . $registro[$leitor] . '</td>' .
                    '<td class="livro">' . $registro[$livro] . '</td>' .
                    '<td class="inicio_leitura">' . $registro[$data_inicio] . '</td>' . 
                    '<td class="fim_leitura">' . $registro[$data_fim] . '</td>' . 
                    '<td class="classificacao">' . $registro[$classificacao] . '</td>';
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