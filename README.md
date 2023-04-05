# sis-bd2

<h4> Disciplina de Banco de Dados II - Curso de Análise e Desenvolvimento de Sistemas - IFRS - Campus Farroupilha. </h4>

...\sis-bd2\public>

php -S localhost:8080

-> ÚLTIMAS ALTERAÇÕES REALIZADAS
Adicionei a tabela (leitura_log), onde uso na TRIGGER de after insert (tg_aft_ins_leitura);
Adicionei a tabela (reg_amizade), onde uso para registrar a contagem de amizades do meu EVENT (conta_amizades);
Criei a FUNÇÃO (retorna_classificacao), onde passo como parâmetro de entrada o id do leitor e tenho a média da classificação total de livros que essa pessoas fez (soma das classificações / numero de livros classificados)
Criei a PROCEDURE (insere_leitor) que recebe os parâmetros cpf, nome e nascimento do novo leitor
Criei a VIEW (leituras_finalizadas_leitor) onde mostra o leitor, livro, autor, categoria do livro e classificacao de todos os livros lidos por cada leitor
Criei a VIEW (leituras_nao_finalizadas_leitor) onde mostra o leitor, livro, autor, categoria do livro e classificacao de todos os livros NÃO lidos por cada leitor
