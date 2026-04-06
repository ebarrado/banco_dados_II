USE db_loja_a;
SELECT CONCAT('R$ ', MAX(valor))AS MAIOR_VALOR FROM ordens_servico;