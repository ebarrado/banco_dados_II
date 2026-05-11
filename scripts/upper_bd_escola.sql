USE bd_escola_b;

SELECT 
    UPPER(nome) AS nome_maiusculo,
    cidade
FROM alunos WHERE cidade = 'Bauru';