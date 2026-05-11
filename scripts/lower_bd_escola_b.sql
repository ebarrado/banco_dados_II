USE bd_escola_b;

SELECT 
	LOWER(nome) AS nome_maiusculo,
    cidade
FROM alunos WHERE cidade = 'Bauru';