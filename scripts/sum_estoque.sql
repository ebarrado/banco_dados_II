USE db_ecommerce;

#SOMA DA QUANTIDADE EM ESTOQUE

SELECT SUM(estoque) AS total_produtos 
FROM tb_produtos;