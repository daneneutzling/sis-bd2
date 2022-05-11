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
    
        .nome{
            padding-right: 80px;
            padding-bottom: 10px;
        }

        .nascimento {
            padding-bottom: 10px;
            text-align: center;
        }

        .nacionalidade{
            padding-left: 80px;
            padding-bottom: 10px;
            text-align: center;
        }
    </style>
</head>

<html>

<body>
    <h1>Biblioteca</h1>

    <h2>Autores</h2>
    <div class="content">
        
        <?php
        require 'mysql_server.php';

        $conexao = RetornaConexao();

        //variável php = 'coluna_do_banco'
        $nome = 'autor_nome';
        $nascimento = 'autor_nascimento';
        $nacionalidade = 'autor_nacionalidade';

        //variável php (sql) = 'SELECT do banco' OU recebe as variaveis de acordo com as colunas do banco
        $sql = 'SELECT  autor_nome, autor_nascimento, autor_nacionalidade
        FROM autor
        ORDER BY autor_nome;'
        ;

        /*
            'SELECT ' . $nome .
            '     , ' . $nascimento .
            '     , ' . $nacionalidade .
            '  FROM autor';
        */

        $resultado = mysqli_query($conexao, $sql);
        if (!$resultado) {
            echo mysqli_error($conexao);
        }


        //variáveis ao cabeçalho da tela, de acordo com as variáveis das colunas do banco
        $cabecalho =
            '<table>' .
            '    <tr>' .
            '        <th class="nome">' . 'Nome' . '</th>' .
            '        <th class="nascimento">' . 'Nascimento' . '</th>' .
            '        <th class="nacionalidade">' . 'Nacionalidade' . '</th>' .
            '    </tr>';

        echo $cabecalho;

        if (mysqli_num_rows($resultado) > 0) {

            while ($registro = mysqli_fetch_assoc($resultado)) {
                echo '<tr>';

                //adicionar as tabelas com os registro[variaveis php]
                echo '<td class="nome">' . $registro[$nome] . '</td>' .
                    '<td class="nascimento">' . $registro[$nascimento] . '</td>' . 
                    '<td class="nacionalidade">' . $registro[$nacionalidade] . '</td>';
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