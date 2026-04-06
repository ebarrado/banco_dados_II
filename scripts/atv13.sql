USE db_loja_a;

SELECT CONCAT('R$',  AVG(valor)) AS VALOR_MÉDIO FROM ordens_servico;