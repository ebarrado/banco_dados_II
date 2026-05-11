USE bd_escola_b;
SELECT 
    nome,
    TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) AS idade
FROM alunos;