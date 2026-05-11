
USE bd_escola_b;
SELECT 
    nome, YEAR(data_nascimento) AS ano_nascimento
FROM
    alunos
WHERE YEAR(data_nascimento) = '2006'
    
;