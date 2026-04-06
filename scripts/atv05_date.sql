USE db_loja_a;

SELECT DATE_FORMAT(data_abertura, '%m/%Y') AS mes,
COUNT(*) AS total
FROM ordens_servico
GROUP BY mes;